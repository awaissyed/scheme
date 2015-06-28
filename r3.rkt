(define (ends-vowel? wd) (vowel? (last wd)))
(define (even-count? wd) (even? (count wd)))

(define (vowel? wd) (member?  '(a e i o u)))

(define (choose-beatles pred)
  (keep pred '(John Paul George Ringo)))

;(choose-beatles even-count?)
   
;'(John Paul George)

(define (amazify name)
    (word 'the-amazing-name))
;
; > (transform-beatles amazify)
; (THE-AMAZING-JOHN THE-AMAZING-PAUL THE-AMAZING-GEORGE
;  THE-AMAZING-RINGO)
;
; > (transform-beatles butfirst)
; (OHN AUL EORGE INGO)

(define (transform-beatles func)
  (se (every func '(John Paul George Ringo))))