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

(define (enumerate start end)
  (define (iter generated step)
    (if (< step start)
        generated
        (iter (append (list step) generated) (- step 1))))
  (iter '() end))

(define (ordered-triples n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k)
                       (list i j k))
                (enumerate (+ j 1) n)))
              (enumerate (+ i 1) n)))
       (enumerate 1 n)))

(define (ordered-triples-sum-to-s n s)
  (filter (lambda (x) (= (accumulate + 0 x) s))
          (ordered-triples n)))

(ordered-triples-sum-to-s 5 10)

