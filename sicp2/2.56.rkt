#lang sicp

(define (=number? exp test)
  (and (number? exp) (= exp test))    
  )

(define (sum? exp)
  (and (pair? exp) (eq? (car exp) "+"))
  )
(define (make-sum exp1 exp2)
  (cond
    ((=number? exp1 0) exp2)
    ((=number? exp2 0) exp1)
    (else (list "+" exp1 exp2))
    )
  )
(define addend cadr)
(define augend caddr)

(define (product? exp)
  (and (pair? exp) (eq? (car exp) "*"))
  )
(define (make-product exp1 exp2)
  (cond
    ((=number? exp1 1) exp2)
    ((=number? exp2 1) exp1)
    ((or (=number? exp1 0) (=number? exp2 0)) 0)
    (else (list "*" exp1 exp2))
    )
  )
(define multiplier cadr)
(define multiplicand caddr)

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
  (make-sum (make-exponentiation 'x 18)
            (make-product 'x (make-exponentiation 'y 3)))
  (make-product 'a 'y))
 'x)