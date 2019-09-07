#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define make-vector list)
(define make-matrix list)

(define (dot-product v1 v2)
  (accumulate + 0 (map * v1 v2)))

(dot-product (make-vector 1 2 3) (make-vector 1 2 3))

(define (matrix-*-vector m v)
  (accumulate cons '() (map (lambda (vn) (dot-product vn v)) m)))

(define test-matrix (make-matrix (make-vector 1 2) (make-vector 3 4))) 

(matrix-*-vector test-matrix (make-vector 1 1))

(define (transpose m)
  (accumulate-n cons '() m))

(transpose test-matrix)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix test-matrix (make-matrix (make-vector 1 1) (make-vector 1 1)))
