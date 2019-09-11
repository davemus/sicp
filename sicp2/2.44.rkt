#lang sicp

(define (up-split painter n)
  (if (= n 0)
      (below painter (beside painter painter))
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
