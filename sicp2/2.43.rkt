#lang sicp

(define (enumerate-interval low high)
   (cond ((> low high) '())
         ((= low high) (list high))
         (else (cons low (enumerate-interval (+ 1 low) high)))))

(define (filter pred? some-list)
  (define (filter-step proc rest)
    (cond ((null? rest) proc)
          ((pred? (car rest)) (filter-step (cons (car rest) proc) (cdr rest)))
          (#t (filter-step proc (cdr rest)))))
  (reverse (filter-step '() some-list)))

(define (accumulate combiner beginning to_proc)
  (define (acc-step proc rest)
    (cond ((null? rest) proc)
          (#t (acc-step (combiner proc (car rest)) (cdr rest)))))
  (acc-step beginning to_proc))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define make-pos cons)
(define get-row car)
(define get-col cdr)

(define empty-board '())

(define (safe? k positions)
  (let ((target (car (reverse positions)))
        (compare-to (car positions)))
    (let ((col1 (get-col target))
          (row1 (get-row target))
          (col2 (get-col compare-to))
          (row2 (get-row compare-to)))
      (cond ((null? (cdr positions)) #t)
            ((or
              (= (abs (- row1 row2))
                 (abs (- col1 col2)))
              (= (get-col compare-to) (get-col target))
              (= (get-row compare-to) (get-row target))
              ) #f)
            (#t (safe? k (cdr positions)))))))

(define (adjoin-position new-row new-col rest)
  (cond ((null? rest) (list (make-pos new-row new-col)))
        (#t (append rest (list (make-pos new-row new-col))))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(enumerate-interval 1 2)
(filter (lambda (x) (not (= x 0))) '(0 1 2))
(flatmap (lambda (x) (list x x x)) '(0 1 2))

(queens 8)


;;; In case of order in exercise 2.42 we calculate k_{-1} k times for every k
;;; In case of order in exercise 2.43 we calculate k_{-1} k * board-size times
