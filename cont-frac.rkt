#lang racket

(provide cont-frac)

(define (cont-frac n d k) 
    (define (frac-iter i result)
        (if (= i 0)
            result
            (frac-iter (- i 1)
                (/ (n i)
                   (+ (d i) result)))))
    (define (frac-rec i) 
        (/ (n i)
            (+ (d i)
                (if (= i k)
                    0
                    (frac-rec (+ i 1))))))
    (if (= k 0)
        0
        (frac-rec 1)))