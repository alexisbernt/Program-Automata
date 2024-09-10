#lang racket

(define x "abcdEf")
(define (toUpper) (string-upcase x))
(displayln (toUpper))

(define (toLower y) (string-downcase y))
(displayln (toLower x))

(define (getFirst) (string-ref x 0))
;(displayln (getFirst x))

(define (n2s v) (number->string v))
(displayln (n2s 2))

;(display (s2l s) (string->list s))
;(displayln (s2l "a2f"))


; quick helper function
(displayln (apply ~a '("abc" #\b 3)))
1234
(~a 1234)