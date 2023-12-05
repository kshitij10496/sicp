#lang racket

(require "fixed-point.rkt")

(define (golden-ratio n)
    (define (transform x) (+ 1 (/ 1 x)))
    (fixed-point transform 1.0))