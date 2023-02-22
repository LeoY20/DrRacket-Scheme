;> (prepend-every 's '(he aid he aid))
;(SHE SAID SHE SAID)

;> (prepend-every 'anti '(dote pasto gone body))
;(ANTIDOTE ANTIPASTO ANTIGONE ANTIBODY)

(define (prepend-every prefix lst)
  (apply append (map (lambda (lstEle) (list prefix lstEle)) lst)))

(prepend-every 's '(he aid he aid))