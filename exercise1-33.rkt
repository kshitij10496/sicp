#lang racket

(require "prime.rkt")
(require "gcd.rkt")

(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b) 
        null-value
        (combiner (if (filter a) (term a) null-value)
                  (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (prime? x) (fast-prime? x 100))

(define (sum-prime-squares a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (filtered-accumulate + 0 square a inc b prime?))

(define (product-relative-primes n)
    (define (identity x) x)
    (define (rel-prime? x) (= (gcd x n) 1))
    (define (inc x) (+ x 1))
    (filtered-accumulate * 1 identity 1 inc n rel-prime?))