#lang racket

(provide repeated)

(define (repeated f n)
    (define (iter g i)
        (if (= i 1)
            g
            (iter (compose f g) (- i 1))))
    (iter f n))
