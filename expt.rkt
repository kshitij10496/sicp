#lang racket

(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))
  )
)

(define (iexpt b n)
  (define (expt-iter b counter product)
    ( if (= counter 0) 
      product
      (expt-iter b
        (- counter 1)
        (* product b))))
  (expt-iter b n 1)
)

(define (fast-expt b n)
  (define (square x) (* x x))
  (define (even? n) (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))
  )
)