#lang racket

(require "newton-method.rkt")

(define (cubic a b c)
    (lambda (x) (+ (* x x x)
        (* a x x)
        (* b x)
        c)))

(define (root a b c)
    (newton-method (cubic a b c) 1)
)