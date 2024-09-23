#lang racket
(require rackunit)


; TASK 1: create a function called plus5 that will iterate through a list and add 5 to each number
(define (plus5 x) ; x represents the list
  (if (empty? x) ; checking to make sure x is not empty
      '()
      (cons (+ 5 (first x)) ; adding 5 to the first element in the list x
            (plus5 (rest x))))) ; using recursion to go through the rest of the list
(define fiblight '(0 1 2 3 5 8 13))
(printf "Starting list: ")
(displayln fiblight)
(printf "Plus 5 to the list: ")
(displayln (plus5 fiblight))
(printf "Comparing list: ")
(check-equal? (plus5 fiblight) '(5 6 7 8 10 13 18))
(displayln (plus5 fiblight))

(printf "\n")
; TASK 2: create a function call plus13 that will iterate through a list and add 13 to each number
(define (plus13 y) ; y represents the list
  (if (empty? y) ; checking to make sure x is not empty
      '() ; if it is empty return an empty list
      (cons (+ 13 (first y)) ; adding 13 to the first element in the list y
            (plus13 (rest y))))) ; using recursion to go through the rest of the list
(define fiblight2 '(0 1 2 3 5 8 13))
(printf "Starting list: ")
(displayln fiblight2)
(printf "Plus 13 to the list: ")
(displayln (plus13 fiblight2))
(printf "Comparing list: ")
(displayln (plus13 fiblight))
(check-equal? (plus13 fiblight2) '(13 14 15 16 18 21 26))

; TASK 3: create a function called plusX that can accept a number to add
; pass the following tests for adding 5 to all numbers and adding 13 to all numbers
(define fiblight3 '(0 1 2 3 5 8 13))
(displayln"\n")
(printf"Starting list: " )
(displayln fiblight3)

(define (plusX list-a num)
  (if (empty? list-a) ; checking to make sure list is not empty
      '() ; if it is empty return an empty list
      (cons (+ num (first list-a)) ; adding the number to the first element in the list (called list-a)
            (plusX (rest list-a) num)))) ; using recursion to go through the rest of the list


(define fiblist3 (plusX fiblight3 5))
(printf"Adding num 5 to list: ")
(displayln fiblist3)
(printf"Adding num 13 to list: ")
(check-equal? fiblist3 '(5 6 7 8 10 13 18))

(define fiblist4 (plusX fiblight3 13))
(displayln fiblist4)
(check-equal? fiblist4 '(13 14 15 16 18 21 26))