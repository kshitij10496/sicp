#lang racket

(define (square x) (* x x))

(define (min x y z) 
        (cond ((and (or (< x y) (= x y)) (or (< x z) (= x z))) x)
              ((and (or (< y x) (= y x)) (or (< y z) (= y z))) y)
              (else z)
        ))


(define (sum-squares x y z) 
        (cond ((= (min x y z) x) (+ (square y) (square z)))
              ((= (min x y z) y) (+ (square x) (square z)))
              ((= (min x y z) z) (+ (square x) (square y)))
        )) 