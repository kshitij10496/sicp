#lang racket

(require "../gcd.rkt")

 (define (make-rat n d) 
   (let ((g (abs (gcd n d))) 
        (abs-d (abs d))) 
     (cons (/ (* n (/ d abs-d)) g) 
           (/ abs-d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x))
)

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                (* (numer y) (denom x)))
            (* (denom x) (denom y))        
    ))

(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                (* (numer y) (denom x)))
            (* (denom x) (denom y))        
    ))

(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))


(define (div-rat x y)
    (make-rat (* (numer x) (denom y)
            (* (denom x) (numer y)))))

(define (equal-rat x y)
    (= (* (numer x) (denom y)
            (* (denom x) (numer y)))))


(define one-half (make-rat 1 2))
(print-rat one-half) ; 1/2

(define one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third)) ; 5/6
(print-rat (mul-rat one-half one-third)) ; 1/6
(print-rat (add-rat one-third one-third)) ; 2/3

(print-rat (make-rat 6 9)) ; 2/3 
(print-rat (make-rat -6 9)) ; -2/3 
(print-rat (make-rat 6 -9)) ; -2/3 
(print-rat (make-rat -6 -9)) ; 2/3 