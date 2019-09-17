#lang racket
(#%require sicp-pict)

(define (flip-horiz painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)
   )
  )

(define (rotate-counterclock-180 painter)
  (transform-painter
   painter
   (make-vect 1.0 1.0)
   (make-vect 0.0 1.0)
   (make-vect 1.0 0.0)
   )
  )

(define (rotate-counterclock-270 painter)
  (transform-painter
   painter
   (make-vect 0.0 1.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)
   )
  )

(paint einstein)
(paint (flip-horiz einstein))
(paint (rotate-counterclock-180 einstein))
(paint (rotate-counterclock-270 einstein))
