#lang sicp

(define (fold-right op empty seq)
  (if (null? seq)
      empty
      (op (car seq)
          (fold-right op empty (cdr seq)))))

;;;(fold-right list '() (list 1 2 3))

(define (fold-left op empty seq)
  (define (iter result remain)
    (if (null? remain)
        result
        (iter (op result (car remain))
              (cdr remain))))
  (iter '() seq))

;;;(fold-left list '() (list 1 2 3))

;;; op should satisfy transitive property -
;;; (op a b) should be equal (op b a)

(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) '() seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) (cons y x)) '() seq))

(reverse-right (list 1 2 3))
(reverse-left (list 1 2 3))
