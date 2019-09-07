#lang sicp

(define (for-each proc items)
  (define (iter items)
    (if (null? items)
        (newline)
        (begin (proc (car items))
               (iter (cdr items)))))
  (iter items))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 1 2 3))