#lang sicp

(define (gcd first second)
  (let (
       (greater (abs (max first second)))
       (lesser (abs (min first second)))
       )
    (cond ((= lesser 0) greater)
          (else (gcd lesser (- greater lesser))))))

(define (make-rat nomin denom)
  (let ((nomin-abs (abs nomin))
        (denom-abs (abs denom)))
    (let ((divisor (gcd (max nomin-abs denom-abs) (min nomin-abs denom-abs))))
      (if (or (and (> nomin 0) (> denom 0))
              (and (< nomin 0) (< denom 0)))
          (cons (/ nomin-abs divisor) (/ denom-abs divisor))
          (cons (- (/ nomin-abs divisor)) (/ denom-abs divisor))))))

(define (nomin rat) (car rat))

(define (denom rat) (cdr rat))

(define (display-rat rat)
  (newline)
  (display (nomin rat))
  (display "/")
  (display (denom rat)))

;; testing make-rat, display-rat
(define rat1 (make-rat -15 35))
(define rat2 (make-rat 15 35))
(define rat3 (make-rat 15 -35))
(define rat4 (make-rat -15 -35))

(display-rat rat1)
(display-rat rat2)
(display-rat rat3)
(display-rat rat4)
