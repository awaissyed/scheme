(define (vowel? letter) (member? letter 'aeiou))
#|
> (word 'now 'here)
'nowhere
> (sentence 'now 'here)
'(now here)
> (first 'blackbird)
'b
> (first '(blackbird))
'blackbird
> (every butfirst '(thank you girl))
'(hank ou irl)
> (member? 'the '(the girl))
#t
 > (keep vowel? 'iwill)
'ii
> (every last '(honey pie))
'(y e)
2.2. domainn of vowel? is a workd

> (keep vowel? 'iwill)
'ii
> (every last '(honey pie))
'(y e)
> (item '4 'benifit)
'i
> (item '3 '(syed muhammad Awais))
'Awais
(appearances 't 'thehthe)
2

answer2.3. appearances functions take the argument and tells how many time it is appearing in second
Answer 2.4. Item takes integer and returns
if word then return the letter according to integer. if sentence, then return the work number accordig to interger. 
|#
