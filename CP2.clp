;;////////////////////
;;      TEMPLATES       
;;///////////////////

(deftemplate Persona "Datos introducidos por la persona"
	(slot nombre (type STRING))
	(slot edad (type INTEGER))
	(slot altura (type INTEGER))
	(slot peso (type INTEGER))
	(slot IMC (type INTEGER))
	(slot intensidad_inicial (type SYMBOL) (allowed-values Baja Media Alta Nula))
	(slot presion_max (type INTEGER))
	(slot presion_min (type INTEGER))
	(slot tiempo_dispo (type INTEGER))
	(multislot habitos (type INSTANCE))
	(multislot problemas (type INSTANCE))
	(multislot objetivos (type INSTANCE))
)

(deftemplate Ejercicio_sencillo "Test recomendado"
	(slot nombre (type SYMBOL)
		(allowed-values Subir_escaleras_1_min Correr_1_min))
	(slot cansancio (type SYMBOL)
		(allowed-values Alto Bajo Medio))
	(slot mareo (type SYMBOL)
		(allowed-values Sí No))
	(slot tirantez_muscular (type SYMBOL)
		(allowed-values Sí No))
)


;;////////////////////
;;      FUNCIONES       
;;///////////////////

(deffunction pregunta-general (?pregunta) 
	(format t "%s" ?pregunta) 
	(bind ?respuesta (read)) 
	?respuesta
)

(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi) 
	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
	(bind ?respuesta (read)) 
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do 
		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
		(bind ?respuesta (read)) 
	) 
	?respuesta
)

(deffunction pregunta-numerica5 (?pregunta ?rangini ?rangfi) 
	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
	(bind ?respuesta (read)) 
	(while (not(and(eq (mod ?respuesta 5) 0) (and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi)))) do 
		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
		(bind ?respuesta (read)) 
	) 
	?respuesta
)

(deffunction pregunta-frec (?pregunta ?rangini ?rangfi) 
	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
	(printout t "1. Diariamente")
	(printout t "2. Varias veces a la semana")
	(printout t "3. Semanalmente")
	(bind ?respuesta (read)) 
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do 
		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
		(bind ?respuesta (read)) 
	)
	if (eq ?respuesta 1) then Diaria
	else if (eq ?respuesta 2) then Varias_veces_a_la_semana
	else if (eq ?respuesta 3) then Semanal
)

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      )
   ?answer)

(deffunction si-o-no-p (?question)
   (bind ?response (ask-question ?question si no s n))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE))

	   
;POTSER HAURIEM D'AFEGIR ELS PROBLEMES DE PES AQUI???
(deffunction calcular_int_imc(?imc)
	(if (< ?imc 18.5) then -1000) else
	(if (> ?imc 50) then -3000) else
	(if (> ?imc 40) then -2000) else
	(if (> ?imc 35) then -1600) else 
	(if (> ?imc 30) then -1200) else
	(if (> ?imc 27) then -700) else 
	(if (> ?imc 25) then -300) else
	500
)


;;////////////////////
;;      REGLAS       
;;///////////////////

(defmodule MAIN (export ?ALL))

(defrule inicio 
    (declare (salience 100))
    =>
	(printout t crlf)
    (printout t "Bienvenido a Coaching Potato" crlf)
	(printout t "Sistema de recomendacion de ejercicios" crlf)
	(printout t "y planificacion de programas personalizados" crlf)
    (printout t crlf)
    (focus preguntas)
)

 (defmodule preguntas "Modulo de preguntas que el usuario debe responder"
   (import MAIN ?ALL)
   (export ?ALL))

(defrule introducir-persona
	(declare (salience 50))
	=>
    (bind ?nombre (pregunta-general "Nombre: "))
	(bind ?edad (pregunta-numerica "Edad (anos): " 0 150))
    (bind ?altura (pregunta-numerica "Altura (cm): " 0 250))
    (bind ?peso (pregunta-numerica "Peso (kg): " 0.0 600.0))
	(bind ?IMC (/ ?peso (* ?altura ?altura)))
    (bind ?presion_min (pregunta-numerica "Presion sanguinea minima: " 0.0 200.0))
	(bind ?presion_max (pregunta-numerica "Presion sanguinea maxima: " 0.0 200.0))
	;(if (presion demasiado alta) then ...)

	(bind ?tiempo_diario_disp (* 60 (pregunta-numerica5 "Tiempo diario disponible, ha de ser multiple de 5 [30,300] min: " 30 300)))
	(printout t crlf ?tiempo_diario_disp crlf)

	(assert
		(Persona
   		(nombre ?nombre)
   		(edad ?edad)
   		(altura ?altura)
   		(peso ?peso)
		(IMC ?IMC)
		(presion_min ?presion_min)
		(presion_max ?presion_max)
		(tiempo_dispo ?tiempo_diario_disp))
	)
	(assert (no_hay_habitos))
	(assert (no_hay_problemas))
	(assert (no_hay_objetivos))
	(assert (no_hay_obj_cumpl))
	(assert (no_hay_obj_eje))
)

(defrule introduce-habitos
	(declare (salience 30))
	?nhb <- (no_hay_habitos)
	?persona <- (Persona (nombre ?nombre))
	=>

	(bind ?lista_habitos (find-all-instances ((?a Habito+personal)) TRUE))
	(printout t crlf "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_habitos)) do
		(bind ?aux (nth$ ?i ?lista_habitos))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?respuesta (pregunta-numerica "Que habitos tienes? " 0 (length$ ?lista_habitos)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do 
		(bind ?habito (nth$ ?respuesta ?lista_habitos))
		(bind ?duracion (pregunta-numerica "Durante cuanto tiempo? (minutos)" 0 600))
		(send ?habito put-duracion ?duracion)
		(bind ?frec (pregunta-frec "Con que frecuencia?" 1 3))
		(send ?habito put-frecuencia ?frec)
		(bind ?lista (insert$ ?lista 1 ?habito))
		(bind ?respuesta (pregunta-numerica "Cual mas? " 0 (length$ ?lista_habitos)))
	)
	(modify ?persona (habitos ?lista))
	(retract ?nhb)
)	

(defrule introduce-problemas
	(declare (salience 20))
	?nhp <- (no_hay_problemas)	
	?persona <- (Persona (nombre ?nombre))
	=>
	(printout t "Problemas musculo-esqueleticos: " crlf)
	(bind ?lista_problemas_musc (find-all-instances ((?p Problemas+musculo-esqueleticos)) TRUE))
	(printout t "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_problemas_musc)) do
		(bind ?aux (nth$ ?i ?lista_problemas_musc))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(bind ?respuesta (pregunta-numerica "Que problema de estos tienes? " 0 (length$ ?lista_problemas_musc)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do 
		(bind ?problema (nth$ ?respuesta ?lista_problemas_musc))
		(bind ?lista (insert$ ?lista 1 ?problema))
		(bind ?respuesta (pregunta-numerica "Que problema mas de estos tienes? " 0 (length$ ?lista_problemas_musc)))
	)
	(modify ?persona (problemas ?lista))
	(retract ?nhp)
)

(defrule introduce-objetivos
	(declare (salience 10))
	?nho <- (no_hay_objetivos)
	?persona <- (Persona (nombre ?nombre))
	=>
	(bind ?lista_objetivos (find-all-instances ((?o Objetivo)) TRUE))
	(printout t "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_objetivos)) do
		(bind ?aux (nth$ ?i ?lista_objetivos))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(bind ?respuesta (pregunta-numerica "Que objetivo tienes? " 0 (length$ ?lista_objetivos)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do
		(bind ?objetivo (nth$ ?respuesta ?lista_objetivos))
		(bind ?lista (insert$ ?lista 1 ?objetivo))
		(bind ?respuesta (pregunta-numerica "Que objetivo mas tienes? " 0 (length$ ?lista_objetivos)))
	)
	(modify ?persona (objetivos ?lista))
	(retract ?nho)
)

(defrule pasa-a-inferir
	(declare (salience -10))
	=>
	(focus inferir-datos)
)

(defmodule inferir-datos "Modulo de inferencia"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (export ?ALL))


(defrule calcula_int_inicial
	(declare (salience 10))
	?persona <- (Persona (habitos $?lista_habitos) (IMC ?IMC) (intensidad_inicial Nula))
	=>
	;IMC
	(bind ?int_ini (calcular_int_imc ?IMC)) ;FALTA ACABAR DE REPASSAR-LA

	;DIETA
	;(bind ?int_ini (+ ?int_ini (calcular_int_dieta ?persona:dieta)))
	;EJERCICIOS SENCILLOS
	;(bind ?int_ini (+ ?int_ini (calcular_int_ejercicios ?persona:ejercicios)))
	(printout t (length$ $?lista_habitos) crlf)

	;HABITOS PERSONALES
	(loop-for-count (?i 1 (length$ $?lista_habitos)) do
		(bind ?habito (nth$ ?i $?lista_habitos))

		(bind ?duracion (send ?habito get-duracion))
		(bind ?puntuacion (send ?habito get-puntuacion))
		(bind ?frec (send ?habito get-frecuencia))
		;HAURÍEM DE CANVIAR L'SLOT FREQUÈNCIA PERQUE SIGUI UN INT, QUE SERAN ELS DIES DE LA SETMANA. LLAVORS PODEM FER PREGUNTA NUMERICA
		(if (eq ?frec Diaria) then (bind ?frec2 30) else
			(if (eq ?frec Semanal) then (bind ?frec2 4) else
				(if (eq ?frec Varias_veces_a_la_semana) then (bind ?frec2 1))
			)
		)
		
		(bind ?puntuacion_real (* ?puntuacion (* ?frec2 ?duracion)))
		
		(bind ?int_ini (+ ?int_ini ?puntuacion_real))
	)
	(if (<= ?int_ini 1000) then (bind ?int_ini_cat Baja))
	(if (>  ?int_ini 1000) then (bind ?int_ini_cat Media)) 
	(if (>  ?int_ini 2000) then (bind ?int_ini_cat Alta)) 
			
	(modify ?persona (intensidad_inicial ?int_ini_cat))
)

(deftemplate completitud_objetivo (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER)))

(defrule objetivos_cumplidos_habitos
	(declare (salience 5))
	?nhoc <- (no_hay_obj_cumpl)
	(Persona (habitos $?lista_habitos))
	=>
	(progn$ (?habito ?lista_habitos)
		(bind ?duracion (send ?habito get-duracion))
		(bind ?puntuacion (send ?habito get-puntuacion))
		(bind ?frec (send ?habito get-frecuencia))
		(if (eq ?frec Diaria) then (bind ?frec2 30) else
			(if (eq ?frec Semanal) then (bind ?frec2 4) else
				(if (eq ?frec Varias_veces_a_la_semana) then (bind ?frec2 1))
			)
		)
		(bind ?puntuacion_real (* ?puntuacion (* ?frec2 ?duracion)))

		(bind ?lista_objetivos (send ?habito get-favorable))
		(progn$ (?objetivo ?lista_objetivos)
			(printout t "Miau" crlf)
			(assert (completitud_objetivo (objetivo ?objetivo) (puntuacion ?puntuacion)))
		)
	)
	(retract ?nhoc)
)

(defrule junta_pares
	(declare (salience 4))
	?x1 <- (completitud_objetivo (objetivo ?objetivo) (puntuacion ?punt1))
	?x2 <- (completitud_objetivo (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?x1) (fact-index ?x2)))
	=>
	(printout t ?objetivo ?punt1 ?punt2 crlf)
	(printout t "Miau2" crlf)
	(assert (completitud_objetivo (objetivo ?objetivo) (puntuacion (+ ?punt1 ?punt2))))
	(retract ?x1)
	(retract ?x2)
)

(deftemplate ejercicio_puntuado (slot ejercicio (type INSTANCE)) (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER)))

(defrule objetivos_cumplidos_ejercicios
	(declare (salience 3))
	?nhoe <- (no_hay_obj_eje)
	?persona <- (Persona (objetivos $?objetivos_persona) (intensidad_inicial ?int_ini))
	=>
	(bind ?lista_ejercicios (find-all-instances ((?ej Ejercicio)) (eq ?ej:intensidad ?int_ini)))

	(progn$ (?ejercicio ?lista_ejercicios)
		(bind ?puntuacion (send ?ejercicio get-puntuacion))
		(bind ?intensidad (send ?ejercicio get-intensidad))
			(bind ?lista_objetivos (send ?ejercicio get-objetivos))
			(progn$ (?objetivo ?lista_objetivos)
				(if (member ?objetivo $?objetivos_persona) 
					then (assert (ejercicio_puntuado (ejercicio ?ejercicio) (objetivo ?objetivo) (puntuacion ?puntuacion))))
				(printout t "Miau3" crlf)
			)
	)
	(retract ?nhoe)
)

;(bind ?rectangulos (find-all-instances ((?inst Rectangulo)) (> ?inst:altura 10)))

;(deftemplate ejercicio_tiempo (slot ejercicio) (slot tiempo) (slot puntuacion))

;(deftemplate ejercicio_puntuado_max (slot ejercicio (type INSTANCE)) (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER)))

(defrule coge_maximo
	(declare (salience 4))
	?x1 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt1))
	?x2 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?x1) (fact-index ?x2)))
	=>
	(printout t ?objetivo ?punt1 ?punt2 crlf)
	(printout t "Miau4" crlf)
	(assert (ejercicio_puntuado (objetivo ?objetivo) (puntuacion (max ?punt1 ?punt2))))
	(retract ?x1)
	(retract ?x2)
)

(defrule asigna_tiempo
	(declare (salience 4))
	?persona <- (Persona (tiempo_dispo ?tiempo_disp))
	?x1 <- (completitud_objetivo (objetivo ?objetivo) (puntuacion ?punt1))
	?x2 <- (ejercicio_puntuado (ejercicio ?ej) (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?x1) (fact-index ?x2)))
	=>
	(bind ?dur_rep (send ?ej get-duracion_por_rep))
	(bind ?rep_max (send ?ej get-repeticiones+max))
	(printout t ?punt1 " " ?punt2 " " ?dur_rep crlf)
	(bind ?rep_obj (div (- 100 ?punt1) (* ?punt2 ?dur_rep)))
	(printout t ?rep_obj crlf)
	(bind ?rep (min ?rep_obj ?rep_max))
		;punt1 + rep*dur/rep*punt2 > 100
		;rep*dur/rep*punt2 > 100 - punt1
		;rep = (100 - punt1)/(punt2*dur/rep)
		
	(bind ?duracion (* ?rep ?dur_rep))
	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))
	
	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?ej_rec put-ejercicio ?ej)
	(retract ?x1)
	(retract ?x2)
		
	(printout t "Miau5" crlf)
	(bind ?tiempo_restante (- ?tiempo_disp ?duracion_real))
	(modify ?persona (tiempo_dispo ?tiempo_restante))
)

(defrule asigna_tiempo2
	(declare (salience 3))
	?persona <- (Persona (tiempo_dispo ?tiempo_disp))
	?x <- (ejercicio_puntuado (ejercicio ?ej) (objetivo ?objetivo) (puntuacion ?punt))
	=>
	(bind ?dur_rep (send ?ej get-duracion_por_rep))
	(bind ?rep_max (send ?ej get-repeticiones+max))
	(bind ?rep_obj (div 1000 (* ?punt ?dur_rep))) ;repeticions per complir l'objectiu
	(bind ?rep (min ?rep_obj ?rep_max))
		;rep*dur/rep*punt > 100
		;rep*dur/rep*punt > 100
		;rep = 100 /(punt*dur/rep)
		
	(bind ?duracion (* ?rep ?dur_rep))
	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))
	
	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-duracion ?duracion)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?ej_rec put-ejercicio ?ej)
	(retract ?x)
		
	(printout t "Miau6" crlf)
	(bind ?tiempo_restante (- ?tiempo_disp ?duracion_real))
	(modify ?persona (tiempo_dispo ?tiempo_restante))
)


(defrule print_ej_rec
	(object (is-a Ejercicio+recomendado) (duracion ?duracion) (repeticiones ?repeticiones) (ejercicio ?ejercicio))
	=>
	(bind ?nombre_ej (send ?ejercicio get-nombre))
	(printout t ?nombre_ej crlf)
	(printout t ?duracion crlf)
	(printout t ?repeticiones crlf)
)



; (defrule lol
;  	(declare (salience 2))
;  	=>
; 	(bind ?respuesta (read))
; )

; 		;(bind ?int_ini (+ ?int_ini ?puntuacion_real))
; 		)
	
; 	;(modify ?persona (intensidad_inicial ?int_ini))
; )

;xmck <- (completitud_objetivo Adelgazar)

;AFEGIR PROBLEMA DE PRESSIO ALTA/BAIXA A LA ONTOLOGIA

;(exists(bebida ?precio:(< ?precio 5)))

; (defrule repeated-person
;    ?f1 <- (person (SSN ?ss))
;    ?f2 <- (person (SSN ?ss))
;    (test (< (fact-index ?f1) (fact-index ?f2)))
;    =>
;    (printout t "Duplicated SSN " ?ss crlf))
; CLIPS> (agenda)
; 0      repeated-person: f-1,f-2
; For a total of 1 activation.