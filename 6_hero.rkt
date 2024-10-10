#lang racket
(require rackunit)

; create a self contained method that manages the health, experience and level of a game character
(define (make-hero health level experience)
    (define (take-damage amount)
        (if ( > = health amount)
            (begin(set! health (- health amount))health)
            ;(if (> level 1) ; checks to see if level is greater than 1
                ;(begin (set! health (-level 1)); set! passes through variable health to subtract a level
            (begin (displayln("Insufficient health. You probably have died.") health))))
     ; a hero should be able to fight, heal and level up
    (define (heal amount)
      (if (< health 100)
          (begin (set! health 100) health)
          health)
      (displayln "Unknown action."))
    ;(define (heal amount)
     ; (if (< health 100)
      ;  (begin (set! health 100) health))) ; set! changes the value of a variable
     ;(displayln ("Unknown action.")) ;CANNOT have else in this expression

    ; every fight gives the hero 50 experience points, when a hero reaches 100 experience points their level is incremented by 1
    (define (win-fight)
      (set! experience (+ experience 50)) ; giving hero 50 experience points
      (if (= experience 100)
          (set! level (+ level 1)) ; setting level to one higher (+1)
          level))

    (define (dispatch m)
      (cond ((eq? m 'take-damage) take-damage)
            ((eq? m 'win-fight) win-fight)
            ((eq? m 'heal) heal)
            ;else throw user friendly error
            (else (error "Unknown action: Your hero can't" m) 
       
                  )))
    dispatch
)
(define hero (make-hero 100 1 0)) ; making the hero 

(check-equal? ((hero 'take-damage) 15) 85)  ; health decremented to 85

;(check-equal? ((hero 'heal) 20) 100)       ; health increase to a max of 100
(check-equal? ((hero 'win-fight)) 1)       ; experience increased by 50, return level 1

;(check-equal? ((hero 'take-damage) 50) 50) ; health decremented to 50
;(check-equal? ((hero 'heal) 40) 90).       ; health increase to 90
;(check-equal? ((hero 'win-fight)) 2)       ; experience increased by 100, return level 2
;((hero 'cast-spell)) ; this should show a user friendly error, something like "Uknown action: You hero cannot cast-spell" 


; for bonus points: add the ability for your hero to die if their health reaches 0, this would decrement their level by 1
