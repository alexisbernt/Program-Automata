#lang racket

; create the room class
(struct room (name content a a-desc b b-desc c c-desc d d-desc e e-desc f f-desc)) ; amount of choices possible per scenario
; Whenever using Racket struct every instance matches the arity (number of fields) defined in the struct.
; To do this: Use placeholders for fields that aren't relevant in specific cases.

; within the rooms we can access different components and then link to different parts of our story board w/n the game
(define A1 ; the finite state machine
  (room
   "The Starting Situation: " ; name of the room
   " It is cold outside (stupid winter) what would you like to do about it?" ; occurance / scenario
   "B1" ; B1 choice
   " --> I just exist" ; descriptor for B1
   "C1"
   " --> I go inside" ; descriptor for C1
   "D1"
   " --> I SQUAWK about it. (AKA: The Safety 222nd choice)"
   "" "" ; d and d-desc placeholders so no argument mismatch 
   "" "" ; e and e-desc placeholders
   "" "" ; f and f-desc placeholders
   )
  )

(define B1
  (room
   "Existing choice: " ; name of room
   " Congratulations, you existed... What would you like to do with your time on this planet?"
   "A1"
   " --> Screw it, I want to start over "
   "C1"
   " --> Safety 1st choice: I go inside"
   "D1"
   " --> I SQUAWK about it and hang out with the puffins because they understand life best"
   "" "" ; d and d-desc placeholders
   "" "" ; e and e-desc placeholders
   "" "" ; f and f-desc placeholders
   )
  )


(define C1
  (room
   "Safety 1st choice: "
   " You went inside. Outside scary: No touching grass (or ice) for you! You choose to protect yourself from the cold and go inside. "
   "A1" ; go back to start
   " --> Screw it, I want to start over"
   "B1"
   " --> Existing choice: I just exist"
   "D1"
   " --> Find a puffins because hopefully they have a muffin and I SQUAWK about it "
   "" "" ; d and d-desc placeholders
   "" "" ; e and e-desc placeholders
   "" "" ; f and f-desc placeholders
   )
  )

(define D1
  (room
   "Yay Good Choice! Your choice is: I SQUAWK about it " ; name of this scenario
   "Squawking earned you a muffin. Congratulations! What do you do about it?"
   "E1"
   " --> Consumption: Consume said muffin. Yummy yum yum in the tum tum tum."
   "F1"
   " --> Question everything: Hmmmmm what is this abstract muffin?"
   "" "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   )
  )

(define E1
  (room
   "The choice to consume: " ; name of this scenario
   "You choose to consume said muffin. Yummy yum yum in the tum tum tum. You earned yourself a muffin point! Click the boxes to reward yourself with a muffin point"
   "A1" ; go back to start
   " --> Pun + Muffin = Puffin"
   "A1" ; beginning again
   " --> Def Pun: A joke exploiting the different possible meanings of a word"
   "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" ; placeholders
   )
  )

(define F1
  (room
   "Question everything: "
   " Well... Yes! This game is obviously [EDUCATIONAL] so through questioning the muffin, known as the Transitive Property of Muffinmatic Sciences , you have learned to be skeptical. Your skepticism shall be rewarded with a pun. Now go navigate to the boxes and reward yourself with a puffin point! (Puffins are COOL)."
   "A1"
   " --> 'Muffin' compares to your smarts! You are too smart for this game anyway"
   "G1"
   " --> Where's my next pun, bruhffin?"
   "H1" 
   " --> Give me another pun honey muffin!"
   "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" ; placeholders
   )
  )

(define G1
  (room
   "Your 'Puffin Bro' is giving you another pun: "
   " What bird is always out of breath? ... A puffin!! Now go navigate to the boxes and reward yourself with a puffin point! (Puffins are COOL)."
   "A1"
   " --> Restart. Too punny for me. "
   "H1"
   " --> Another one! "
   "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" ; placeholders
   )
  )

(define H1
  (room
   "Your 'Honey Muffin' must really love you. Here's another pun: "
   " Why are you so good at everything? ... Because you're a stud-muffin!!!! Now go navigate to the boxes and reward yourself with a puffin AND MUFFIN point!"
   "A1"
   " --> Restart. Too punny for me "
   "A1"
   " --> I'm aware of my excellence "
   "I1" 
   " --> Interact with others who love puffins and muffins "
   "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" ; placeholders
   )
  )

(define I1
  (room
   "INTERACTIVE COMPONENT ALERT "
   " What other puns do you all know? Drop a sick pun that is like 'muffin' I have ever heard before! "
   "A1"
   " --> I have no puns "
   "A1"
   " --> Play Punny Muffin the Puffin game again "
   "I1" 
   " --> Stay here. I love interacting with others who love puffins and muffins "
   "" ; placeholders
   "" "" ; placeholders
   "" "" ; placeholders
   "" ; placeholders
   )
  )

; accessing things from Room 1
(displayln(room-name A1))
(displayln(room-a A1))

; function - think of this function as creating the story board 
(define (the-story step) ; a "match system" that will return all the steps avaliable within the room 
  (match step
    ["A1" A1]
    ["B1" B1]
    ["C1" C1]
    ["D1" D1]
    ["E1" E1]
    ["F1" F1]
    ["G1" G1]
    ["H1" H1]
    ["I1" I1]
    [default A1])
  )

(the-story "A1")
(displayln(room-name (the-story "A1")))

(define current(the-story "A1"))

; to create a hash map for that room 
(define (story-to-hash current-room)
  `#hash(
   (name . ,(room-name current-room))
   (content . ,(room-content current-room))
   (a ., `#hash(
           (step . , (room-a current-room))
           (description . ,(room-a-desc current-room))
           ))
   (b ., `#hash(
           (step . , (room-b current-room))
           (description . ,(room-b-desc current-room))
           ))
   (c ., `#hash(
           (step . , (room-c current-room))
           (description . ,(room-c-desc current-room))
           ))
   (d ., `#hash(
           (step . , (room-d current-room))
           (description . ,(room-d-desc current-room))
           ))
   (e ., `#hash(
           (step . , (room-e current-room))
           (description . ,(room-e-desc current-room))
           ))
   (f ., `#hash(
           (step . , (room-f current-room))
           (description . ,(room-f-desc current-room))
           ))
  ; (g ., `#hash(
    ;       (step . , (room-g current-room))
     ;      (description . ,(room-g-desc current-room))
     ;      ))
   ;(h ., `#hash(
      ;     (step . , (room-h current-room))
       ;    (description . ,(room-h-desc current-room))
       ;    ))
  ; (i ., `#hash(
     ;      (step . , (room-i current-room))
       ;    (description . ,(room-i-desc current-room))
      ;     ))
)
  )
; calling the hash function
(story-to-hash current)

; accessing things from Room 2
; (displayln(room-name B1))

; exporting for using this file in other files 
(provide the-story)
(provide story-to-hash)