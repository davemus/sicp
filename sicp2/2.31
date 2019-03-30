#lang sicp

(define (tree-map function tree)
  (cond ((pair? tree)
         (cons (tree-map function (car tree))
               (tree-map function (cdr tree))))
        ((null? tree)
         tree)
        ((number? tree)
         (function tree))))

(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))

(define hardlist
  (list 1 2
        (list 3 4 5)
        (list 6
              (list 7))
        8))

(square-tree hardlist)

