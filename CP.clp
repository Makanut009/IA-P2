;;////////////////////
;;      TEMPLATES       
;;///////////////////

(deftemplate Persona "Datos introducidos por la persona"
	(slot nombre (type STRING))
	(slot edad (type INTEGER))
	(slot altura (type INTEGER))
	(slot peso (type INTEGER))
	(slot IMC (type INTEGER))
	(slot intensidad_inicial (type INTEGER))
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
    (bind ?altura (pregunta-numerica "Altura (cm): " 0 150))
    (bind ?peso (pregunta-numerica "Peso (kg): " 0.0 600.0))
	(bind ?IMC (/ ?peso (* ?altura ?altura)))
;	(if (< ?imc 18.5) then (anadir-ProblemaIMC )
    (bind ?presion_min (pregunta-numerica "Presion sanguinea minima: " 0.0 200.0))
	(bind ?presion_max (pregunta-numerica "Presion sanguinea maxima: " 0.0 200.0))
	;(if (presion demasiado alta) then ...)

	(assert
		(Persona
   		(nombre ?nombre)
   		(edad ?edad)
   		(altura ?altura)
   		(peso ?peso)
		(IMC ?IMC)
		(presion_min ?presion_min)
		(presion_max ?presion_max))
	)
)
	;; TO-DO: Pedir que haga un ejercicio

; (defrule introduce-habito
; 	(declare (salience 69))
; 	=>
; 	(bind ?respuesta (si-o-no-p "Tienes trabajo? "))
; 	(if (eq ?respuesta TRUE) then (assert(actividad "trabajo")))
; 	(bind ?respuesta (si-o-no-p "Llevas a cabo tareas domesticas regularmente? "))
; 	(if (eq ?respuesta TRUE) then (assert(actividad "domesticas")))
; 	(bind ?respuesta (si-o-no-p "Haces otras actividades? "))
; 	(if (eq ?respuesta TRUE) then (assert(actividad "otras")))
; 	(bind ?respuesta (si-o-no-p "Tienes problemas musculo-esqueleticos? "))
; 	(if (eq ?respuesta TRUE) then (assert(problemas)))
; )

; (defrule pide-actividades-trabajo
; 	(declare (salience 30))
; 	(actividad "trabajo")
; 	=>
; 	(printout t "Miau" crlf)
; )

; (defrule pide-actividades-domesticas
; 	(declare (salience 30))
; 	(actividad "domesticas")
; 	=>
; 	(printout t "Miau2" crlf)
; )

; (defrule modificapaciente
;      ?erroneo <- (paciente (nombre pedrito))
; =>
;      (modify ?erroneo (nombre Pedro)
; )

(defrule introduce-habitos
	(declare (salience 30))
	?persona <- (Persona (nombre ?nombre))
	?x <- (create$)
	(Persona (habitos ?hab))
	(eq ?hab ?x)
	=>
	(bind ?lista_actividades (find-all-instances ((?a Habito+personal)) TRUE))
	(printout t crlf "0 : Ya esta" crlf)
	(loop-for-count (?i 1 (length$ ?lista_actividades)) do
		(bind ?aux (nth$ ?i ?lista_actividades))
		(printout t ?i " : " (send ?aux get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?respuesta (pregunta-numerica "Que habitos tienes? " 0 (length$ ?lista_actividades)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do 
		(bind ?actividad (nth$ ?respuesta ?lista_actividades))
		(send ?actividad put-duracion   (pregunta-numerica "Durante cuanto tiempo? (minutos)" 0 600))
		(send ?actividad put-frecuencia Diaria)
		;(slot-insert$ ?persona habitos 1000 ?actividad)
		;(insert$ ?persona (habitos ?hab)) 1 ?actividad)
		;(insert ?lista (habitos ?actividad))
		(insert$ ?lista 1 ?actividad)
		(bind ?respuesta (pregunta-numerica "Cual mas? " 0 (length$ ?lista_actividades)))
	)
	(modify ?persona (habitos ?lista))
	(focus MAIN)

	
	; (replace$ <lista-a-modifcar> <inicio> <final> <lista-nuevos-valores>)
	; (replace$ (create$ a b c) 3 3 x)−→(a b x)
)	