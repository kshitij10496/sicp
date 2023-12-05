#lang racket

(require "fixed-point.rkt")

(provide newton-method)

(define dx 0.00001)

(define (square x) (* x x))

(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) 
                        (g x)) 
                    dx)))

(define (newton-transform g)
    (lambda (x) (- x
                    (/ (g x)
                        ((deriv g)(x))))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) 
                    guess))
