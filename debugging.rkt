#lang racket
(require racket/trace)

; for debugging Racket 

(define numberlist '(1 2 3 4 5))
(define (accumulate operator null lst)
    (if (empty? lst)null(operator (car lst)
        (accumulate operator null (cdr lst)))))
(accumulate * 1 numberlist)
; shows you what has been done

; trace is another method for debugging 
(define numberlist2 '(1 2 3 4 5))
(define (accumulate2 operator null lst)
    (if (empty? lst)null(operator (car lst)
        (accumulate operator null (cdr lst)))))
(trace accumulate)
(accumulate * 1 numberlist)

; trace tells you what executes. Without trace you just get the numbers
; with trace you can log out all the recursions

