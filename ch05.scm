


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

#|
--------------------------------------------------------------------------------------------
quote (tomorrow never knows))
'(tomorrow never knows)
> "2+3"
"2+3"
> 2+3

> '("can't" buy me love)
'("can't" buy me love)


> (first 'something)
's
> (first '(eight days a week))

'eight
> (first 910)
9
> (last 'something)
'g
> (last '(eight days a week))
'week
> (last 910)
0
> (butfirst 'something)
'omething
> (butfirst '(eight days a week))
'(days a week)
> (butfirst 910)
10
> (butlast 'something)
'somethin
> (butlast '(eight days a week))
'(eight days a)
> (butlast 910)
91


|#

(define (second thing)
  (first (butfirst thing)))
#|
(second 'awais)
'w
> (second '(awais))
Invalid argument to FIRST:  ()
> (second '(awais syed))
'syed
(item 4 '1234)
4
> (item 4 '(being for the benefit of mister kite!))
'benefit
> (item 4 'awais)
'i
> 
> 
> (first 'because)
'b
> (first '(because))
'because
> (last 'because)
'e
> (last '(because))
'because
> (butfirst 'because)
'ecause
> (bustfirst '(because))
 bustfirst: undefined;
 cannot reference undefined identifier
> (butfirst '(because))
'()
(butfirst 'a)
""
> 


(define (plural wd)
  (word wd's))
(plural 'car)
'cars
(bf '(sexy sadie))
'(sadie)
> (first (bf '(sexy sadie)))
'sadie
> (last (bf '(sexy sadie)))
'sadie
> (last (bf '(sexy sadie sam)))
'sam

(strings-are-numbers #f)

5.1 What values are printed when you type these 
expressions to Scheme? (Figure it out in your head before you try it on the computer.)

 (sentence 'I '(me mine))
'(I me mine)
> (sentence '() '(is empty))
'(is empty)
> (word '23 '45)
2345
> (se '23 '45)
'(23 45)
(bf 'a)
""
> (bf '(aye))
'()
> (count (first '(maggie mae)))
6
> (se "" '() "" '())
'("" "")
(count (se "" '() "" '()))
2

output from example
(f1 '(a b c) '(d e f))
(B C D E)
procedure

(define (f1 s1 s2)
  (se (bf s1) (bl s2)))
actual
(f1 '(a b c) '(d e f))
'(b c d e)

output from example
> (f2 '(a b c) '(d e f))
(B C D E AF)

Procedure
(define (f2 s1 s2)
  (se (bf s1) (bl s2) (word (first s1) (last s2))))
actual

 (f2 '(a b c) '(d e f))
'(b c d e af)


(f3 '(a b c) '(d e f))
(A B C A B C)

out put from example
(f3 '(a b c) '(d e f))
(A B C A B C)

Procedure
(define (f3 s1 s2)
  (se s1 s1))

actaul
(f3 '(a b c) '(d e f))
'(a b c a b c)

out put from example
(f4 '(a b c) '(d e f))
BE

Procedure
(define (f4 s1 s2)
  (word (item 2 s1) (item 2 s2)))

actaul
(f4 '(a b c) '(d e f))
'be

5.3 Explain the difference in meaning between (first 'mezzanine) and (first '(mezzanine)).

 a- (first 'mezzanine) will take word as argument and will return m. 
b-(first '(mazzanine)) first will take sentenced and will return first of sentence which is
mazzanine

 (first 'mezzanine)
'm
> (first '(mezzanine))
'mezzanine
5.4 Explain the difference between the two expressions (first (square 7))
and (first '(square 7)).
a- it will calulate the square of 7 which is 49 and will return first of 49 which is 4
b-it will take this sentence as argument and will return the first of sentence whic is square
(define (square x)
  (* x x))
 (first (square 7))
4
> (first '(square 7))
'square
5.5 Explain the difference between (word 'a 'b 'c) and (se 'a 'b 'c).

a- it will put abc in a word 'abc
b- it will put abc in sentence '(a b C)

5.6 Explain the difference between (bf 'zabadak) and (butfirst 'zabadak).
same, bf is an abreviation of butfirst

5.7 Explain the difference between (bf 'x) and (butfirst '(x)).
a-  will return empty word
b- will return empty sentence

5.8 Which of the following are legal Scheme sentences?
(here, there and everywhere)
(help!)
(all i've got to do)
(you know my name (look up the number))

none

5.9 Figure out what values each of the following will return before you try 
them on the computer:
(first (bf 'stitches))
't
> (first 'held)
'h
> (bl (bl (bl (bl 'rigidly))))
'rig
> (first 'with)
'w
> (bf (bf (last '(baseball mitt))))
'tt
> (bl (bl (first '(make a))))
'ma
> (se (word (bl (bl (first '(make a))))
          (bf (bf (last '(baseball mitt)))))
    (word (first 'with) (bl (bl (bl (bl 'rigidly))))
          (first 'held) (first (bf 'stitches))))
'(matt wright)


(first '(sunny days))
'sunny
> (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
          (last (first '(sunny days))))
'harvey
> (word (bl (bl 'bring)) 'a (last 'clean))
'brian
> (se (word (bl (bl 'bring)) 'a (last 'clean))
    (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
          (last (first '(sunny days)))))
'(brian harvey)

5.10 What kinds of argument can you give butfirst so that it returns a word? A sentence?
when word is given as argument, it returns a word. if sentence is given, it returns sentence

5.11 What kinds of argument can you give last so that it returns a word? A sentence?
when word is given as argument, it returns a word. if sentence is given, it returns sentence
however 1 word sentence also returns a word.

5.12 Which of the functions first, last, butfirst, 
and butlast can return an empty word? For what arguments? 
What about returning an empty sentence?

bl returns empty sentence when given single word sentence
bl returns empty word when given single word
bf returns empty sentence when given single word senternce
bf returns empty word when given single word


5.14 Write a procedure third that selects the third letter 
of a word (or the third word of a sentence).


procedure
(define (third sent)
  (item 3 sent))
output
(third '(syed muhammad awais))
'awais
> (third 'awais)
'a
(third '123)
3

5.15 Write a procedure first-two that takes a word as its argument, returning a two-letter 
word containing the first two letters of the argument.

|# 


#|
(define (first-two wd)
  (se (first wd) (item 2 wd)))

(first-two 'abc)
'(a b)

(define (first-two wd)
   (word (first wd) (first (bf wd))))

>(first-two 'abc)
'ab
> (first-two 'ambulatory)
'am

5.16-Write a procedure two-first that takes two words as arguments, 
returning a two-letter word containing the first letters of the two arguments.

(define (two-first wd wd1)
  (word (first wd) (first wd1)))

> (two-first 'brain 'espstein)
'be
> (two-first 'awais 'syed)
'as
Now write a procedure two-first-sent that takes a two-word sentence as argument, 
returning a two-letter word containing the first letters of the two words.



(define (two-first-sent sent1)
  (word (first (first sent1)) (first  (last sent1)))) 

>(two-first-sent '(brain esptein))
'be
> 


5.17 Write a procedure knight that takes a person's 
name as its argument and returns the name with "Sir" in front of it.


(define (knight sent1)
  (se 'sir sent1))
 (knight '(awais syed))
'(sir awais syed)
> (knight '(david wessel))
'(sir david wessel)

|#









