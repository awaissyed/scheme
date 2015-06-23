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
|#
(define (abs num)
  (if (< num 0)
(- num) num))

(define (buzz num)
  (if (or (divisible? num 7) (member? 7 num))
'buzz num))
(define (divisible? big little)
  (= (remainder big little) 0))
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
|#
(define (plural wd)
  (if (equal? (last wd) 'Y)
      (word (bl wd) 'ies)
      (word wd 's)))

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
|#

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
|#
(define (teen? x)
  (if ( or ( < x 12) (> x 20))
   'false 'true))
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
 |# 

(define (type-of x)
  (cond 
    ((sentence? x) 'sentence)
     ((number? x) 'number)
     ((word? x) 'word)
     ((boolean? x) 'boolean)
        (else '(something else))))
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
|#
(define (vowel? c)
  (member? c 'aeiou))

(define (indef-article takes_wd)
  (sentence
 (if (vowel? (first takes_wd)) 'an 'a) takes_wd))
#|
> (indef-article 'awais)
'(an awais)
> (indef-article 'ghufran)
'(a ghufran)
> (indef-article 'beatle)
'(a beatle)
> (indef-article 'album)
'(an album)
|#
(define (plural wd)
  (if (equal? (last wd) 'Y)
      (word (bl wd) 'ies)
      (word wd 's)))

(define (this-many num_ber objective)
  (sentence num_ber
  (if (> num_ber 1) (plural objective) objective)))
#|
> (this-many 1 'book)
'(1 book)
> (this-many 2 'book)
'(2 books)
> (this-many 1 'partrage)
'(1 partrage)
> (this-many 3 'french-hen)
'(3 french-hens)
|#
(define (sort2 nums)
  (if (>= (first nums) (last nums))
    (sentence (last nums) (first nums))
    nums))  
#|
> (sort2 '(7 5))
'(5 7)
> (sort2 '(6 5 4 3 ))
'(3 6)
|#