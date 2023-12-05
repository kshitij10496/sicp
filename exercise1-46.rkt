#lang racket

(define tolerance 0.00001)

(define (average a b) (/ (+ a b) 2))

(define (square a) (* a a))

(define (iterative-improve good-enough? improve)
    (lambda (guess) 
        (if (good-enough? guess)
            guess
            ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt x)
    (define (close-enough? y) (< (abs (- (square y) x)) tolerance))
    (define (improve y) (average y (/ x y)))
    ((iterative-improve close-enough? improve) 1.0))

(define (fixed-point f guess)
    (define (close-enough? a b) ( (< abs(- a b) tolerance) ))
    ((iterative-improve
            (lambda (x) (close-enough? x (f x)))
            f) 
        guess))