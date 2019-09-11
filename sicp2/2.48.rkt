#lang sicp

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (make-segment x1 y1 x2 y2)
  (cons (make-vect x1 y1)
        (make-vect x2 y2)))
(define (start-segment segment)
  '((xcor-vect car segment) (ycor-vect car segment)))
(define (end-segment segment)
  '((xcor-vect cdr segment) (ycor-vect cdr segment)))
