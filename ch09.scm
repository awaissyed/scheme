#|

(define (add–three–to–each sent)
(every (lambda (number) 
         (+ number 3)) sent))


(add–three–to–each '(1 9 9 2))

((lambda (a b) (+ (* 2 a) b)) 5 6)

((lambda (wd) (word (last wd) (first wd))) 'impish)

(keep (lambda (n) (member? 9 n)) '(4 81 909 781 1969 1776))

(accumulate (lambda (this that)
                (if (> (count this) (count that)) this that))
              '(wild honey pie))

(every (lambda (wd) (se (first wd) wd (last wd)) )
         '(only a northern song))

((lambda (wd) (se (first wd) wd (last wd))) '(only a northern song)) 
         
(keep (lambda (person) (member? person '(john paul george ringo)))
        '(mick smokey paul diana bill geddy john yoko keith reparata))


(define (make–adder num)
  (lambda (x) (+ x num)))

((make–adder 4) 7)

(every (make–adder 6) '(2 4 8))

(every (make–adder 8) '(2 4 8))

(lambda (x) (+ x 4))


(define (let-it-be sent)
  (accumulate (lambda (x y) y) sent))

(every let-it-be '(afa dsfsa fd imran dwwood fasil))

(define (same–arg–twice fn)
  (lambda (arg) (fn arg arg)))
((same–arg–twice word) 'hello)

(define (square x)
  (* x x))


(define (flip fn)
  (lambda (a b) (fn b a)))

((flip -) 5 8)
|#
(every (lambda (x) (last (bl x))) '(all togather now))
(define (backward wd) (accumulate (lambda (a b) (word b a)) wd))

(define (keep-h sent)
  (keep (lambda (wd) (member? 'h wd))sent))

#|

Exercises
9.1 What will Scheme print? Figure it out yourself before you try it on the computer.
|#
(lambda (x) (+ (* x 3) 4)) ;false
((lambda (x) (+ (* x 3) 4)) 10)




(every (lambda (wd) (word (last wd) (bl wd)))
         '(any time at all))
#|
9.2 Rewrite the following definitions so as to make the implicit lambda explicit.
(define (second stuff)
  (first (bf stuff)))
(define (make-adder num)
  (lambda (x) (+ num x)))

|#

(define second (lambda (stuff) (first (bf stuff))))

(define make-adder (lambda (num) (lambda (x) (+ num x))))
#|
9.3 What does this procedure do?
|#

(define (let-it-be sent)
  (accumulate (lambda (x y) y) sent))
;it takes the sentence and returs last word of the sentence


#|
9.4 The following program doesn't work. Why not? Fix it.
(define (who sent)
  (every describe '(pete roger john keith)))

(define (describe person)
  (se person sent))

It's supposed to work like this:
> (who '(sells out))
(pete sells out roger sells out john sells out keith sells out)
|#
(define (who sent)
  (every (lambda (wd) (se wd sent)) '(pete roger john keith)))

(who '(sells out))

#|
In each of the following exercises, write the procedure in terms of lambda and higher-order functions. 
Do not use named helper procedures. If you've read Part IV, don't use recursion, either.

9.5 Write prepend–every:
> (prepend–every 's '(he aid he aid))
(SHE SAID SHE SAID)
> (prepend–every 'anti '(dote pasto gone body))
(ANTIDOTE ANTIPASTO ANTIGONE ANTIBODY)
|#

;(define (add-s  wd)
;  (word  's wd  ))

;(every add-s '(how are you))


(define (prepend-every pre se-nt)
   (every (lambda (x) (word pre x )) se-nt ))

(prepend-every 's '(he aid he aid))

(prepend-every 'anti '(dote pasto gone body))
#|
Prepend-very takes 2 arguments "pre" and "se-nt". this will be passed inside the lambda "pre" and in 
tihs case "pre" will have valu s. because of every x will have all the values of "se-nt" one by 
one and will stick "s" to each value.
|#

#|
9.6 Write a procedure sentence–version that takes a function F as its argument and returns a 
function G. F should take a single word as argument. G should take a sentence as 
argument and return the sentence formed by applying F to each word of that argument.
> ((sentence–version first) '(if i fell))
(I I F)
> ((sentence–version square) '(8 2 4 6))
(64 4 16 36)
|#

(define (double x)
  (* x 2))

(define (square x)
  (* x x))

(define (sentence–version f)     ;function f whose out put is a function g
 
 (lambda (g) (every f g)))       ;function g, wich takes sentence as argument and returns sentence
                                 ;by applying functions f on its argument. 
  
  
 


((sentence–version square) '(8 2 4 6))

((sentence–version first) '(if i fell))

((sentence–version last) '(if i fell))

((sentence–version double) '(2 4 5))

