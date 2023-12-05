#lang racket

(require "fixed-point.rkt")
(require "newton-method.rkt")


;;; 1.1.7: Square Roots by Newton's Method 
(define (abs x) (if (< x 0) (- x) x))

(define (average x y) (/ (+ x y) 2.0) )

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


;;; 1.3.4 Fixed-point Method
(define (average-damp f)
    (lambda (x) (average x (f x)))
)

(define (sqrt2 x) 
    (fixed-point (average-damp (lambda (y) (/ x y)))
                1.0))

(define (cube-root x) 
    (fixed-point (average-damp (lambda (y) (/ x (square y))))
                1.0))

;;; 1.3.4 Newton's Method
(define (sqrt3 x)
    (newton-method (lambda (y) (- (square y) x))
        1.0
    )
)