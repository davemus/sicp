#lang sicp

;;; How it works:
;;; cons return lambda, that giving
;;; one function as argument returns
;;; result of applying this function
;;; to x and y

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define sth (cons 1 2))

(display (car sth))
(newline)
(display (cdr sth))
