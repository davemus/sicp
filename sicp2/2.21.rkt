#lang sicp

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items))

(define items (list 1 2 3 4 5))

(square-list-1 items)

(square-list-2 items)