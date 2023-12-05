#lang racket

(require "cont-frac.rkt")

(define (euler-formula-for-e k)
    (+ 2
        (cont-frac (lambda (i) 1.0)
            (lambda (i) 
                (if (= (remainder i 3) 2)
                    (/ (+ i 1) 1.5)
                    1.0))
            k)))