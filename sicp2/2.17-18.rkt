#lang sicp

(define (last-pair my-list)
  (if (null? (cdr my-list))
      my-list
      (last-pair (cdr my-list))))

(last-pair (list 1 2 3))

(define (reverse list1)
  (define (reverse-iter start reversed)
    (if (null? start)
        reversed
        (reverse-iter (cdr start) (cons (car start) reversed))))
  (reverse-iter list1 nil))

(reverse (list 1 2 3))
