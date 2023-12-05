#lang racket

(define (abs x) (if (< x 0) (- x) x))

(define (average x y) (/ (+ x y) 2) )

(define (square x) (* x x))


(define (improve guess x)
    (average guess (/ x guess))
)

(define (good-enough? guess x) 
    (< (abs (- (square guess) x)) 
        0.001
    )
)

(define (sqrt-iter guess x) 
    (if (good-enough? guess x) 
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (sqrt x) (sqrt-iter 1.0 x))

(define (iff predicate then-clause else-clause)
    (
        cond (predicate then-clause)
             (else else-clause)
    )
)

(define (sqrt-iter-iff guess x) 
    (iff (good-enough? guess x) 
        guess
        (sqrt-iter-iff (improve guess x) x)
    )
)

(define (sqrt-iff x) (sqrt-iter-iff 1.0 x))

; Infinitely recursive because of the applicative-order evaluation of the iff procedure.