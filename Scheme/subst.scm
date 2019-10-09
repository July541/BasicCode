(define (subst-it new old slist)
    (if (symbol? slist)
        (if (eqv? slist old) new slist)
        (subst new old slist)))

(define (subst new old slist)
    (if (null? slist)
        '()
        (cons 
            (subst-it new old (car slist))
            (subst new old (cdr slist)))))

(subst 'a 'b '((b c) (b () d)))