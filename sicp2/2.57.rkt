#lang sicp

(define (filter predicate mylist)
  (cond ((null? mylist) nil)
        ((predicate (car mylist))
         (cons (car mylist) (filter predicate (cdr mylist))))
        (else (filter predicate (cdr mylist))))
  )

(define (memq item mylist)
  (cond ((= (length mylist) 0) #f)
        ((eq? item (car mylist)) mylist)
        (else (memq item (cdr mylist))))
  )

(define (=number? exp test)
  (and (number? exp) (= exp test))    
  )

(define (sum? exp)
  (and (pair? exp) (eq? (car exp) "+"))
  )
(define (make-sum . arguments)
  (let ((myfiltered (filter (lambda (arg) (not (=number? arg 0))) arguments)))
    (cond
      ((= (length myfiltered) 0) 0)
      ((= (length myfiltered) 1) (car myfiltered))
      (else (cons "+" myfiltered))
      )
    )
  )

(define addend cadr)
(define (augend exp)
  (if (pair? (cdr exp))
      (apply make-sum (cddr exp))
      (cdr exp))
  )

(define (product? exp)
  (and (pair? exp) (eq? (car exp) "*"))
  )
(define (make-product . arguments)
  (let ((myfiltered (filter (lambda (arg) (not (=number? arg 1))) arguments)))
    (cond
      ((= (length myfiltered) 0) 1)
      ((= (length myfiltered) 1) (car myfiltered))
      ((memq 0 myfiltered) 0)
      (else (cons "*" myfiltered))
      )
    )
  )
(define multiplier cadr)
(define (multiplicand exp)
  (if (pair? (cdr exp))
      (apply make-product (cddr exp))
      (cdr exp))
  )

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) "**"))
  )
(define (make-exponentiation exp1 exp2)
  (cond
    ((=number? exp2 0) 1)
    ((=number? exp1 0) 0)
    (else (list "**" exp1 exp2))
    )
  )
(define base cadr)
(define exponent caddr)
    

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
        ((exponentiation? exp)
         (if (same-variable? (base exp) var)
             (make-product (exponent exp)
                           (make-exponentiation (base exp)
                                                (- (exponent exp) 1)))
             0
             ))
        (else (error "Error"))
        )
  )

(deriv
 (make-sum
  (make-exponentiation 'x 18)
  (make-product 'x (make-exponentiation 'y 3))
  (make-product 'a 'y 'l)
  (make-product 'a 'x 'z)
  )
 'x
 )
