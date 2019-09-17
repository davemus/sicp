#lang racket  ;;; sicp uses mutable pairs, racket immutables. Contract violation
(#%require sicp-pict)

(define (segment-sct x1 y1 x2 y2)
  (make-segment (make-vect x1 y1) (make-vect x2 y2)))

(define cross
  (segments->painter
   (list
    (segment-sct 0.0 0.0 1.0 1.0)
    (segment-sct 0.0 1.0 1.0 0.0)
    )
   )
  )

(define outline
  (segments->painter
   (list
    (segment-sct 0.0 0.0 0.0 1.0)
    (segment-sct 0.0 1.0 1.0 1.0)
    (segment-sct 1.0 1.0 1.0 0.0)
    (segment-sct 1.0 0.0 0.0 0.0)
    )
   )
  )

(define dconst 0.75)

(define diamond
  (segments->painter
   (list
    (segment-sct 0.5 0.0 0.0 dconst)
    (segment-sct 0.5 0.0 1.0 dconst)
    (segment-sct 0.0 dconst (- 1 dconst) 1.0)
    (segment-sct 1.0 dconst dconst 1.0)
    (segment-sct dconst 1.0 (- 1 dconst) 1.0)
    )
   )
  )

;;; copied from github. I don't want to spend a lot of time on it
;;; https://stackoverflow.com/questions/13592352/compiling-sicp-picture-exercises-in-drracket
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
    )
   )
  )

;(paint cross)
;(paint outline)
;(paint diamond)
(paint wave)
