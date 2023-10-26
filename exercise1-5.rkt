#lang racket

(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y))

(test 0 (p))

; Applicative-order evaluation
; The interpreter first evaluates the operator to get the procedure to be applied, and then it evaluates the operands to get arguments.
; In this case, the interpreter will recurse infinitely evaluating the operand (p).

; Normal-order evaluation
; The interpreter first substitutes both the operands 0, (p) into the body of the procedure "test", and then evaluates the resulting body.
; In this case, the interpreter will return 0, as it never evaluates the operand (p).
