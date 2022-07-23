; Define the procedure make-list, which takes nonnegative integer n and an object
; and returns a new list, n long, each element of which is the object.

; (make-list 7 '()) = > (() () () () () () ())

(define make-list
    (lambda (n x)
        (if (= n 0)
            '()
            (cons x (make-list (- n 1) x)))))


; The procedure length returns the length of its argument, which must be a list. For
; example, (length '(a b c)) is 3. Using length, define the procedure shorter,
; which returns the shorter of two list arguments. Have it return the first list if they
; have the same length.

; (shorter '(a b) '(c d e)) = > (a b)
; (shorter '(a b) '(c d)) = > (a b)
; (shorter '(a b) '(c)) = > (c)

(define shorter
    (lambda (ls1 ls2)
        (if (< (length ls2) (length ls1))
            ls2
            ls1)))


; another solution 

(define shorter?
    (lambda (ls1 ls2)
        (and (not (null? ls2))
            (or (null? ls1)
                (shorter? (cdr ls1) (cdr ls2))))))

(define shorter
    (lambda (ls1 ls2)
        (if (shorter? ls2 ls1)
            ls2
            ls1)))


; even & odd controller functions
; (even? 17) answer: #f
; (odd? 17) answer: #t

(define even?
    (lambda (x)
        (or (= x 0)
            (odd? (- x 1)))))

(define odd?
    (lambda (x)
        (and (not (= x 0))
            (even? (- x 1)))))


; factorial calculator functions. the first one is recursive and the second one is iterative 
(define factorial
    (lambda (n)
        (let fact ((i n))
            (if (= i 0)
                1
                (* i (fact (- i 1)))))))

(define factorial
    (lambda (n)
        (let fact ((i n) (a 1))
            (if (= i 0)
                a
                (fact (- i 1) (* a i))))))


;fibonacci 
(define fibonacci
    (lambda (n)
        (let fib ((i n))
            (cond
                ((= i 0) 0)
                (= i 1) 1)
                (else (+ (fib (- i 1)) (fib (- i 2)))))))


(define fibonacci
    (lambda (n)
        (if (= n 0)
            0
            (let fib ((i n) (a1 1) (a2 0))
                (if (= i 1)
                    a1
                    fib (- i 1) (+ a1 a2) a1)))))