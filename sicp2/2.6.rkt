#lang sicp

;;;; translating into lambda expressions
;;;; A - lambda
;;;; // - step, that goes to next line

;;; zero = Afx.x
;;; add-1 = Anfx.f((n f) x)

;;; one = (add-1 zero)
;;; one = Anfx.f((n f) x) Afx.x  // lambda-conversion
;;; one = Anfx.f((n f) x) Agy.y  // beta-reduction
;;; one = Afx.f((Agy.y f) x)     // --//--
;;; one = Afx.f(Ay.y x)          // --//--
;;; one = Afx.fx

;;; could be (define (one a) (lambda (b) (a b)) but below version is better
(define one (lambda (f) (lambda (x) (f x))))

;;; two = (add-1 one)
;;; two = Anfx.f((n f) x) Afx.fx
;;; two = Anfx.f((n f) x) Agy.gy
;;; two = Afx.f((Agy.gy f) x)
;;; two = Afx.f(Ay.fy x)
;;; two = Afx.f(f x)

(define two (lambda (f) (lambda (x) (f (f x)))))
