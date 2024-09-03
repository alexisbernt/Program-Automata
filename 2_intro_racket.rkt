#lang racket

(define (function-name-squared x)
  (* x x)) ; this shows that Racket is prefix notation

(function-name-squared 4) ; calling the function

(function-name-squared(+ 10 10)) ; functions are building blocks on top of oneanother

;const s2 = (x) => x*x;

(define (sum-of-squares x y)(+(function-name-squared x)(function-name-squared y)))

(sum-of-squares 3 4) ; should return 25

; conditions
(define (abs x)
  (cond ((> x 0) x)
  ((= x 0) 0)
  ((< x 0) (- x))))
  

(abs -5) ; should return 5

(exact? (+ 3/7 0.75))
(exact? (+ 3/7 3/4))