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
