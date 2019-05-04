(clear)
(reset)
(deffunction save()
   (printout t "저축이 부족 하므로 더 저축해야 합니다." crlf crlf))
(defrule R1
   (savings_account inadequate)
   =>
   (save)
   (assert (investment savings)))
   
(deffunction stock()
   (printout t "현재 저축이 적절하고 수입도 괜찮으므로 증권에 투자해야 합니다." crlf crlf))
(defrule R2
   (savings_account adequate)
   (income adequate)
   =>
   (stock)
   (assert (investment stocks)))

(deffunction combination ()
   (printout t "소득이 적지만 충분한 저축을 했기 때문에 저축과 주식에 분배하며 투자 해야합니다." crlf crlf))
(defrule R3
   (savings_account adequate)
   (income inadequate)
   =>
   (combination)
   (assert (investment combination)))

(deffunction account (?x ?y)
   (printout t "현재 저축액은 " ?x "이고"  crlf)
   (printout t "부양가족  " ?y "명을 부양하고 있어"  crlf)
   (printout t "충분여부를 판단하는 기준은 " (* 5000 ?y) "이므로"  crlf)
   (printout t "저축은 충분합니다."  crlf crlf))
(defrule R4
   (amount_saved ?x)
   (dependents ?y&: (>= ?x (* 5000 ?y)))
   =>
   (account ?x ?y)
   (assert (savings_account adequate)))

(deffunction account_unsteady (?x ?y)
   (printout t "현재 저축액은 " ?x "이고"  crlf)
   (printout t "부양가족  " ?y "명을 부양하고 있어"  crlf)
   (printout t "충분여부를 판단하는 기준은 " (* 5000 ?y) "이므로"  crlf)
   (printout t "저축은 충분하지 않습니다."  crlf crlf))
(defrule R5
   (amount_saved ?x)
   (dependents ?y&: (< ?x (* 5000 ?y)))
   =>
   (account_unsteady ?x ?y)
   (assert (savings_account inadequate)))
   
(deffunction incomead (?x, ?y)
           (printout t "현재 연수입은 " ?x "이고" crlf)
           (printout t "부양가족 " ?y "명을 부양하기위해 필요로 하는 수입의" crlf)
           (printout t "충분여부를 판단하는 기준은 " (+ 15000 (* 4000 ?y)) 
                    "이므로" crlf)
           (printout t "수입은 충분한 것으로 판단 됩니다." crlf crlf))
(defrule R6
          (earnings ?x steady)
          (dependents ?y&: (>= ?x (+ 15000 (* 4000 ?y))))
          =>
         (incomead ?x ?y)
         (assert (income adequate)))

(deffunction dependents_incomead_unsteady (?x ?y)
   (printout t "현재 연수입은 " ?x "이고" crlf)
           (printout t "부양가족 " ?y "명을 부양하기위해 필요로 하는 수입의" crlf)
           (printout t "충분여부를 판단하는 기준은 " (+ 15000 (* 4000 ?y)) 
                    "이므로" crlf)
           (printout t "수입은 충분하지 않는것으로 판단 됩니다." crlf crlf))
(defrule R7
   (earnings ?x steady)
   (dependents ?y&: (< ?x (+ 15000 (* 4000 ?y))))
          =>
         (dependents_incomead_unsteady ?x ?y)
         (assert (income adequate)))
        
(deffunction unsteady ()
           (printout t "수입이 일정하지 않습니다." crlf crlf))
(defrule R8
   (earnings ?x unsteady)
   =>
   (unsteady)
   (assert (income inadequate)))

