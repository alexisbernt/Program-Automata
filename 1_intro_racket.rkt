#lang racket

(display "hello world")
(displayln "yellow world")

; prefix notation
(+ 1 2 3 )

(define a 10)
(define b 10)

(* a b 9)
(define bx
  (* b (+ 1 ( / 10 2)))
  )

(displayln bx)

(define add (lambda (x y) (+ x y)))
(add 9 5)

(list 1 2 3 5 8 13)

(define list_x (list 2 4 6 8))
(displayln list_x)

(cons "android" "osx")

(define oses (cons "android" "holyos"))
(displayln oses)

(define unit1 12)
(define unit2 12)
(equal? unit1 unit2)