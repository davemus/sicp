#lang sicp

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

;; alternative implementation
;(define make-vect list) 
;(define xcor-vect car)
;(define ycor-vect cadr)

;; one more, strange one
;(define (make-vect first second)
;  (lambda (cmd)
;    (cond ((= cmd 0) first)
;          ((= cmd 1) second)
;          (#t (write "should provide defined command")))))
;(define (xcor-vect vector)
;  (vector 0))
;(define (ycor-vect vector)
;  (vector 1))

(define (add-vect first second)
  (make-vect
   (+ (xcor-vect first) (xcor-vect second))
   (+ (ycor-vect first) (ycor-vect second))))

(define (sub-vect first second)
  (make-vect
   (- (xcor-vect first) (xcor-vect second))
   (- (ycor-vect first) (ycor-vect second))))

(define (scale-vect vector scalar)
  (make-vect
   (* (xcor-vect vector) scalar)
   (* (ycor-vect vector) scalar)))

(define a (make-vect 1 1))
(define b (make-vect 0 1))

;(define sumvect (add-vect a b))
;(define subvect (sub-vect a b))
;(define sclvect (scale-vect a 3))

;(xcor-vect sumvect)
;(ycor-vect sumvect)