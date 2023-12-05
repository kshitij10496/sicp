#lang racket

(require "compose.rkt")

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose square inc) 6)