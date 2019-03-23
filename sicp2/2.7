#lang sicp

(define (make-interval x y)
  (if (<= x y)
      (cons x y)
      (cons y x)))
(define lower-bound car)
(define upper-bound cdr)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (spans-zero? y)
      (error "Possible zero division")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (add-interval
   x
   (make-interval (- 0 (upper-bound y))
                  (- 0 (lower-bound y)))))

(define (spans-zero? x)
  (or (or (= (upper-bound x) 0) (= (lower-bound x) 0))
      (and (< (lower-bound 0) 0) (> (upper-bound 0)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (- (upper-bound i) (lower-bound i)))

(define (make-center-percent center percent)
  (make-center-width center (* center (/ percent 100))))

(define (percent interval)
  (* (/ (width interval) (center interval)) 100))
