#lang racket

(require racket/bool)

(provide fast-prime?)

(define (fermat-test n)
    (define (square x) (* x x))
    (define (expmod base exp m)
        (cond ((= exp 0) 1)
                ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
                (else (remainder (* base (expmod base (- exp 1) m)) m))))
    (define (try a)
        (= (expmod a n n) a))
    (try (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((< n 2) false)
        ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
