(define (f x)
  (g x 6))
(define (g x y)
  (+ x y))

(let ((a 11))
    (let ((b (* a 5)))
(+ a b)))
#|
7.2 Put in the missing parentheses:

(let ((pi 3.14159)
     (pie 'lemon meringue))
    (se ('pi is pi 'but pie is pie)))
  |#
#|
pie: undefined;
 cannot reference undefined identifier

7.3 The following program doesn't work. Why not? Fix it.

(define (superlative adjective word)
  (se (word adjective 'est) word))
it will not work because word is second argument
|#
(define (superlative adjective wd)
  (se (word adjective 'est) wd))
#|
 (superlative 'dumb 'exercise)
'(dumbest exercise)
 (superlative 'strong 'man)
'(strongest man)

|#
(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))
#|
this program is taking + as * and * as plus. it will multiply b with be which is in example 4 and will get 16
then multiply a with a which is 3 and will get 9. finally it will add both a and b and will give 25.
|#