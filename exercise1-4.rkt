#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The "a-plus-abs-b" procedure works with the applicative-order evaluation as follows:
; 1. The operator is evaluated first, which is the if expression.
; 2. The predicate is evaluated, which is (> b 0).
; 3. The consequent is evaluated, which is +.
; 4. The alternative is evaluated, which is -.
; 5. The operands are evaluated, which are a and b.
; 6. The operator is applied to the operands, which is either + or -.
; 7. The resulting procedure (from the operator evaluation) is applied to the operands (from 5)
; 8. The resulting value is returned.
