(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 14
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 14
   (define (counter s i)
    (cond ((null? s) s)
    (else (cons (cons i (cons (car s) nil)) (counter (cdr s) (+ i 1))))))
  (counter s 0)
  ; END PROBLEM 14
  )


;; Problem 15

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 15
    (cond ((null? dict) #f)
      ((equal? (caar dict) key) (cadar dict))
      (else (get (cdr dict) key)))
  ; END PROBLEM 15
  )

;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 15
    (cond ((null? dict) (cons (cons key (cons val nil)) nil))
    ((equal? (caar dict) key) (cons (cons key (cons val nil)) (cdr dict)))
    (else (cons (car dict) (set (cdr dict) key val))))
  ; END PROBLEM 15
  )

;; Problem 16

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 16
  (cond ((null? problem) nil)
    ((equal? (car problem) '_____) (cons solution (solution-code (cdr problem) solution)))
    ((list? (car problem)) (cons (solution-code (car problem) solution) (solution-code (cdr problem) solution)))
    (else (cons (car problem) (solution-code (cdr problem) solution)))
    )
  ; END PROBLEM 16
  )
