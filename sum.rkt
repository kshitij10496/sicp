#lang racket

(define (sum-ints a b)
	(if (> a b)
		0
		(+ a 
			(sum-ints (+ a 1) b))))

(define (cube x) (* x x x))

(define (sum-cubes a b)
	(if (> a b)
		0
		(+ (cube a)
			(sum-cubes (+ a 1) b))))

(define (pi-sum a b) 
	(if (> a b)
		0
		(+ (/ 1.0 (* a (+ a 2)))
			(pi-sum (+ a 4) b))))

(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))

(define (inc x) (+ x 1))

(define (sigma-ints a b)
	(define (identity n) n)
	(sum identity a inc b))

(define (sigma-cubes a b)
	(sum cube a inc b))

(define (sigma-pi a b)
	(define (pi-term n)
		(/ 1.0 (* n (+ n 2))))
	(define (pi-next n)
		(+ n 4))
	(sum pi-term a pi-next b))

(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b)
		dx))