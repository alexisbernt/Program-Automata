#lang racket

; create the room class
(struct room (name current a a-desc b b-desc c c-desc))

; within the rooms we can access different components and then link to different parts of our story board wn the game
(define A1
  (room
   "Room 1"
   "things happen in room 1"
   "B1"
   "b1 choice"
   "C1"
   "c1 choice"
   " ... "
   ""
   )
  )

(define B1
  (room
   "Room 2"
   "things happen in room 2"
   "A1"
   "choice to go back to A1"
   "C1"
   "c1 choice"
   " ... "
   "D1"
   )
  )

; function - think of this function as creating the story board 
(define (the-story step) ; a "match system" that will return all the steps avaliable within the room 
  (match step
    ["A1" A1]
    ["B1" B1]
    [default A1])
  )

(define current(the-story "A1"))
; to create a hash map for that room 
(define (story-to-hash current-room)
  #hash(
   (name . ,(room-name current-room))
   )
  )

; calling the hash function
(story-to-hash current)

(the-story "A1")
(displayln(room-name (the-story "A1")))

; accessing things from Room 1
(displayln(room-name A1))
(displayln(room-a A1))

; accessing things from Room 2
(displayln(room-name B1))