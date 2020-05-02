;;////////////////////
;;      TEMPLATES       
;;///////////////////

(deftemplate Persona "Datos introducidos por la persona"
	(slot nombre (type STRING))
	(slot edad (type INTEGER))
	(slot altura (type INTEGER))
	(slot peso (type INTEGER))
	(slot IMC (type FLOAT))
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

; (deffunction pregunta-frec (?pregunta ?rangini ?rangfi) 
; 	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
; 	(printout t crlf "1. Diariamente" crlf)
; 	(printout t "2. Varias veces a la semana" crlf)
; 	(printout t "3. Semanalmente" crlf)
; 	(bind ?respuesta (read)) 
; 	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do 
; 		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
; 		(bind ?respuesta (read)) 
; 	)
; 	if (eq ?respuesta 1) then Diaria
; 	else if (eq ?respuesta 2) then Varias_veces_a_la_semana
; 	else if (eq ?respuesta 3) then Semanal
; )

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

(deffunction calcular_int_imc(?imc)
	(if (< ?imc 15) then -30 else
	(if (< ?imc 16) then -20 else
	(if (< ?imc 18.5) then -10 else
	(if (< ?imc 25) then 0 else
	(if (< ?imc 30) then -10 else 
	(if (< ?imc 35) then -20 else
	(if (< ?imc 40) then -30 else
	-40)))))))
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
	(bind ?altura_metros (/ ?altura 100))
	(bind ?IMC (/ ?peso (* ?altura_metros ?altura_metros)))
    (bind ?presion_min (pregunta-numerica "Presion sanguinea minima: " 0.0 200.0))
	(bind ?presion_max (pregunta-numerica "Presion sanguinea maxima: " 0.0 200.0))

	(bind ?tiempo_diario_disp (* 60 (pregunta-numerica5 "Tiempo diario disponible, ha de ser multiple de 5 min: " 30 300)))

	(assert
		(Persona
   		(nombre ?nombre)
   		(edad ?edad)
   		(altura ?altura)
   		(peso ?peso)
		(IMC ?IMC)
		(presion_min ?presion_min)
		(presion_max ?presion_max)
		(tiempo_dispo ?tiempo_diario_disp)
		(intensidad_inicial Nula))
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
		(bind ?frecuencia (pregunta-numerica "Cuantos dias a la semana?" 1 7))
		(send ?habito put-frecuencia ?frecuencia)
		(bind ?lista (insert$ ?lista 1 ?habito))
		(bind ?respuesta (pregunta-numerica "Cual mas? " 0 (length$ ?lista_habitos)))
	)
	(modify ?persona (habitos ?lista))
	(retract ?nhb)
)	

(defrule introduce-problemas
	(declare (salience 25))
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
	(declare (salience 20))
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
	(declare (salience 19))
	=>
	(focus inferir-datos)
	(assert (problemas_inferidos))
)

(defmodule inferir-datos "Modulo de inferencia"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (export ?ALL))


(defrule infiere_problemas
	(declare (salience 18))
	?pi <- (problemas_inferidos)
	?persona <- (Persona (problemas $?problemas) (edad ?edad) (presion_max ?presion_max) (presion_min ?presion_min) (IMC ?imc))
	=>
	(bind ?lista_problemas_inferidos (create$))
	
	;;;;;;;PROBLEMAS DE PESO;;;;;;
	(if (> ?imc 40.0) then
		(bind ?problema (find-instance ((?p Problema+peso)) (eq ?p:nombre "Extremadamente obeso")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)
	(if (< ?imc 18.5) then
		(bind ?problema (find-instance ((?p Problema+peso)) (eq ?p:nombre "Extremadamente delgado")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)
	
	;;;;;;;PROBLEMAS DE EDAD;;;;;;
	(if (> ?edad 65) then 
		(bind ?problema (find-instance ((?p Problema+edad)) (eq ?p:nombre "Edad avanzada")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)
	(if (< ?edad 10) then
		(bind ?problema (find-instance ((?p Problema+edad)) (eq ?p:nombre "Edad temprana")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)
	
	;;;;;;;PROBLEMAS DE PRESION;;;;;;
	(if (or (> ?presion_max 130) (> ?presion_min 90)) then
		(bind ?problema (find-instance ((?p Problema+presion)) TRUE))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)
	(if (or (< ?presion_max 90) (< ?presion_min 60)) then
		(bind ?problema (find-instance ((?p Problema+presion)) TRUE))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
	)

	; FALTA AÑADIR PROBLEMAS INFERIDOS A PARTIR DE LOS EJERCICIOS SENCILLOS Y DE LA DIETA

	(bind ?lista_final (insert$ $?problemas 1 ?lista_problemas_inferidos))
	(modify ?persona (problemas ?lista_final))
	(retract ?pi)
)

(defrule calcula_int_inicial
	(declare (salience 18))
	?persona <- (Persona (habitos $?lista_habitos) (IMC ?IMC) (intensidad_inicial Nula))
	=>
	;IMC
	(printout t ?IMC crlf)
	(bind ?int_ini (calcular_int_imc ?IMC)) ;FALTA ACABAR DE REPASSAR-LA

	;DIETA
	;(bind ?int_ini (+ ?int_ini (calcular_int_dieta ?persona:dieta)))

	;EJERCICIOS SENCILLOS
	;(bind ?int_ini (+ ?int_ini (calcular_int_ejercicios ?persona:ejercicios)))
	
	(printout t (length$ $?lista_habitos) crlf)
	(printout t ?int_ini crlf)

	;HABITOS PERSONALES
	(progn$ (?habito ?lista_habitos)
		(bind ?duracion (send ?habito get-duracion))
		(bind ?puntuacion (send ?habito get-puntuacion))
		(bind ?frec (send ?habito get-frecuencia))
 
		; (if (eq ?frec Diaria) then (bind ?frec2 30) else
		; 	(if (eq ?frec Semanal) then (bind ?frec2 4) else
		; 		(if (eq ?frec Varias_veces_a_la_semana) then (bind ?frec2 1))
		; 	)
		; )
		(bind ?puntuacion_real (* ?puntuacion ?frec)) ;(* ?frec ?duracion))) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		(bind ?int_ini (+ ?int_ini ?puntuacion_real))
	)
	
	;		   -30            0            30
	;-----------|-------------|-------------|---------------
	;	Baja				Media				   Alta

	(if (<= ?int_ini -30) then (bind ?int_ini_cat Baja)
	else (if (< ?int_ini 30) then (bind ?int_ini_cat Media)
	else (bind ?int_ini_cat Alta)))

	(printout t "8===============================D O: <- eva elfie " ?int_ini_cat crlf)
	
	(modify ?persona (intensidad_inicial ?int_ini_cat))
)

(deftemplate objetivo_cumplido (slot objetivo (type INSTANCE)))

(defrule objetivos_cumplidos_habitos
	(declare (salience 17))
	?nhoc <- (no_hay_obj_cumpl)
	(Persona (habitos $?lista_habitos))
	=>
	(progn$ (?habito ?lista_habitos)
		(bind ?lista_objetivos (send ?habito get-favorable))
		(progn$ (?objetivo ?lista_objetivos)
			(assert (objetivo_cumplido (objetivo ?objetivo)))
		)
	)
	(retract ?nhoc)
)

(defrule junta_pares
	(declare (salience 16))
	?x1 <- (objetivo_cumplido (objetivo ?objetivo))
	?x2 <- (objetivo_cumplido (objetivo ?objetivo))
	(test (neq (fact-index ?x1) (fact-index ?x2)))
	=>
	(assert (objetivo_cumplido (objetivo ?objetivo)))
	(retract ?x1)
	(retract ?x2)
)

(deftemplate ejercicio_puntuado (slot ejercicio (type INSTANCE)) (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER)))

(defrule objetivos_cumplidos_ejercicios
	(declare (salience 15))
	?nhoe <- (no_hay_obj_eje)
	?persona <- (Persona (objetivos $?objetivos_persona) (intensidad_inicial ?int_ini) (problemas $?problemas_persona))
	=>
	(bind ?lista_ejercicios (find-all-instances ((?ej Ejercicio)) (eq ?ej:intensidad ?int_ini)))
	
	(progn$ (?ejercicio ?lista_ejercicios)
		(bind ?problemas_ej (send ?ejercicio get-contraindicado))
		(bind ?problematico FALSE)
		(progn$ (?problema_ej ?problemas_ej)
			(if (member ?problema_ej $?problemas_persona) then (bind ?problematico TRUE))
		)
		(if (eq ?problematico FALSE) then
			(bind ?puntuacion (send ?ejercicio get-puntuacion))
			(bind ?intensidad (send ?ejercicio get-intensidad))
			(bind ?lista_objetivos (send ?ejercicio get-objetivos))
			(progn$ (?objetivo ?lista_objetivos)
				(if (member ?objetivo $?objetivos_persona) 
					then (assert (ejercicio_puntuado (ejercicio ?ejercicio) (objetivo ?objetivo) (puntuacion ?puntuacion))))
			)
		)
	)
	(retract ?nhoe)
)
;; ;; ;; delete$ <lista> <indice-inicio> <indice-final>)
;; ;; ;; .Se borrarán todos los elementos del rango entre las posiciones inicio y final, ambas incluidas.También exist


;(bind ?rectangulos (find-all-instances ((?inst Rectangulo)) (> ?inst:altura 10)))

;(deftemplate ejercicio_tiempo (slot ejercicio) (slot tiempo) (slot puntuacion))

;(deftemplate ejercicio_puntuado_max (slot ejercicio (type INSTANCE)) (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER)))

(defrule coge_maximo
	(declare (salience 14))
	?x1 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt1))
	?x2 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?x1) (fact-index ?x2)))
	=>
	(assert (ejercicio_puntuado (objetivo ?objetivo) (puntuacion (max ?punt1 ?punt2))))
	(retract ?x1)
	(retract ?x2)
)

(defrule quita_ejercicios_ya_cumplidos_con_habitos
	(declare (salience 13))
	?x1 <- (objetivo_cumplido (objetivo ?objetivo))
	?x2 <- (ejercicio_puntuado (objetivo ?objetivo))
	=>
	(retract ?x2)
)

(defrule asigna_tiempo
	(declare (salience 12))
	?persona <- (Persona (tiempo_dispo ?tiempo_disp))
	?ej_punt <- (ejercicio_puntuado (ejercicio ?ej) (objetivo ?objetivo))
	=>
	(bind ?dur_rep (send ?ej get-duracion_por_rep))
	(bind ?rep_max (send ?ej get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))
		
	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))
	
	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?ej_rec put-ejercicio ?ej)
	(retract ?ej_punt)

	(bind ?tiempo_restante (- ?tiempo_disp ?duracion_real))
	(modify ?persona (tiempo_dispo ?tiempo_restante))
)

(defrule crea_rutina
	(declare (salience 11))
	=>
	(bind ?lista_ejercicios_reco (find-all-instances ((?ej Ejercicio+recomendado)) TRUE))
	(bind ?duracion_total 0)
	(bind ?lista_objetivos (create$))
	(progn$ (?ej_rec ?lista_ejercicios_reco)
		(bind ?duracion_total (+ (send ?ej_rec get-duracion) ?duracion_total))
		(bind ?ejercicio (send ?ej_rec get-ejercicio))
		(bind ?lista_objetivos (insert$ ?lista_objetivos 1 (send ?ejercicio get-objetivos)))
	)

	(bind ?rutina (make-instance (gensym*) of Rutina+diaria))
	(send ?rutina put-duracion+total ?duracion_total)
	(send ?rutina put-objetivos ?lista_objetivos)
	(send ?rutina put-ejercicios ?lista_ejercicios_reco)
)

(defrule crea_programa
	(declare (salience 10))
	=>
	(bind ?lista_rutinas (find-all-instances ((?ej Rutina+diaria)) TRUE))
	(bind ?programa (make-instance (gensym*) of Programa))
	
	(bind ?aux ?lista_rutinas)
	(loop-for-count (?i 1 6) do 
		(bind ?lista_rutinas (insert$ ?lista_rutinas 1 ?aux))
	)
	(send ?programa put-rutinas+diarias ?lista_rutinas)
)

(defrule print_programa
	(object (is-a Programa) (rutinas+diarias $?rutinas))
	=>
	(bind ?dia 1)
	(bind ?obj_programa (create$))
	(progn$ (?rutina $?rutinas)
		(send ?rutina put-dia ?dia)
		(printout t "Dia " ?dia ": " crlf)

		;Ejercicios de la rutina diaria
		(bind ?ejercicios_rutina (send ?rutina get-ejercicios))
		(progn$  (?ejercicio_rec ?ejercicios_rutina)
			(bind ?ejercicio (send ?ejercicio_rec get-ejercicio))
			(printout t (send ?ejercicio get-nombre) crlf)
			(printout t "Duracion (seg): " (send ?ejercicio_rec get-duracion) crlf)
			(printout t "Repeticiones: " (send ?ejercicio_rec get-repeticiones) crlf)
			(printout t crlf)
		)
		(printout t "Duracion total: " (send ?rutina get-duracion+total) crlf)
		
		;Objetivos que cumple la rutina diaria
		(bind ?objetivos_rutina (send ?rutina get-objetivos))
		(progn$  (?objetivo ?objetivos_rutina)
			(if (not (member ?objetivo ?obj_programa)) then
				(bind ?obj_programa (insert$ ?obj_programa 1 ?objetivo))
			)
		)
		(bind ?dia (+ ?dia 1))
		(printout t crlf crlf)
	)
	(printout t "Objetivos cumplidos en el programa: " crlf)
	(progn$ (?objetivo $?obj_programa)
		(printout t (send ?objetivo get-nombre) crlf)
	)
)

