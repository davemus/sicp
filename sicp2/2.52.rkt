#lang racket
(#%require sicp-pict)

(define (segment-sct x1 y1 x2 y2)
  (make-segment (make-vect x1 y1) (make-vect x2 y2)))

(define wave
  (segments->painter
   (list
    (segment-sct 0.20 0.00 0.35 0.50)
    (segment-sct 0.35 0.50 0.30 0.60)
    (segment-sct 0.30 0.60 0.15 0.45)
    (segment-sct 0.15 0.45 0.00 0.60)
    (segment-sct 0.00 0.80 0.15 0.65)
    (segment-sct 0.15 0.65 0.30 0.70)
    (segment-sct 0.30 0.70 0.40 0.70)
    (segment-sct 0.40 0.70 0.35 0.85)
    (segment-sct 0.35 0.85 0.40 1.00)
    (segment-sct 0.60 1.00 0.65 0.85)
    (segment-sct 0.65 0.85 0.60 0.70)
    (segment-sct 0.60 0.70 0.75 0.70)
    (segment-sct 0.75 0.70 1.00 0.40)
    (segment-sct 1.00 0.20 0.60 0.48)
    (segment-sct 0.60 0.48 0.80 0.00)
    (segment-sct 0.40 0.00 0.50 0.30)
    (segment-sct 0.50 0.30 0.60 0.00)
    (segment-sct 0.45 0.80 0.55 0.80)
    (segment-sct 0.45 0.80 0.48 0.76)
    (segment-sct 0.48 0.76 0.52 0.76)
    (segment-sct 0.52 0.76 0.55 0.80)
    )
   )
  )

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (beside (up-split painter (- n 1))
                        (corner-split painter (- n 1))))
            (down (beside painter
                          (right-split painter (- n 1)))))
        (below down up))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert
                                  rotate180
                                  identity
                                  flip-horiz
                                  )))
    (combine4 (corner-split painter n))))

(paint wave)
(paint (corner-split einstein 3))
(paint (square-limit einstein 3))

