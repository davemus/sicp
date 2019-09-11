#lang sicp

(define (l_make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (l_origin frame)
  (car frame))
(define (l_edge1 frame)
  (cadr frame))
(define (l_edge2 frame)
  (caddr frame))

(define (c_make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (c_origin frame)
  (car frame))
(define (c_edge1 frame)
  (cadr frame))
(define (c_edge2 frame)
  (cddr frame))

;;; test. string instead vectors
(define vectors '("origin" "edge1" "edge2"))

(define frame1 (apply l_make-frame vectors))
(l_origin frame1)
(l_edge1 frame1)
(l_edge2 frame1)

(define frame2 (apply c_make-frame vectors))
(l_origin frame1)
(l_edge1 frame1)
(l_edge2 frame1)