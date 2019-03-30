#lang sicp

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define (square-tree-direct tree)
  (cond ((pair? tree)
         (cons (square-tree-direct (car tree))
               (square-tree-direct (cdr tree))))
        ((null? tree)
         tree)
        ((number? tree)
         (* tree tree))))


(define hardlist
  (list 1 2
        (list 3 4 5)
        (list 6
              (list 7))
        8))

(square-tree-direct hardlist)
(square-tree hardlist)

