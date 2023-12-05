#lang racket

(define (product term a next b) 
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b)
        )))

(define (factorial n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (product identity 1 inc n))

(define (product-pi a b)
    (define (inc x) (+ x 1))
    (define (even? n) (= (remainder n 2) 0))
    (define (pi-term n)
        (if (even? n)
            (/ (+ n 2) (+ n 1))
            (/ (+ n 1) (+ n 2))))
    (* (product pi-term a inc b) 4))

(define (iproduct term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1)
)