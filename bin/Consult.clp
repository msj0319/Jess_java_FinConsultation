(clear)
(reset)
(deffunction save()
   (printout t "������ ���� �ϹǷ� �� �����ؾ� �մϴ�." crlf crlf))
(defrule R1
   (savings_account inadequate)
   =>
   (save)
   (assert (investment savings)))
   
(deffunction stock()
   (printout t "���� ������ �����ϰ� ���Ե� �������Ƿ� ���ǿ� �����ؾ� �մϴ�." crlf crlf))
(defrule R2
   (savings_account adequate)
   (income adequate)
   =>
   (stock)
   (assert (investment stocks)))

(deffunction combination ()
   (printout t "�ҵ��� ������ ����� ������ �߱� ������ ����� �ֽĿ� �й��ϸ� ���� �ؾ��մϴ�." crlf crlf))
(defrule R3
   (savings_account adequate)
   (income inadequate)
   =>
   (combination)
   (assert (investment combination)))

(deffunction account (?x ?y)
   (printout t "���� ������� " ?x "�̰�"  crlf)
   (printout t "�ξ簡��  " ?y "���� �ξ��ϰ� �־�"  crlf)
   (printout t "��п��θ� �Ǵ��ϴ� ������ " (* 5000 ?y) "�̹Ƿ�"  crlf)
   (printout t "������ ����մϴ�."  crlf crlf))
(defrule R4
   (amount_saved ?x)
   (dependents ?y&: (>= ?x (* 5000 ?y)))
   =>
   (account ?x ?y)
   (assert (savings_account adequate)))

(deffunction account_unsteady (?x ?y)
   (printout t "���� ������� " ?x "�̰�"  crlf)
   (printout t "�ξ簡��  " ?y "���� �ξ��ϰ� �־�"  crlf)
   (printout t "��п��θ� �Ǵ��ϴ� ������ " (* 5000 ?y) "�̹Ƿ�"  crlf)
   (printout t "������ ������� �ʽ��ϴ�."  crlf crlf))
(defrule R5
   (amount_saved ?x)
   (dependents ?y&: (< ?x (* 5000 ?y)))
   =>
   (account_unsteady ?x ?y)
   (assert (savings_account inadequate)))
   
(deffunction incomead (?x, ?y)
           (printout t "���� �������� " ?x "�̰�" crlf)
           (printout t "�ξ簡�� " ?y "���� �ξ��ϱ����� �ʿ�� �ϴ� ������" crlf)
           (printout t "��п��θ� �Ǵ��ϴ� ������ " (+ 15000 (* 4000 ?y)) 
                    "�̹Ƿ�" crlf)
           (printout t "������ ����� ������ �Ǵ� �˴ϴ�." crlf crlf))
(defrule R6
          (earnings ?x steady)
          (dependents ?y&: (>= ?x (+ 15000 (* 4000 ?y))))
          =>
         (incomead ?x ?y)
         (assert (income adequate)))

(deffunction dependents_incomead_unsteady (?x ?y)
   (printout t "���� �������� " ?x "�̰�" crlf)
           (printout t "�ξ簡�� " ?y "���� �ξ��ϱ����� �ʿ�� �ϴ� ������" crlf)
           (printout t "��п��θ� �Ǵ��ϴ� ������ " (+ 15000 (* 4000 ?y)) 
                    "�̹Ƿ�" crlf)
           (printout t "������ ������� �ʴ°����� �Ǵ� �˴ϴ�." crlf crlf))
(defrule R7
   (earnings ?x steady)
   (dependents ?y&: (< ?x (+ 15000 (* 4000 ?y))))
          =>
         (dependents_incomead_unsteady ?x ?y)
         (assert (income adequate)))
        
(deffunction unsteady ()
           (printout t "������ �������� �ʽ��ϴ�." crlf crlf))
(defrule R8
   (earnings ?x unsteady)
   =>
   (unsteady)
   (assert (income inadequate)))

