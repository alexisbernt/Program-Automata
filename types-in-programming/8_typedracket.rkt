#lang typed/racket

; ASSIGNMENT: Typed Languages and Typed Racket

; Will return the types of an integer 
(: flexible-length (-> (U String (Listof Any)) Integer)) ; str-or-list is a union type of String or (Listof Any)

(define (flexible-length str-or-lst)
  (if (string? str-or-lst) ; check if str-or-lst is a string
      (string-length str-or-lst) ; call string-length (comes from Racket standard library)
      (length str-or-lst))) ; call length (comes from Racket standard library) 
(displayln (flexible-length "cheese burger")) ; typed racket is a bit slower

; -------

; here the line below will explicitly declare the type signature for "multiply":
(: multiply (Number Number -> Number)) ; types are passed to the function through type annotations
; (Number Number) means the function is going to take two arguments (that are both ints)
; (-> Number) means the function is going to return a Number 
(define (multiply num1 num2) ; num1 and num2 will be checked against the signature above bc of typed langauge
  (* num1 num2)) ; will be "type checked" and if != Number then compile error

(multiply 2 4) ; successfully passing type(s) to function multiply
; (multiply "this" 2) ; causes the method to fail bc you have a string not a Number