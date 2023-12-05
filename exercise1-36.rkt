#lang racket

(require "fixed-point.rkt")

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)