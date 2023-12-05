#lang racket

(require "repeated.rkt")

(define (square n) (* n n))

((repeated square 2) 5)