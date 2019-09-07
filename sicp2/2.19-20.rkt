#lang sicp

(define no-more? null?)

(define first-denomination car)

(define except-first-denomination cdr)

(define (cc amount coins)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coins)) 0)
    (else (+ (cc amount (except-first-denomination coins))
             (cc (- amount (first-denomination coins)) coins)))))

(define ukr (list 1 2 5 10 25 50 100 200))

(cc 10 ukr)

(define (same-parity . args)
  (define remains (remainder (car args) 2))
  (define (iter filtered inargs)
    (cond ((null? inargs) filtered)
          ((= (remainder (car inargs) 2) remains) (iter (cons filtered (car inargs)) (cdr inargs)))
          (else (iter filtered (cdr inargs)))))
  (iter (car args) (cdr args)))

(same-parity 1 2 3 4)
(same-parity 2 3 4 5)
