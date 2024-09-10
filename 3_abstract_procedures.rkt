#lang racket

(define s2 "something different")

(displayln s2)

(define (twice callBackFunction initialValue)
  (callBackFunction (callBackFunction initialValue))) ;passing through variables f and v

(define (make-add-suffix s2)
  (lambda (s) (string-append s s2)))

(twice (make-add-suffix "!") "hello")

(twice (make-add-suffix "...") "hello")

(twice (make-add-suffix "?!") "hello")

(displayln s2)

; an expression is any syntax that evaluates down to a value

;#lang racket

(define (expensive-a) (displayln "Expensive A"))
(define (expensive-b) (displayln "Expensive B"))

(displayln "-- form")
(if (> 1 2) (expensive-a) (expensive-b))
; Expensive B

(displayln "--function")

(define (iif a b c)    (if a b c))
(iif (> 1 2)    (expensive-a)    (expensive-b))
