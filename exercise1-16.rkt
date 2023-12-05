#lang racket

(define (ifast-expt b n)
    (define (square x) (* x x))
    (define (even? n) (= (remainder n 2) 0))
    (cond ((= n 1) b)
        ((even? n) (ifast-expt (square b) (/ n 2)))
        (else (ifast-expt ))
    )
)