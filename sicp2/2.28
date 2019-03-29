#lang sicp


(define (fringe tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))

(list 1 2 3 4 5)

(fringe (list 1 2 (list 3 (list 4 5))))