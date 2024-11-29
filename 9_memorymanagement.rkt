#lang racket
(require rackunit ffi/unsafe) ; Use ffi/unsafe for weak references
; source for ffi/unsafe = using C-based APIs in Racket programs w/o C code

; Use a weak-box to "wrap" the variable meaning that the garbage collector (GC)
; can reclaim the object if there are no "strong references" 

; WEAK BOX: A weak box is similar to a normal box, but when the garbage collector can prove that the content value of a weak box is only reachable via weak references, the content of the weak box is replaced with #f.
; GARBAGE COLLECTION: garbage collection (GC) is an automatic process that helps manage memory. It finds and removes data (like variables, objects, or other resources) in a program that is no longer being used, freeing up memory for new tasks.

; #1 Maintain a reference after garbage collection
(define myVar-strong (make-weak-box "Hello, everyone!")) ; defining a variable
(collect-garbage)                          ; call garbage collection
(displayln (weak-box-value myVar-strong))         ; print the variable
; pass the following test:
(check-not-false (weak-box-value myVar-strong))   ; should not be false

; #2 Dereferencing a variable after GC using weak-box
; Allow the value to be garbage collected
(define myVar-weak (make-weak-box "Goodbye, World!")) ; define variable
(set! myVar-weak #f)                       ; remove strong reference and make weak
(collect-garbage)                          ; call garbage collection
(displayln (weak-box-value myVar-weak))    ; print out variable: Should print #f
(check-false (weak-box-value myVar-weak))  ; pass the following test, should be false