#lang sicp

(define (filter predicate? seq)
  (cond ((null? seq) nil)
        ((predicate? (car seq)) (cons (car seq) (filter predicate? (cdr seq))))
        (else (filter predicate? (cdr seq)))))

(define (accumulate op empty seq)
  (if (null? seq)
      empty
      (op (car seq)
          (accumulate op empty (cdr seq)))))

(define (flatmap op seq)
  (accumulate append nil (map op seq)))

(define (remove item s)
  (filter (lambda (x) (not (= x item)))
          s))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (enumerate start end)
  (define (iter generated step)
    (if (< step start)
        generated
        (iter (append (list step) generated) (- step 1))))
  (iter '() end))

(permutations (list 1 2 3))

(enumerate 1 5)

(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate (+ i 1) n)))
   (enumerate 1 n)))

(unique-pairs 3)

(define (prime? num)
  (define (prime-iter step)
    (cond ((= step 1) #t)
          ((= (remainder num step) 0) #f)
          (else (prime-iter (- step 1)))))
  (prime-iter (floor (/ num 2))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cdr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum (unique-pairs n)))

(prime-sum-pairs 5)

