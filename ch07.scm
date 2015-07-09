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
----------------------------------------------------------------------------------------------------------------------------------------------
|#

(define (f x)
  (g x 6))
(define (g x y)
  (+ x y))


(define (roots a b c)
  (let ((discriminant (sqrt ( - (* b b) (* 4 a c)))))
    (se (/ (+ ( - b) discriminant) (* 2 a))
        (/ (- ( - b) discriminant) (* 2 a)))))

#|
7.1 The following procedure does some redundant computation.
(define (gertrude wd)
  (se (if (vowel? (first wd)) 'an 'a)
      wd
      'is
      (if (vowel? (first wd)) 'an 'a)
      wd
      'is
      (if (vowel? (first wd)) 'an 'a)
      wd))
> (gertrude 'rose)
(A ROSE IS A ROSE IS A ROSE)
> (gertrude 'iguana)
(AN IGUANA IS AN IGUANA IS AN IGUANA)
Use let to avoid the redundant work.
|#

(define (vowel? wd)
  (member? wd 'aeiou))

(define (gertrude wd)
  (let ((example (if (vowel? (first wd)) 'an 'a)))
        (se example  wd 'is example wd  'is  example wd )))

(gertrude 'rose)
(gertrude 'iguana)

#|
(let pi 3.14159
       pie 'lemon meringue
    se 'pi is pi 'but pie is pie)
  (PI IS 3.14159 BUT PIE IS LEMON MERINGUE)
|#


(let ((pi 3.14159)
       (pie '(lemon meringue)))
    (se 'pi 'is pi 'but 'pie 'is pie))

#|
7.3 The following program doesn't work. Why not? Fix it.
(define (superlative adjective word)
  (se (word adjective 'est) word))
It's supposed to work like this:
> (superlative 'dumb 'exercise)
(DUMBEST EXERCISE)
|#
(define (superlative adjective wd)
  (se (word adjective 'est) wd))

(superlative 'dumb 'exercse)

#|
7.4 What does this procedure do? Explain how it manages to work.
(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))

assigning + multiplicaion and  + addition. if a is 3 and b is 4 it wil give 25
|#

(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))

(sum-square 3 4)




