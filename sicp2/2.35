#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate (lambda (x y) (+ y x))
              0
              (map (lambda (element)
                     (if (pair? element)
                         (count-leaves element)
                         1))
                   tree
                   )))

(count-leaves (list 1 2 (list 3 4)))

