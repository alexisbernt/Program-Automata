#lang racket
; Modularity and State Lesson, 10/3/24

; PART A - Local State 
(define balance 100)
; we will mutate the balance state 
(define (withdraw amount)
  (if (>= balance amount)
      (begin
        (set! balance (- balance amount))
        balance ; muted variable
      )
      "Insufficient funds"))
(withdraw 25)
(withdraw 25)
(withdraw 60)
(withdraw 15)

(displayln"\n ")

; PART B - now we will be Encapsulating State (within an object)
; Think encapsulation (like a class) 
(define (make-account balance)
    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))balance)"Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))balance)
    (define (dispatch m) ; the dispatch method
      (cond ((eq? m 'withdraw) withdraw)
      ((eq? m 'deposit) deposit)
      (else (error "Unknown request: MAKE-ACCOUNT" m))))
     dispatch ; returning dispatch 
)
(define acc (make-account 100))
((acc 'withdraw) 50) ; 50
((acc 'withdraw) 60) ; "Insufficient Funds"
((acc 'deposit) 40)  ; 90
((acc 'withdraw) 60) ; 30
