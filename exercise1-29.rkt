#lang racket

(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))

(define (integral-simpson f a b n)
    (define h (/ (- b a) n))
    (define (even? x) (= (modulo x 2) 0))
    (define (coeff i)
        (cond ((or (= i 0) (= i n)) 1)
            ((even? i) 2)
            (else 4)))
    (define (term i) 
        (* (coeff i) (f (+ a (* i h)))))
    (define (next i) (+ i 1))
    (* (/ h 3.0) (sum term 0 next n)))