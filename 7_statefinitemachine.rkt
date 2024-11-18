#lang racket
; ASSIGNMENT: Create a simple finite state machine to represent a North/South traffic light 
; 1. The simple finite state machine to represent the North/South traffic light
(define (ns-fsm state)  ; a finite state machine is a machine with a limited amount of states 
  (cond ; conditional = perform different computations or actions depending on the value of Boolean expression
    [(equal? state 'green) (begin
                                (displayln "Green")
                                (sleep 2)  ; wait one second
                                (ns-fsm 'orange)  ; recursive / stop this state and start next one
                                )]
        [(equal? state 'orange) (begin
                                (displayln "Orange")
                                (sleep 1)
                                (ns-fsm 'red)
                                )]
        [(equal? state 'red) (begin
                                (displayln "Red")
                                (sleep 1)
                                (ew-fsm 'green) ; connecting the two FSMs (going to EW now) 
                                )]
    )
  )

; 2. Second simple finite state machine to represent the East/West traffic light
(define (ew-fsm state)  ; a finite state machine is a machine with a limited amount of states 
  (cond ; conditional = perform different computations or actions depending on the value of Boolean expression
    [(equal? state 'green) (begin
                                (displayln "Green")
                                (sleep 2)  ; wait one second
                                (ew-fsm 'orange)  ; recursive / stop this state and start next one
                                )]
        [(equal? state 'orange) (begin
                                (displayln "Orange")
                                (sleep 1)
                                (ew-fsm 'red)
                                )]
        [(equal? state 'red) (begin
                                (displayln "Red")
                                (sleep 1)
                                (ns-fsm 'green) ; connecting the two FSMs
                                )]
    [else (displayln "Action Not Available")]
    ))

(ns-fsm 'green) ; running the North/South finite state machine
;(ew-fsm 'green); Running the East/West finite state machine 