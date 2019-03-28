#lang sicp

(define (deep-reverse tree)
  (reverse (map (lambda (x)
                  (if (pair? x)
                      (reverse x)
                      x))
                tree)))

(deep-reverse (list 1 2 (list 3 4)))

