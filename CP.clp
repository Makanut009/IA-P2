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
	(multislot habitos (type INSTANCE))
	(multislot problemas (type INSTANCE))
	(multislot objetivos (type INSTANCE))
)

(deftemplate Ejercicio_sencillo "Test recomendado"
	; (slot nombre (type SYMBOL)
	; 	(allowed-values Subir_escaleras_1_min Correr_1_min))
	(slot ppm (type INTEGER))
	(slot cansancio (type INTEGER))
	(slot mareo (type INTEGER))
	(slot tirantez_muscular (type INTEGER))
)

(deftemplate Dieta "Dieta del usuario"
	(slot consumo_de_fruta (type INTEGER))
	(slot consumo_de_verdura (type INTEGER))
	(slot abuso_de_sal (type INTEGER))
	(slot picar_entre_horas (type INTEGER))
	(slot comida_basura (type INTEGER))
)

(deftemplate objetivo_cumplido_habito (slot objetivo (type INSTANCE)) (slot puntuacion (type INTEGER) (default 0)))

(deftemplate lista_ejercicios_por_objetivo (slot objetivo (type INSTANCE)) (multislot ejercicios (type INSTANCE)))

(deftemplate lista_ejercicios_por_objetivo2 (slot objetivo (type INSTANCE)) (multislot ejercicios (type INSTANCE)))

(deftemplate lista_objetivos1 (slot nombre (type INTEGER)) (multislot objetivos (type INSTANCE)))
(deftemplate lista_objetivos2 (slot nombre (type INTEGER)) (multislot objetivos (type INSTANCE)))

(deftemplate ejercicio_objetivo "Ejercicio y el objetivo que cumple"
	(slot ejercicio)
	(slot objetivo)
	(slot duracion)
	(slot repeticiones)
)

(deftemplate ejercicios_rutina (slot dia (type INTEGER)) (multislot ejercicios (type INSTANCE)))


;;////////////////////
;;      FUNCIONES       
;;///////////////////

(deffunction pregunta-general (?pregunta)
	(format t "%s" ?pregunta) 
	(bind ?respuesta (readline)) 
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

(deffunction pregunta (?pregunta $?valores-permitidos)
	(progn$
		(?var ?valores-permitidos)
		(lowcase ?var))
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
		(while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
	)
	?respuesta
)

(deffunction si-o-no-p (?pregunta)
	(bind ?respuesta (pregunta ?pregunta si no s n))
	(if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
		then TRUE
		else FALSE
	)
)

(deffunction calcular_int_ini_imc(?imc)
	(if (< ?imc 15) then -30 else
	(if (< ?imc 16) then -20 else
	(if (< ?imc 18.5) then -10 else
	(if (< ?imc 25) then 0 else
	(if (< ?imc 30) then -10 else 
	(if (< ?imc 35) then -20 else
	(if (< ?imc 40) then -30 else
	-40)))))))
)

(deffunction calcular_int_ini_dieta(?fruta ?verdura ?sal ?basura ?picar)
	(bind ?resultado 0)
	(bind ?resultado (+ ?resultado (* 2 ?fruta)))
	(bind ?resultado (+ ?resultado (* 2 ?verdura)))
	(bind ?resultado (- ?resultado ?sal))
	(bind ?resultado (- ?resultado (* 2 ?basura)))
	(bind ?resultado (- ?resultado (* 2 ?picar)))
	?resultado
)

(deffunction calcular_int_ini_ejercicios(?edad ?ppm ?cansancio ?mareo ?tirantez)
	(bind ?resultado 0)
	(bind ?resultado (+ ?resultado (* 2 ?ppm)))
	;; 10+(220-edad x 0,85).
	(bind ?ppmIdealCorriendo (- 220 (* ?edad 0.85)))
	(bind ?ppmIdealA (+ ?ppmIdealCorriendo 10))
	(if (> ?ppm ?ppmIdealA) then (bind ?resultado (- ?resultado 15)))

	(if (> ?cansancio 5) then (bind ?resultado (- ?resultado ?cansancio)))
	(bind ?resultado (- ?resultado ?mareo))
	(bind ?resultado (- ?resultado ?tirantez))
	?resultado
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
	(bind ?edad (pregunta-numerica "Edad (anos): " 0 120))
    (bind ?altura (pregunta-numerica "Altura (cm): " 1 250))
    (bind ?peso (pregunta-numerica "Peso (kg): " 1.0 600.0))
	(bind ?altura_metros (/ ?altura 100))
	(bind ?IMC (/ ?peso (* ?altura_metros ?altura_metros)))
    (bind ?presion_min (pregunta-numerica "Presion sanguinea minima: " 0.0 200.0))
	(bind ?presion_max (pregunta-numerica "Presion sanguinea maxima: " 0.0 200.0))

	(printout t crlf "Introduce el tiempo que tienes disponibe cada dia. Tiene que ser multiple de 5 minutos:" crlf)
	
	(bind ?t1 (* 60 (pregunta-numerica5 "Dia 1: " 30 300)))
	(bind ?t2 (* 60 (pregunta-numerica5 "Dia 2: " 30 300)))
	(bind ?t3 (* 60 (pregunta-numerica5 "Dia 3: " 30 300)))
	(bind ?t4 (* 60 (pregunta-numerica5 "Dia 4: " 30 300)))
	(bind ?t5 (* 60 (pregunta-numerica5 "Dia 5: " 30 300)))
	(bind ?t6 (* 60 (pregunta-numerica5 "Dia 6: " 30 300)))
	(bind ?t7 (* 60 (pregunta-numerica5 "Dia 7: " 30 300)))

	(bind ?dia1 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia1 put-dia 1)
	(send ?dia1 put-tiempo_disp ?t1)
	(send ?dia1 put-ejercicios (create$))
	(send ?dia1 put-objetivos (create$))

	(bind ?dia2 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia2 put-dia 2)
	(send ?dia2 put-tiempo_disp ?t2)
	(send ?dia2 put-ejercicios (create$))
	(send ?dia2 put-objetivos (create$))

	(bind ?dia3 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia3 put-dia 3)
	(send ?dia3 put-tiempo_disp ?t3)
	(send ?dia3 put-ejercicios (create$))
	(send ?dia3 put-objetivos (create$))

	(bind ?dia4 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia4 put-dia 4)
	(send ?dia4 put-tiempo_disp ?t4)
	(send ?dia4 put-ejercicios (create$))
	(send ?dia4 put-objetivos (create$))

	(bind ?dia5 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia5 put-dia 5)
	(send ?dia5 put-tiempo_disp ?t5)
	(send ?dia5 put-ejercicios (create$))
	(send ?dia5 put-objetivos (create$))

	(bind ?dia6 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia6 put-dia 6)
	(send ?dia6 put-tiempo_disp ?t6)
	(send ?dia6 put-ejercicios (create$))
	(send ?dia6 put-objetivos (create$))

	(bind ?dia7 (make-instance (gensym*) of Rutina+diaria))
	(send ?dia7 put-dia 7)
	(send ?dia7 put-tiempo_disp ?t7)
	(send ?dia7 put-ejercicios (create$))
	(send ?dia7 put-objetivos (create$))

	(assert
		(Persona
   		(nombre ?nombre)
   		(edad ?edad)
   		(altura ?altura)
   		(peso ?peso)
		(IMC ?IMC)
		(presion_min ?presion_min)
		(presion_max ?presion_max)
		(intensidad_inicial Nula))
	)
	(assert (no_hay_habitos))
)

(defrule introduce-habitos
	(declare (salience 30))
	?nhb <- (no_hay_habitos)
	?persona <- (Persona)
	=>
	(bind ?lista_habitos (find-all-instances ((?a Habito+personal)) TRUE))
	(printout t crlf "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_habitos)) do
		(bind ?habito (nth$ ?i ?lista_habitos))
		(printout t ?i ". " (send ?habito get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?respuesta (pregunta-numerica "Que habitos tienes? " 0 (length$ ?lista_habitos)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do 
		(bind ?habito (nth$ ?respuesta ?lista_habitos))
		(bind ?frecuencia (pregunta-numerica "Cuantos dias a la semana?" 1 7))
		(send ?habito put-frecuencia ?frecuencia)
		(bind ?duracion (pregunta-numerica "Durante cuanto tiempo al dia? (minutos)" 0 600))
		(send ?habito put-duracion ?duracion)
		(bind ?lista (insert$ ?lista 1 ?habito))
		(bind ?respuesta (pregunta-numerica "Alguno mas? " 0 (length$ ?lista_habitos)))
	)
	(modify ?persona (habitos ?lista))
	(retract ?nhb)
	(assert (no_hay_dieta))
)	

(defrule introducir-dieta
	(declare (salience 27))
	?nhd <- (no_hay_dieta)
	=>
	(printout t crlf)
	(bind ?fruta (pregunta-numerica "Valora tu consumo de fruta: " 0 10))
	(bind ?verdura (pregunta-numerica "Valora tu consumo de verdura: " 0 10))
	(bind ?sal (pregunta-numerica "Valora cuanta sal consumes normalmente: " 0 10))
	(bind ?picar (pregunta-numerica "Valora cuanto sueles picar entre horas: " 0 10))
	(bind ?basura (pregunta-numerica "Valora tu consumo de bolleria industrial u otra comida basura: " 0 10))
	(printout t crlf)
	(assert
		(Dieta
   		(consumo_de_fruta ?fruta)
		(consumo_de_verdura ?verdura)
   		(abuso_de_sal ?sal)
		(picar_entre_horas ?picar)
		(comida_basura ?basura))
	)
	(retract ?nhd)
	(assert (no_hay_problemas))
)

(defrule introduce-problemas
	(declare (salience 25))
	?nhp <- (no_hay_problemas)	
	?persona <- (Persona)
	=>
	(printout t "Problemas musculo-esqueleticos: " crlf)
	(bind ?lista_problemas_musc (find-all-instances ((?p Problemas+musculo-esqueleticos)) TRUE))
	(printout t crlf "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_problemas_musc)) do
		(bind ?aux (nth$ ?i ?lista_problemas_musc))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?respuesta (pregunta-numerica "Que problema de estos tienes? " 0 (length$ ?lista_problemas_musc)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do 
		(bind ?problema (nth$ ?respuesta ?lista_problemas_musc))
		(bind ?lista (insert$ ?lista 1 ?problema))
		(bind ?respuesta (pregunta-numerica "Tienes algun problema mas? " 0 (length$ ?lista_problemas_musc)))
	)
	(modify ?persona (problemas ?lista))
	(retract ?nhp)
	(assert (no_hay_objetivos))
)

(defrule introduce-objetivos
	(declare (salience 20))
	?nho <- (no_hay_objetivos)
	?persona <- (Persona)
	=>
	(bind ?lista_objetivos (find-all-instances ((?o Objetivo)) TRUE))
	(printout t crlf "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_objetivos)) do
		(bind ?aux (nth$ ?i ?lista_objetivos))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?respuesta (pregunta-numerica "Que objetivo tienes? " 0 (length$ ?lista_objetivos)))
	(bind ?lista (create$))
	(while (> ?respuesta 0) do
		(bind ?objetivo (nth$ ?respuesta ?lista_objetivos))
		(bind ?lista (insert$ ?lista 1 ?objetivo))
		(bind ?respuesta (pregunta-numerica "Que objetivo mas tienes? " 0 (length$ ?lista_objetivos)))
	)
	(modify ?persona (objetivos ?lista))
	(retract ?nho)
	(assert (no_hay_ej_sencillos))
)

(defrule introducir-ejercicios-sencillos
	(declare (salience 19))
	?nhes <- (no_hay_ej_sencillos)
	?persona <- (Persona (edad ?edad))
	=>
	(printout t crlf)
	(bind ?respuesta FALSE)
	(if (< ?edad 40) then
		(bind ?respuesta (si-o-no-p "Quieres realizar un ejercicio sencillo para tener mas informacion sobre tu estado fisico"))
	else (bind ?respuesta TRUE))
	(printout t crlf)

	(if (eq ?respuesta TRUE) then
		(printout t "Corre sostenidamente durante un minuto y contesta las preguntas:" crlf)
		(bind ?ppm (pregunta-numerica "Cuantas pulsaciones tienes?" 0 200))
		(bind ?mareo (pregunta-numerica "Te sientes maredo?" 0 10))
		(bind ?cansancio (pregunta-numerica "Te sientes cansado?" 0 10))
		(bind ?tirantez (pregunta-numerica "Tienes tirantez muscular en algun lugar del cuerpo?" 0 10))
		(printout t crlf)
	else
		(bind ?ppm (- 220 (* 0.85 ?edad)))
		(bind ?mareo 0)
		(bind ?cansancio 0)
		(bind ?tirantez 0)
	)

	(assert
		(Ejercicio_sencillo
		(ppm ?ppm)
   		(mareo ?mareo)
		(cansancio ?cansancio)
   		(tirantez_muscular ?tirantez))
	)

	(if (eq ?respuesta TRUE) then
		(printout t "Sube y baja escaleras durante un minuto y contesta las preguntas:" crlf)
		(bind ?ppm (pregunta-numerica "Cuantas pulsaciones tienes?" 0 200))
		(bind ?mareo (pregunta-numerica "Te sientes maredo?" 0 10))
		(bind ?cansado (pregunta-numerica "Te sientes cansado?" 0 10))
		(bind ?tirantez (pregunta-numerica "Tienes tirantez muscular en algun lugar del cuerpo?" 0 10))
		(printout t crlf)
	else
		(bind ?ppm (- 220 (* 0.85 ?edad)))
		(bind ?mareo 0)
		(bind ?cansancio 0)
		(bind ?tirantez 0)
	)

	(assert
		(Ejercicio_sencillo
		(ppm ?ppm)
   		(mareo ?mareo)
		(cansancio ?cansancio)
   		(tirantez_muscular ?tirantez))
	)
	(retract ?nhes)
)

(defrule pasa-a-inferir
	(declare (salience 19))
	=>
	(focus inferir-datos)
	(assert (infiere_problemas))
)

(defmodule inferir-datos "Modulo de inferencia"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (export ?ALL))

(defrule infiere_problemas
	(declare (salience 18))
	?ip <- (infiere_problemas)
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

	(bind ?lista_final (insert$ $?problemas 1 ?lista_problemas_inferidos))
	(modify ?persona (problemas ?lista_final))
	(retract ?ip)
)

(defrule calcula_int_inicial
	(declare (salience 18))
	?persona <- (Persona (edad ?edad) (habitos $?lista_habitos) (IMC ?IMC) (intensidad_inicial Nula))
	?dieta <- (Dieta (consumo_de_fruta ?fruta) (consumo_de_verdura ?verdura) (abuso_de_sal ?sal) (comida_basura ?basura) (picar_entre_horas ?picar))
	?ej_sencillo <- (Ejercicio_sencillo (ppm ?ppm) (cansancio ?cansancio) (mareo ?mareo) (tirantez_muscular ?tirantez))
	=>
	;IMC
	(bind ?int_ini (calcular_int_ini_imc ?IMC))

	;DIETA
	(bind ?int_ini (+ ?int_ini (calcular_int_ini_dieta ?fruta ?verdura ?sal ?basura ?picar)))

	;EJERCICIOS SENCILLOS
	(bind ?int_ini (+ ?int_ini (calcular_int_ini_ejercicios ?edad ?ppm ?cansancio ?mareo ?tirantez)))

	;HABITOS PERSONALES
	(progn$ (?habito ?lista_habitos)
		(bind ?duracion (send ?habito get-duracion))
		(bind ?puntuacion (send ?habito get-puntuacion))
		(bind ?frec (send ?habito get-frecuencia))
		(bind ?puntuacion_real (* ?puntuacion ?frec)) ;(* ?frec ?duracion)))
		(bind ?int_ini (+ ?int_ini ?puntuacion_real))
	)
	
	;		   -30            0            30
	;-----------|-------------|-------------|---------------
	;	Baja				Media				   Alta

	(if (<= ?int_ini -30) then (bind ?int_ini_cat Baja)
	else (if (< ?int_ini 30) then (bind ?int_ini_cat Media)
	else (bind ?int_ini_cat Alta)))
	
	(modify ?persona (intensidad_inicial ?int_ini_cat))
	(assert (no_hay_obj_cumpl))
)

(defrule objetivos_cumplidos_habitos
	(declare (salience 17))
	?nhoc <- (no_hay_obj_cumpl)
	(Persona (habitos $?lista_habitos))
	=>
	(progn$ (?habito ?lista_habitos)
		(bind ?lista_objetivos (send ?habito get-favorable))
		(bind ?duracion (send ?habito get-duracion))
		(bind ?frec (send ?habito get-frecuencia))
		(progn$ (?objetivo ?lista_objetivos)
			(assert (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion (* ?duracion ?frec))))
		)
	)
	(retract ?nhoc)
	(assert (no_hay_obj_eje))
)

(defrule combina_objetivos
	(declare (salience 16))
	?o1 <- (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?punt1))
	?o2 <- (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?o1) (fact-index ?o2)))
	=>
	(assert (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion (+ ?punt1 ?punt2))))
	(retract ?o1)
	(retract ?o2)
)

(defrule objetivos_cumplidos_ejercicios
	(declare (salience 15))
	?nhoe <- (no_hay_obj_eje)
	?persona <- (Persona (objetivos $?objetivos_persona) (intensidad_inicial ?int_ini) (problemas $?problemas_persona))
	=>
	(printout t "objetivos_cumplidos_ejercicios" crlf)
	(progn$ (?obj_pers $?objetivos_persona)
		(bind ?lista_ejercicios (find-all-instances ((?ej Ejercicio)) (and (eq ?int_ini ?ej:intensidad) (member ?obj_pers ?ej:objetivos))))
		(bind ?aux (create$))
		(bind ?problematico FALSE)
		(loop-for-count (?i 1 (length$ ?lista_ejercicios)) do
			(bind ?ejercicio (nth$ ?i ?lista_ejercicios))
			(bind ?problemas_ej (send ?ejercicio get-contraindicado))
			(progn$ (?problema_ej ?problemas_ej)
 				(if (member ?problema_ej $?problemas_persona) then (bind ?problematico TRUE))
 			)
			(if (eq ?problematico FALSE) then (bind ?aux (insert$ ?aux 1 ?ejercicio)))
		)
		(assert (lista_ejercicios_por_objetivo (objetivo ?obj_pers) (ejercicios ?aux)))
	)
	(assert (lista_objetivos1 (nombre 1) (objetivos (create$))))
	(assert (lista_objetivos2 (nombre 2) (objetivos (create$))))
	(retract ?nhoe)
)

(defrule quita_ejercicios_ya_cumplidos_con_habitos
	(declare (salience 13))
	?obj <- (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?puntuacion_habito))
	?lista <- (lista_ejercicios_por_objetivo (objetivo ?objetivo) (ejercicios ?ejercicios))
	?lista_obj1 <- (lista_objetivos1 (objetivos $?objetivos))
	=>
	(printout t "quita_ejercicios_ya_cumplidos_con_habitos" clrf)
	(if (> ?puntuacion_habito 200) then
		(retract ?lista)
	else (if (> ?puntuacion_habito 150) then
		(bind ?ejercicios2 (create$))
		(loop-for-count (?i 1 (length$ ?ejercicios)) do
			(bind ?ejercicio (nth$ ?i ?ejercicios))
			(bind ?intensidad (send ?ejercicio get-intensidad))
			(bind ?nombre (send ?ejercicio get-nombre))
			(if (eq ?intensidad Alta) then
				(bind ?ej2 (find-instance ((?ej Ejercicio)) (and (eq ?ej:nombre ?nombre) (eq ?ej:intensidad Media))))
				(bind ?ejercicios2 (insert$ ?ejercicios2 ?i ?ej2))
			else (if (eq ?intensidad Media) then
					(bind ?ej2 (find-instance ((?ej Ejercicio)) (and (eq ?ej:nombre ?nombre) (eq ?ej:intensidad Baja))))
					(bind ?ejercicios2 (insert$ ?ejercicios2 ?i ?ej2))
				)
			else (bind ?ejercicios2 (insert$ ?ejercicios2 ?i ?ejercicio))
			)
		)
		(if (not (member ?objetivo $?objetivos)) then
			(bind ?aux (insert$ ?objetivos 1 ?objetivo))
			(modify ?lista_obj1 (objetivos ?aux))
		)
		(assert (lista_ejercicios_por_objetivo2 (objetivo ?objetivo) (ejercicios ?ejercicios2)))
		(retract ?lista)
	)
	else 
		(if (not (member ?objetivo ?objetivos)) then
			(bind ?aux (insert$ ?objetivos 1 ?objetivo))
			(modify ?lista_obj1 (objetivos ?aux))
		)
		(assert (lista_ejercicios_por_objetivo2 (objetivo ?objetivo) (ejercicios ?ejercicios)))
	)
)

(defrule pasa_a_2
	(declare (salience 12))
	?lista <- (lista_ejercicios_por_objetivo (objetivo ?objetivo) (ejercicios ?ejercicios))
	?lista_obj1 <- (lista_objetivos1 (objetivos $?objetivos))
	=>
	(printout t "pasa_a_2" crlf)
	(bind ?aux (insert$ ?objetivos 1 ?objetivo))
	(modify ?lista_obj1 (objetivos ?aux))
	(assert (lista_ejercicios_por_objetivo2 (objetivo ?objetivo) (ejercicios ?ejercicios)))
	(retract ?lista)
)

(defrule copia_l1_a_l2
	(declare (salience 11))
	?l1 <- (lista_objetivos1 (objetivos $?objetivos))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos2))
	(test(eq (length$ $?objetivos2) 0))
	=>
	(printout t "MARRAMIAU" crlf)
	(assert (lista_objetivos2 (objetivos $?objetivos)))
	(retract ?l2)
)

(defrule desglosa_ejercicios
	(declare (salience 10))
	?lista <- (lista_ejercicios_por_objetivo2 (objetivo ?objetivo) (ejercicios $?ejercicios))
	=>
	(progn$ (?ejercicio ?ejercicios)
		(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
		(bind ?rep_min (send ?ejercicio get-repeticiones+min))
		(bind ?duracion_min (* ?dur_rep ?rep_min))
		(assert (ejercicio_objetivo (objetivo ?objetivo) (ejercicio ?ejercicio) (duracion ?duracion_min) (repeticiones ?rep_min)))
	)
)

(defrule crea_rutinas_vacias
	(declare (salience 8))
	=>
	(assert (ejercicios_rutina (dia 1) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 2) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 3) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 4) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 5) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 6) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 7) (ejercicios (create$))))
)

(defrule dia1
	(declare (salience 7))
	?ej_rutina <- (ejercicios_rutina (dia 1) (ejercicios $?ejercicios))
	?rutina <- (object (is-a Rutina+diaria) (dia 1) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos))
	(ejercicio_objetivo (ejercicio ?ej1&:(not (member ?ej1 ?ejercicios))) (duracion ?d1&:(< ?d1 ?tiempo_disp)) (objetivo ?obj&:(member ?obj $?objetivos)))
	;(not(ejercicio_objetivo (ejercicio ?ej2&:(not (member ?ej2 ?ejercicios))) (duracion ?d2&:(< ?d2 ?d1))))
	=>
	(printout t "Dia 1" crlf)

	; Añadir ejercicio recomendado a la lista de la rutina, con su ejercicio, duracion y repeticiones
	(bind ?dur_rep (send ?ej1 get-duracion_por_rep))
	(bind ?rep_max (send ?ej1 get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ej1)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)

	; Sumar el tiempo del ejercicio a la duracion total de la rutina
	(bind ?dur_tot (send ?rutina get-duracion+total))
	(bind ?dur_tot (+ ?dur_tot ?duracion_real))
	(send ?rutina put-duracion+total ?dur_tot)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))
		
	; Añadir el ejercicio añadido a la lista de ejercicios que se hacen en la rutina (en el template)
	(bind ?aux (insert$ ?ejercicios 1 ?ej1))
	(modify ?ej_rutina (dia 1) (ejercicios ?aux))

	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))
	(send ?rutina put-objetivos (insert$ ?objetivos_rutina 1 ?obj))
	
	;Treure objectiu complert de lista_objetivos2
	(loop-for-count (?i 1 (length$ ?objetivos)) do
		(bind ?obj2 (nth$ ?i ?objetivos))
		(if (eq ?obj2 ?obj) then
			(modify ?l2 (objetivos (delete$ ?objetivos ?i ?i)))
		)
	)
	(assert (crear_programa))
)

(defrule crea_programa
	(declare (salience 6))
	(crear_programa)
	=>
	(bind ?rutinas (find-all-instances ((?ej Rutina+diaria)) TRUE))
	(bind ?programa (make-instance (gensym*) of Programa))
	(send ?programa put-rutinas+diarias ?rutinas)
)

(defrule print_programa
	(object (is-a Programa) (rutinas+diarias $?rutinas))
	?persona <- (Persona (nombre ?nombre))
	=>
	(printout t crlf crlf "PROGRAMA RECOMENDADO para " ?nombre ":")
	(bind ?dia 1)
	(bind ?obj_programa (create$))
	(progn$ (?rutina $?rutinas)
		(printout t crlf crlf)
		(printout t "Dia " ?dia ": " crlf)

		;Ejercicios de la rutina diaria
		(bind ?ejercicios_rutina (send ?rutina get-ejercicios))
		(progn$  (?ejercicio_rec ?ejercicios_rutina)
			(bind ?ejercicio (send ?ejercicio_rec get-ejercicio))
			(printout t (send ?ejercicio get-nombre) crlf)
			(bind ?duracion (/ (send ?ejercicio_rec get-duracion) 60))
			(if (and (> ?duracion 0) (< ?duracion 1)) then
			 	(printout t "Duracion: menos de un minuto" crlf) else
			 	(printout t "Duracion: " (round ?duracion) " minuto(s)" crlf)
			)	
			(printout t "Repeticiones: " (send ?ejercicio_rec get-repeticiones) crlf)
			(printout t crlf)
		)
		(printout t "Duracion total: " (div (send ?rutina get-duracion+total) 60) " minuto(s)" crlf)

		;Objetivos que cumple la rutina diaria
		(bind ?objetivos_rutina (send ?rutina get-objetivos))
		(progn$  (?objetivo ?objetivos_rutina)
			(if (not (member ?objetivo ?obj_programa)) then
				(bind ?obj_programa (insert$ ?obj_programa 1 ?objetivo))
			)
		)
		(bind ?dia (+ ?dia 1))
	)
	(printout t crlf "Objetivos cumplidos en el programa: " crlf)
	(progn$ (?objetivo $?obj_programa)
		(printout t " - " (send ?objetivo get-nombre) crlf)
	)
	(printout t crlf)
)