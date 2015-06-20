


(se (word (bl (bl (first '(make a))))
          (bf (bf (last '(baseball mitt)))))
    (word (first 'with) (bl (bl (bl (bl 'rigidly))))
          (first 'held) (first (bf 'stitches))))
#|
'(matt wright)
|#

(se (word (bl (bl 'bring)) 'a (last 'clean))
    (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
          (last (first '(sunny days)))))
#|
'(brian harvey)
|#

(first 'banana)

#|
5.14 Write a procedure third that selects the third letter of a word (or the third word of a sentence).
|#

(define (third wd)
  (first (butfirst
           (butfirst wd))))

#|
(third 'awais)
'a
|#

  
#| 5.15 Write a procedure first-two that takes a word as its argument, 
returning a two-letter word containing the first two letters of the argument. 
|#  
(define (first-two wd)
  (word
    (first wd) (first (butfirst wd))))
#|
(first-two 'awais)
'aw

 (first-two 'ambulatory)
'am
|#

(define (two-first a b)
  (word (first a) (first b)))
#|
two-first 'awais 'syed)
             
'as
|#


(define (two-first-sent a)
  (word
    (first (first a))
    (first (first (butfirst a)))))
#|
(two-first-sent '(awais syed))
'as
> (two-first-sent '(aiza awais))
'aa
>              


5.17 Write a procedure knight that takes a person's name as its 
argument and returns the name with "Sir" in front of it.
|#
(define (knight a)
  (sentence 'Sir a))
#|  
(knight 'awais)
'(Sir awais)
> (knight '(awais syed))
'(Sir awais syed)

5.18 Try the following and explain the result:
|#
(define (ends word)
  (word (first word) (last word)))
#|
program will not work because argument of "ends" will confilct with procedure "word".
|#
(define (ends wd) (word (first wd) (last wd)))
#|
> (ends 'awais)

'as
5.20 Define a procedure to find somebody's middle names:

|#
(define (mid-name name)
  (bl (bf name)))
#|
(mid-name '(syed muhammad Awais))
'(muhammad)

(mid-name '(aiza awais))
'()
(mid-name '(john ronald raoul tolkien))
'(ronald raoul)
> (mid-name '(bugs bunny))
'()
> (mid-name '(peter blair denis bernard noone))
  
'(blair denis bernard)


5.19 Write a procedure insert–and that takes a sentence of items 
and returns a new sentence with an "and" in the right place:
|#
(define (insert-and takes-sent)
  (sentence (bl takes-sent) 'and (last takes-sent)))
#|
(insert-and '(awais aiza ifrah inaya))
'(awais aiza ifrah and inaya)
|#


