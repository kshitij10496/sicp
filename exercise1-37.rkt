#lang racket

(require "cont-frac.rkt")

(define (golden-ratio k) 
    (cont-frac (lambda (i) 1.0)
        (lambda (i) 1.0)
        k))
