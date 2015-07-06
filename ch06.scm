#|
(member? 'mick '(dave dee dozy beaky mick and tich))
(empty? (bf (bf 'hi)))

> (number? 'three)
#F
> (number? 74)
#T
> (boolean? #f)
#T
> (boolean? '(the beatles))
#F
Page 73
> (boolean? 234)
#F
> (boolean? #t)
#T
> (word? 'flying)
#T
> (word? '(dig it))
#F
> (word? 87)
#T
> (sentence? 'wait)
#F
> (sentence? '(what goes on))
#T

(define (abs num)
  (if (< num 0)
(- num) num))

(define (buzz num)
  (if (or (divisible? num 7) (member? 7 num))
'buzz num))
(define (divisible? big little)
  (= (remainder big little) 0))
|#
#|
 (buzz 75)
'buzz
> (buzz 15)
15

(define (plural wd)
  (word wd 's))
|#
#|
> (plural 'computer)
'computers
> (plural 'beatle)
'beatles
> (plural 'fly)
'flys

(define (plural wd)
  (if (equal? (last wd) 'Y)
      (word (bl wd) 'ies)
      (word wd 's)))
|#
#|
program willl only work if capital y is at the end
> (plural 'citY)
'cities

|#
#|
(define (divisible? big small)
  (= (remainder big small) 0))

(define (divisible? big small)
  (= (remainder big small) 0))
(define (num–divisible–by–4? x)
  (and (number? x) (divisible? x 4)))
> (num–divisible–by–4? 16)


(define (integer–quotient big little)
  (if (divisible? big little)
      (/ big little)
      #f))
(define (roman–value letter)
  (if (equal? letter 'i)
      1
      (if (equal? letter 'v)
          5
          (if (equal? letter 'x)
              10
              (if (equal? letter 'l)
                  50
                  (if (equal? letter 'c)
                      100
                      (if (equal? letter 'd)
                          500
                          (if (equal? letter 'm)
                              1000
                              'huh?))))))))
(define (truefalse value)
  (cond (value 'true)
        (else 'false)))
; (truefalse (= 2 (+ 1 1)))
;'true

|#
#|
(define (am? time)
  (equal? (last time) 'am))

(define (pm? time)
  (equal? (last time) 'pm))

(define (european-time time)
  (if (or
        (and
          (< (first time) 12) (pm? time))
        (and
          (= (first time) 12) (am? time)))
    (+ (first time) 12)
    (first time)))
(define (american-time time)
  (if (> time 12)
    (sentence (- time 12) (if (= time 24) 'am 'pm))
    (sentence time (if (= time 12) 'pm 'am))))
 
6.6 Write a predicate teen? that returns true if its argument is between 13 and 19.

(define (teen? x)
  (if ( or ( < x 12) (> x 20))
   'false 'true))

|#
#|
> (teen? 4)
'false
> (teen? 13)
'true
> (teen? 21)
'false
> (teen? 19)
'true
> 
6.7 Write a procedure type–of that takes anything as its argument and returns one of the words


(define (type-of x)
  (cond 
    ((sentence? x) 'sentence)
     ((number? x) 'number)
     ((word? x) 'word)
     ((boolean? x) 'boolean)
        (else '(something else))))

 |# 
#|
> (type-of <)
'(something else)
> (type-of '(brown fox))
'sentense
> (type-of 5)
'number
> (type-of 'owl)
'word
> (type-of (= 3 3))
'boolean

6.8 Write a procedure indef–article that works like this:


(define (vowel? c)
  (member? c 'aeiou))

(define (indef-article takes_wd)
  (sentence
 (if (vowel? (first takes_wd)) 'an 'a) takes_wd))
|#
#|
> (indef-article 'awais)
'(an awais)
> (indef-article 'ghufran)
'(a ghufran)
> (indef-article 'beatle)
'(a beatle)
> (indef-article 'album)
'(an album)

(define (plural wd)
  (if (equal? (last wd) 'Y)
      (word (bl wd) 'ies)
      (word wd 's)))

(define (this-many num_ber objective)
  (sentence num_ber
  (if (> num_ber 1) (plural objective) objective)))
|#
#|
> (this-many 1 'book)
'(1 book)
> (this-many 2 'book)
'(2 books)
> (this-many 1 'partrage)
'(1 partrage)
> (this-many 3 'french-hen)
'(3 french-hens)

(define (sort2 nums)
  (if (>= (first nums) (last nums))
    (sentence (last nums) (first nums))
    nums)) 
 |#
#|
> (sort2 '(7 5))
'(5 7)
> (sort2 '(6 5 4 3 ))
'(3 6)

6.12 Make plural handle correctly words that end in y but have a vowel before the y, 
such as boy. Then teach it about words that end in x (box). What other special cases can you find?


(define (plural wd)
   (if (equal? (last wd) 'y)
       (word (bl wd) 'ies)
       (word wd 's)))


(define (vowel? char)
  (member? char 'aeiou))

(define (secondlast x)
  (last (bl x)))

(define (plural wd)
  (cond
    ((and
       (equal? (last wd) 'y)
       (vowel? (secondlast wd)))
      (word wd 's))
    ((equal? (last wd) 'y) (word (bl wd) 'ies))
    ((equal? (last wd) 'x) (word wd 'es))
    (else (word wd 's))))
|#
#|
> (plural 'boy)
'boys
> (plural 'city)
'cities
> (plural 'box)
'boxes
> 
--------------------------------------------------------------------------------------------------------------
|#

#|
(define (greet name)
  (if (equal? (first name) 'professor)
      (se '(i hope i am not bothering you) 'professor (last name))
      (se '(good to see you) (first name))))

> (greet '(awais))
'(good to see you awais)
> (member? 'mick '(dave dee dozy beaky mick and tich))
#t
> (member? 'mick '())
#f
(member? 'mick '(john paul george ringo))
#f
> (member? 'e 'truly)
#f
> (member? 'Y 'truly)
#f

> (= 3 4)
#f
> (= 67 67)
#t
> (> 98 97)
#t
> (before? 'zorn 'coleman)
#f
> (before? 'pete 'ringo)
#t
> (empty? '(abbey road))
#f
> (empty? '())
#t
> (empty? 'hi)
#f
> (empty? (bf (bf 'hi)))
#t
> (empty? "")
#t
> (number? 'three)
#f
> (number? 74)
#t
> (boolean? #f)
#t
> (boolean? '(the beatles))
#f
> 
> (boolean? 234)
#f
> (boolean? #t)
#t
> (word? 'flying)
#t
> (word? '(dig it))
#f
> (word? 87)
#t
> (sentence? 'wait)
#f
> (sentence? '(what goes on))
#t
> 

(define (vowel? letter)
  (member? letter 'aeiou))
>(vowel? 'a)
#t

(define (positive? number)
  (> number 0))
> (positive? -9)
#f






(define (abs num)
  (if (< num 0)
(- num) num))

(define (buzz num)
  (if (or (divisible? num 7) (member? 7 num))
'buzz num))

(define (divisible? big little)
  (= (remainder big little) 0))
|#
#|
> (buzz 57)
'buzz
> (buzz 75)
'buzz
> (buzz 1)
1
> 


(define (plural wd)
  (word wd 's))

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))

> (plural 'saly)
'salies


(define (integer-quotient big little)
  (if (divisible? big little)
      (/ big little)
      #f))

(define (divisible? big little)
  (= (remainder big little) 0))


(define (roman–value letter)
  (cond ((equal? letter 'i) 1)
        ((equal? letter 'v) 5)
        ((equal? letter 'x) 10)
        ((equal? letter 'l) 50)
        ((equal? letter 'c) 100)
        ((equal? letter 'd) 500)
        ((equal? letter 'm) 1000)
        (else 'huh?)))
> (roman–value '5)
'huh?
> (roman–value 'i)
1
|#


#|
(define (greet name)
  (if (equal? (first name) 'professor)
      (se '(pleased to meet you)
          'professor
(last name)
          '(–– how are you?))
      (se '(pleased to meet you)
          (first name)
          '(–– how are you?))))

(define (greet name)
  (se '(pleased to meet you)
      (if (equal? (first name) 'professor)
          (se 'professor (last name))
          (first name))
      '(–– how are you?)))
-----------------------------------------------------------------------------------------------------
6.1 What values are printed when you type these expressions to Scheme? 
(Figure it out in your head before you try it on the computer.)

(cond ((= 3 4) '(this boy))
      ((< 2 5) '(nowhere man))
      (else '(two of us)))
'(nowhere man)


(cond (empty? 3)
      (square 7)
(else 9))
3


(define (third–person–singular verb)
  (cond ((equal? verb 'be) 'is)
        ((equal? (last verb) 'o) (word verb 'es))
        (else (word verb 's))))
(third–person–singular 'go)
'goes


6.2 What values are printed when you type these expressions to Scheme? 
(Figure it out in your head before you try it on the computer.)

> (or #f #f #f #t)
#t
> (and #f #f #f #t)
#f
> (or (= 2 3) (= 4 3))
#f
> (or (= 2 3) (= 4 4))
#t
 (not #f)
#t
 (or (not (= 2 3)) (= 4 3))
#t

(or (and (= 2 3) (= 3 3)) (and (< 2 3) (< 3 4)))
#t
> 

6.3 Rewrite the following procedure using a cond instead of the ifs:
(define (sign number)
  (if (< number 0)
      'negative
      (if (= number 0)
          'zero
          'positive)))

replaced with cond

(define (sign num)
  (cond ((< num 0) 'negative)
        ((= num 0) 'zero)
        (else 'positive)))

(sign 0)
'zero
> (sign -1)
'negative
> (sign 1)
'positive



(define (utensil meal)
  (cond ((equal? meal 'chinese) 'chopsticks)
        (else 'fork)))

replaced with if

(define (utinsil meal)
  (if (equal? meal 'chinese) 'choptisks
      'fork))
(utinsil 'chinese)
'choptisks
> (utinsil 'idian)
'fork  
6.5 Write a procedure european–time to convert a time from American AM/PM notation into
 European 24-hour notation. Also write american–time, which does the opposite:
> (european–time '(8 am))
8
> (european–time '(4 pm))
16
> (american–time 21)
(9 PM)
> (american–time 12)
(12 PM)
> (european–time '(12 am))
24
Getting noon and midnight right is tricky.

|#

#|
(define (american-time numa)
  (if  (> numa 12) 
       (se (- numa 12) 'pm) 
       (se numa 'am)))


> (american-time 13)
'(1 pm)
> (american-time 8)
'(8 am)
> (american-time 12)
'(12 am)
> (american-time 24)
'(12 pm)



this version was trure only for inputting the word and only 1 digit time

(define (european-time nume)
  (if (equal? (bf nume) 'pm) (+ (first nume) 12)
             (first nume)))

> (european-time '8pm)
20
> (european-time '10pm)
1
> 



this revised versio takes sentence and is true for all 
|#

(define (european-time nume)
  (if (equal? (last nume) 'pm) (+ (first nume) 12)
             (first nume)))

(european-time '(11 pm))
(european-time '(8 am))
(european-time '(12 am))
(european-time '(12 pm))
(european-time '(4 pm))
#|
final version 
|#
(define (european-time1 nume)
  (cond (( and (equal? (last nume) 'am) (= (first nume) 12) ) (+ (first nume) 12))
        (( and (equal? (last nume) 'pm) (= (first nume) 12) ) (first nume))
        (( and (equal? (last nume) 'pm) (+ (first nume) 12)))
        (else (first nume))))
        
(european-time1 '(12 am))
(european-time1 '(12 pm))
(european-time1 '(11 am))
(european-time1 '(11 pm))
(european-time1 '(4 pm))
(european-time1 '(10 pm))
#|

6.6 Write a predicate teen? that returns true if its argument is between 13 and 19.


(define (teen? x)
  (if ( or ( < x 13) (> x 20))
   'false 'true))



(define (teen num-teen)
  (if ( and (> num-teen 12) (< num-teen 19)) 
      'true 'false))



6.7 Write a procedure type–of that takes anything as its argument 
and returns one of the words word, sentence, number, or boolean:
> (type–of '(getting better))
SENTENCE
> (type–of 'revolution)
WORD
> (type–of (= 3 3))
BOOLEAN

(define (type-of? sen_tence)
  (cond ((sentence? sen_tence) 'sentence )
        ((number? sen_tence) 'number)
        ((word? sen_tence) 'word)
        ((boolean? sen_tence) 'boolean)
        (else 'nothing)))




(type-of? (= 3 3))
'boolean
(type-of? 7)
'number
> (type-of? '(i am awais))
'sentence
 (type-of?'word)
'word
> 
6.8 Write a procedure indef–article that works like this: > (indef–article 'beatle)
(A BEATLE)
> (indef–article 'album)
(AN ALBUM)


(define (vowel? c)
  (member? c 'aeiou))

(define (indef-article sen-tence)
  (se (if (vowel? (first sen-tence)) 'an 'a)
              sen-tence ))



> (indef-article 'awais)
'(an awais)
> (indef-article 'boss)
'(a boss)
> (indef-article 'beatles)
'(a beatles)
> 

|#
(define (vowel? c)
  (member? c 'aeiou))

(define (abc def)
  (se (cond ((vowel? (first def)) 'an )
         (else 'a )) def))



(abc 'awais)

(abc 'boss)


#|
6.9 Sometimes you must choose the singular or the plural of a word: 
1 book but 2 books. Write a procedure thismany that takes two arguments, 
a number and a singular noun, and combines them appropriately:
> (thismany 1 'partridge)
(1 PARTRIDGE)
> (thismany 3 'french–hen)
(3 FRENCH–HENS)
|#

(define (plural wd)
  (cond ((equal? (last wd) 'y) (word (bl wd) 'ies))
               (else (word wd 's))))


(define (thismany a b)
 (se a (cond ((> a 2) (plural b) )
           (else  b))))

(thismany 1 'book)
(thismany 1 'partridge)
(thismany 3 'french-hen)
(thismany 4 'programmer)
  
#|
6.10 Write a procedure sort2 that takes as its argument a sentence containing 
two numbers. It should return a sentence containing the same two numbers, 
but in ascending order:
> (sort2 '(5 7))
(5 7)
> (sort2 '(7 5))
(5 7)  
|#
  

(define (sort2 su)
  (cond ((> (item 1 su) (item 2 su)) (se (item 2 su) (item 1 su) ))
            (else su)))
  
(sort2 '(7 5))
(sort2 '(24 13))
(sort2 '(5 7))


(define (sort3 su)
  (if (>= (first su) (last su))
      (se (bf su) (first su))
      su))
(sort3 '(5 7))
(sort3 '(7 5))
#|
6.11 Write a predicate valid–date? that takes three numbers as arguments, representing a month,
 a day of the month, and a year. Your procedure should return #t if the numbers represent a valid
 date (e.g., it isn't the 31st of
September). February has 29 days if the year is divisible by 4, except that if the year is divisible 
by 100 it must also be divisible by 400.
> (valid–date? 10 4 1949)
#T
> (valid–date? 20 4 1776)
#F
> (valid–date? 5 0 1992)
#F
> (valid–date? 2 29 1900)
#F
> (valid–date? 2 29 2000)
#T
|#  
 
(define (valid-month x)
  (cond ((<= x 12)  #t)
  (else #f)))

(define (valid-day x)
  (cond ((<= x 31) #t)
        (else #f)))

(define (valid-year x)
  (cond ((> x 999 ) #t)
        (else #f)))

(define (valid-date valid-day valid-month valid-year)
  ( cond ((valid-day valid-month valid-year) #t)
         (else #f)))