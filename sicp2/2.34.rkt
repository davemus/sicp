#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (current-coeff higher-terms)
                (+ current-coeff (* higher-terms x)))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 1 1))

