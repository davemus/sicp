#lang sicp

(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (branch-weight branch)
  (if (not (pair? (branch-structure branch)))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-torque-balanced? branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      #t))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (* (branch-weight left) (branch-length left))
            (* (branch-weight right) (branch-length right)))
         (branch-torque-balanced? left)
         (branch-torque-balanced? right))))

(define branch1 (make-branch 4 2))
(define branch2 (make-branch 2 4))
(define mobile1 (make-mobile branch1 branch2))
(total-weight mobile1)

(define branch3 (make-branch 1 mobile1))
(define branch4 (make-branch 2 16))
(define mobile2 (make-mobile branch3 branch4))
(total-weight mobile2)
(balanced? mobile1)
(balanced? mobile2)

