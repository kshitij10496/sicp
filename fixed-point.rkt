#lang racket

(provide fixed-point)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) 
            tolerance))
    (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
        (try first-guess))

(fixed-point cos 1.0)

(fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0)

(define (sqrt x)
    (define (average x y) (/ (+ x y) 2))
    (fixed-point (lambda (y) (average y (/ x y))) 1.0))