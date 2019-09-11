#lang sicp

(define (split first-combinator second-combinator)
  (lambda (painter n)
    (if (= n 0)
        (first-combinator painter (second-combinator painter painter))
        (let ((smaller (concrete-split painter (- n 1))))
          (first-combinator painter (second-combinator smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
