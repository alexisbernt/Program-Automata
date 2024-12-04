#lang racket
(require racket/include)
(require web-server/servlet
         web-server/servlet-env
         web-server/http/json)

; working server should be:
; http://localhost:8008/story/step?step=A1

; require your story file
(require "story_game_1.rkt") ; if not in same folder than hardcode the path 

(define (make-app-state count name) ; create a class and then have helper functions to set or get the state of the state machine

  (define (inc-count) ; inc stands for increment count 
    (set! count (+ count 1))
  )

  (define (get-count)
    count
  )

  (define (set-name name-value)
    (set! name name-value)
  )

  (define (get-name)
    name
  )

  (define (dispatch m)
    (cond
      ((eq? m 'inc-count) inc-count)
      ((eq? m 'get-count) get-count)
      ((eq? m 'set-name) set-name)
      ((eq? m 'get-name) get-name)
      (else (error "Unknown Action: " m)
      )
    )
  )

  dispatch
)

(define app (make-app-state 0 "Alexis"))

;(struct hist (count) #:mutable)
;(define h (hist 0))
;(displayln (hist-count h))
;(set-hist-count! h (+ (hist-count h) 1))
;(displayln (hist-count h))

(define (not-found request)
  (let ((msg (format "~a not found" (url->string (request-uri request)))))
    (response/jsexpr `#hasheq((error . "not-found")
                              (reason . ,msg))
                     #:code 404)))

(define (response/error status code reason)
  (response/jsexpr `#hasheq((error . ,code) (reason . ,reason)) #:code status))

(define (hello/echo request)
  ((app'inc-count))
  (define binds (request-bindings/raw request))
  (displayln binds)
  (define name (extract-binding/single 'name (request-bindings request)))
  (displayln name)
  ((app 'set-name) name)
  (define response-hash `#hash((success . ,true) (name . ,name)))
  (hash-ref response-hash `name)
  (define count (~a ((app'get-count)) "X"))
  (response/jsexpr response-hash
                   #:headers (list (make-header #"X-COUNT" (string->bytes/utf-8 count)))
                   #:code 202
                   ))

(define (story/step request)
  (define binds(request-bindings/raw request))
  (define step (extract-binding/single 'step (request-bindings request)))
  (define current-room (the-story step))
  (define response-hash (story-to-hash current-room)) ; using helper function
  (response/jsexpr response-hash #:code 202))


(define (home request)
  (response/xexpr
   `(html
     (body
      (h1 "Hello World"))))
  )

(define-values (service-dispatch service-url)
  (dispatch-rules
   (("") #:method "get" home)
   (("hello") #:method "get" home)
   (("hello" "echo") #:method "get" hello/echo)
   (("story" "step") #:method "get" story/step)
   (else not-found))
  )

(define (the-service request)
  (service-dispatch request))

(define (main)
  (serve/servlet the-service
                 #:stateless? #t
                 #:port 8008
                 #:launch-browser? #f
                 #:servlet-regexp #rx""
                 ))

(main)