#lang sicp

(define (make-point x y)
  (cons x y))

(define (point-x point)
  (car point))

(define (point-y point)
  (cdr point))

(define (make-segment point1 point2)
  (cons point1 point2))

(define (first-point segment)
  (car segment))

(define (second-point segment)
  (cdr segment))

(define (average-point segment)
  (define (average num1 num2)
    (/ (+ num1 num2) 2))
  (make-point (average (point-x (first-point segment)) (point-x (second-point segment)))
              (average (point-y (first-point segment)) (point-y (second-point segment)))))

(define (print-point point)
  (display "(")
  (display (point-x point))
  (display ",")
  (display (point-y point))
  (display ")"))

(print-point (average-point (make-segment (make-point 1 3) (make-point 2 4))))
