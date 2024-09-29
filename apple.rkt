#lang racket
; no AI on this assignment
; Source used: https://docs.racket-lang.org/reference/module.html#%28form._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._~23~25printing-module-begin%29%29

; if we want just a certain part of the string
(displayln "Testing just parts of the string: " )
(string-ref "Red" 0)
(char->integer (string-ref "A" 0))
(char->integer(string-ref"apple" 0))

(displayln "\nHW: ")

; Strategy
(define (counter input-string)
  (string-length input-string))

(define input-string "apple")

; Print the result with a message
(printf "The string has ~a characters.\n" (counter input-string))

(define word
  (counter input-string))

; Modules can import code from other libraries in racket
(module word-chars racket/base ; racket/base =  a library w/ key Racket functionality (basic functions and data structures)
  (provide wordi) ; exporting wordi (not word defined above)
  ; recursive function used to print remaining letters
  (define (wordi x)
    (unless (zero? x)
      (printf "~a letters left\n" x)
      (wordi (sub1 x)))) ; subtract 1 from word and then use recursion by calling word
)

(require 'word-chars) 
(wordi word) ; using the word counter function above (num of chars in word) and passing that int to wordi

; NOTES
; recursively call and check the char in the string until the counter reaches its max

;(define (string-to-scalar str) ; str represents the string
    ;;implement recursive function to return scalar value for each letter
  ;(if (empty? str) ; checking to make sure string-to-scalar is not empty
      ;'() ; if it is empty return an empty list
      ;(char->integer (string-ref str 0))))
      
      ;;(string-to-scalar(str 1)))) ; using recursion to go through the rest of the list
  


;(trace string-to-scalar)
;(string-to-scalar input-string) ; 97.112.112.108.101

;(equal? (string-to-scalar input-string nums) "97.112.112.108.101")

; convert the string to a list

; set up function

; set up helper function

; add to the string

; add a period to the string

; has to be recursive

; be able to pass the last equal? test 