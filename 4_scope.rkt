#lang racket
(require rackunit)
(require math/number-theory)
; abstract procedures and how to simplify our program

; PART 1: refactor our isLogicalCompOperator function to have all logic/function in the same block scope, an example shown in video
(define (isLogicalCompOperator? x)
  (or (equal? x "and")
      (equal? x "or")
      (equal? x "not")))

(check-true (isLogicalCompOperator? "and"))
(check-true (isLogicalCompOperator? "or"))
(check-true (isLogicalCompOperator? "not"))
(check-false (isLogicalCompOperator? "if"))

; you can displayln or printf to display in terminal
(printf"Testing:\n")
; ~a is a place holder for result of the function call (found in documentation and slides)
(printf " 'and': ~a\n" (isLogicalCompOperator? "and"))
(printf " 'or': ~a\n" (isLogicalCompOperator? "or"))
(printf " 'not': ~a\n" (isLogicalCompOperator? "not"))
(printf " 'if': ~a\n" (isLogicalCompOperator? "if"))
(printf " 'or not': ~a\n" (isLogicalCompOperator? "or not"))

(printf"\n ")

; PART 2: create a function to verify that two numbers contain the same digits
(define (containsSameDigits? x y)
  ; source: Used ChatGPT to go from number->string converting number to a string
  (let ([digits-x (sort (string->list (number->string x)) char<?)]
        [digits-y (sort (string->list (number->string y)) char<?)]); using a list (converting string to list)
       (equal? digits-x digits-y))) ; checking to see if digits are equal (from x and y)
;checks 2
(displayln "Testing 2: \n")
(check-true (containsSameDigits? 356 365))
(check-true (containsSameDigits? 123 321))
(check-true (containsSameDigits? 6620 2606))
(check-false (containsSameDigits? 6620 2206))

; ~a is a place holder for result of the function call (found in documentation)
(printf " '356 and 365': ~a\n" (containsSameDigits? 356 365))
(printf " '3756 and 3725': ~a\n" (containsSameDigits? 3756 3725))
(printf " '6620 and 2606': ~a\n" (containsSameDigits? 6620 2606))
(printf " '6620 and 2206': ~a\n" (containsSameDigits? 6620 2206))



; PART 3: create a function to check if a number is prime
(define (numPrime? n)
  ; starting by creating a divisible function
  (define (divisible? a b)
    (= (remainder a b) 0))
  ; sqrt function from slides example (source: in-class slides on abstract procedures)
  (define (square x)    (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (sqrt x)
    (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
        (average guess (/ x guess)))
        (define (sqrt-iter guess x)
            (if (good-enough? guess x)guess(sqrt-iter (improve guess x) x)))
            (sqrt-iter 1.0 x))
  ; continuing numPrime? function
  (and (> n 1)
       ; goes through the range of numbers from 2 to the square root of n
       (for/and ([i (in-range 2 (+ 1 (sqrt n)))])
         ; checks to make sure not divisible 
         (not (divisible? n i)))))
(printf"\n " )
(check-true (numPrime? 5))
(check-false (numPrime? 10))
(displayln "testing 3: ")
; ~a is a place holder for result of the function call (found in documentation)
(printf " '5 is prime': ~a\n" (numPrime? 5))
(printf " '10 is prime': ~a\n" (numPrime? 10))


; PART 4: (define the-string "outside")
; print out the-string definition with displayln
; create a function called "i-need-closure" that can:
;   - create a definition called the-string (same name as above) with a different value
;   - print out a definition the-string with displayln
;   - return the new the-string definition
(define (i-need-closure x y)
  ; string=? to compare the two strings to see if they are equal
  (string=? x y))
; PREVIOUS ATTEMPT WORK
  ;(define (the-string x y)
  ;(let ([string-x (sort (string->list (number->string x)) char<?)]
   ;     [string-y (sort (string->list (number->string y)) char<?)])
    ;   (equal? digits-x digits-y)))
(printf"\n " )
(displayln "testing 4: ")
(printf "Is 'outside' and 'inside' the same? ~a\n" (string=? "outside" "inside"))
; (check-eq? (i-need-closure) "inside")
; (check-eq? the-string "outside")

; PART 5: create a function to generate a custom username a string
; the create name should be in the following format: 
;   - a 3 digit random number
;   - separated by a hyphen 
;   - followed by the string in upper case
;   - separated by a hyphen 
;   - followed by the same digits from above in reverse
;   - followed by the first letter in lower case
(printf"\n")
; creating the custom-username
(define (customerUserName ui)
  ; source: learned string-append from ChatGPT
  (define (getThreeNums) (random 100 999)) ; getting a 3 digit number btwn 100 and 999
  (define numbs (getThreeNums))
  (define numbs-str (number->string numbs)) ; function to convert number to string
  (define (reverseNumbs numbs2) ; reverse function
  (define numbsString (number->string numbs2)) ; a. converting the number to a string
  ; b. convert string to list
  (define stringList (string->list numbsString))
  ; c. reverse the list
  (define reverseList (reverse stringList))
  ; d. convert list to string
  (define listString (list->string reverseList))
  listString) ; return the reversed string (learned this type of return from a ChatGPT fix request

 ; putting it all together
 (string-append numbs-str "-" ui "-" (reverseNumbs numbs))) ; conver the numbs to a string to put the username in one string
; ORIGINALLY TRIED:
(display "-") ; putting the dash "-" between numbers and name
(display customerUserName)
(display "-") ; putting the dash "-" between numbers and name

(displayln"\nTesting 5: ")
(display (customerUserName "Timmy"))
(printf "\nTim returns something like ~a\n" (customerUserName "Tim")) ; would return something like  687-TIM-786t
(customerUserName "Cletus") ; would return something like 083-CLETUS-380c
; (customerUserName {STUDENT_NAME}) = 083-{STUDENT_NAME}-380c

; I wanted to learn how to get user input in racket
(printf"\n ")
(printf"Enter name: ")
; ui stands for user input
(define ui (read))
(displayln ui) ; displaying the user input 