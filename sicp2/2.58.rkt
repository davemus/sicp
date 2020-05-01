#lang sicp

;;; TODO too messy. Someday I should probably rewrite it, but not now

(define (filter predicate? mylist)
  (define (filter-rec filtered rest)
    (cond ((null? rest) filtered)
          ((predicate? (car rest)) (filter-rec (append filtered (list (car rest))) (cdr rest)))
          (else (filter-rec filtered (cdr rest)))))
  (filter-rec nil mylist))

(define (convert-to-list-if-needed elem)
  (if (and (pair? elem) (not (null? elem)))
      elem
      (list elem)))

(define (=number? exp test)
  (and (number? exp) (= exp test))    
  )

(define (myappend . arguments)
  (filter (lambda (x) (not (null? x))) (apply append (map convert-to-list-if-needed arguments))))

(define (byindex mylist index)
  (if (= index 0)
      (car mylist)
      (byindex (cdr mylist) (- index 1))))

(define (strip-parentheses exp)
  (define (strip-needed? exp)
    (apply + (map (lambda (x)
              (cond ((eq? x "(") 1)
                    ((eq? x ")") -1)
                    (else 0)))
            exp)))
  (let ((unpaired-parentheses (strip-needed? exp)))
    (cond ((> unpaired-parentheses 0) (slice exp unpaired-parentheses (length exp)))
          ((< unpaired-parentheses 0) (slice exp 0 (+ (length exp) unpaired-parentheses)))
          (else exp))))
   
(define (slice mylist start end)
  (define (slice-rec current-slice rest index)
    (cond ((> (+ index 1) end) current-slice)
          ((< index start) (slice-rec current-slice (cdr rest) (+ index 1)))
          (else (slice-rec (myappend current-slice (car rest)) (cdr rest) (+ index 1)))))
  (slice-rec nil mylist 0))

(define (delist exp)
  (if (= (length exp) 1)
      (car exp)
      exp))

(define (min-priority-position exp)
  (define (priority operation)
    (cond ((eq? operation "+") 1)
          ((eq? operation "*") 2)
          (else 10000)))
  (define (priority-modifier bracket)
    (cond ((eq? bracket "(") 1000)
          ((eq? bracket ")") -1000)
          (else #f)))
  (define (min-priority-rec current-position last-position last-priority modifier rest)
    (cond ((or (null? rest) (= last-priority 1)) last-position)
          ((priority-modifier (car rest)) (min-priority-rec (+ current-position 1) last-position last-priority (+ (priority-modifier (car rest)) modifier) (cdr rest)))
          ((< (+ (priority (car rest)) modifier) last-priority) (min-priority-rec (+ current-position 1) current-position (+ (priority (car rest)) modifier) modifier (cdr rest)))
          (else (min-priority-rec (+ current-position 1) last-position last-priority modifier (cdr rest)))))
  (min-priority-rec 0 nil 10001 0 exp))

(min-priority-position '("(" "a" "+" "b" ")" "*" "c"))

(define (first-operand exp)
  (delist (strip-parentheses (slice exp 0 (min-priority-position exp))))
  )

(define (second-operand exp)
  (delist (strip-parentheses (slice exp (+ (min-priority-position exp) 1) (length exp))))
  )

(define (sum? exp)
  (eq? (byindex exp (min-priority-position exp)) "+"))
(define (make-sum exp1 exp2)
  (cond
    ((=number? exp1 0) exp2)
    ((=number? exp2 0) exp1)
    (else (myappend "(" exp1 "+" exp2 ")"))))
(define addend first-operand)
(define augend second-operand)

(define (product? exp)
  (eq? (byindex exp (min-priority-position exp)) "*"))
(define (make-product exp1 exp2)
  (cond
    ((=number? exp1 1) exp2)
    ((=number? exp2 1) exp1)
    ((or (=number? exp1 0) (=number? exp2 0)) 0)
    (else (myappend "(" exp1 "*" exp2 ")"))))
(define multiplier first-operand)
(define multiplicand second-operand)

(define variable? symbol?)
(define (same-variable? exp1 exp2)
  (and (variable? exp1) (variable? exp2) (eq? exp1 exp2))
  )

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum
                         (make-product
                          (deriv (multiplier exp) var)
                          (multiplicand exp))
                         (make-product
                          (deriv (multiplicand exp) var)
                          (multiplier exp))))
        (else (error "Error"))
        )
  )

(define test-expression (make-product (make-sum 'a 'x) (make-product 'b 'y)))

(deriv test-expression 'x)
(deriv test-expression 'y)