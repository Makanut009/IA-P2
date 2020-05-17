;;////////////////////
;;      TEMPLATES       
;;///////////////////

(deftemplate Persona 
	"Template para almacenar los datos introducidos por la persona"
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

(deftemplate Ejercicio_sencillo 
	"Template para representar los resultados de un test/ejercicio sencillo"
	(slot ppm (type INTEGER))
	(slot cansancio (type INTEGER))
	(slot mareo (type INTEGER))
	(slot tirantez_muscular (type INTEGER))
)

(deftemplate Dieta 
	"Template para representar la dieta del usuario"
	(slot consumo_de_fruta (type INTEGER))
	(slot consumo_de_verdura (type INTEGER))
	(slot abuso_de_sal (type INTEGER))
	(slot picar_entre_horas (type INTEGER))
	(slot comida_basura (type INTEGER))
)

; TEMPLATES AUXILIARES
; Estos templates se usan como estructuras auxiliares que facilitan la ejecución
; del código, pero no representan ningún elemento del enunciado en concreto.

(deftemplate objetivo_cumplido_habito 
	"Template auxiliar para almacenar cada objetivo que cumple un hábito y puntuacion con la que lo hace"
	(slot objetivo (type INSTANCE))
	(slot puntuacion (type INTEGER) (default 0))
)

(deftemplate lista_objetivos1
	"Template auxiliar para almacenar los objetivos que faltan por cumplir"
	(slot nombre (type INTEGER))
	(multislot objetivos (type INSTANCE))
)

(deftemplate lista_objetivos2
	"Template auxiliar para almacenar los objetivos que faltan por cumplir"
	(slot nombre (type INTEGER))
	(multislot objetivos (type INSTANCE))
)

(deftemplate ejercicio_objetivo 
	"Template auxiliar para almacenar cada ejercicio, su objetivo y duracion mínima"
	(slot ejercicio)
	(slot objetivo)
	(slot duracion)
	(slot rebajado)
)

(deftemplate ejercicios_rutina
	"Template auxiliar para almacenar la lista de ejercicios que se asignan a cada día del programa"
	(slot dia (type INTEGER))
	(multislot ejercicios (type INSTANCE))
)


;;////////////////////
;;      FUNCIONES       
;;///////////////////

; Función para realizar una pregunta de carácter general al usuario
(deffunction pregunta-general (?pregunta)
	(format t "%s" ?pregunta) 
	(bind ?respuesta (readline)) 
	?respuesta
)

; Función para realizar una pregunta numérica al usuario
(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi) 
	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
	(bind ?respuesta (read)) 
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do 
		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
		(bind ?respuesta (read)) 
	) 
	?respuesta
)

; Función para realizar una pregunta numérica al usuario. La respuesta debe ser múltiple de 5.
(deffunction pregunta-numerica5 (?pregunta ?rangini ?rangfi) 
	(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
	(bind ?respuesta (read)) 
	(while (not(and(eq (mod ?respuesta 5) 0) (and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi)))) do 
		(format t "%s [%d,%d] " ?pregunta ?rangini ?rangfi) 
		(bind ?respuesta (read)) 
	) 
	?respuesta
)

; Función para realizar una pregunta con opciones al usuario
(deffunction pregunta (?pregunta $?valores-permitidos)
	(progn$
		(?var ?valores-permitidos)
		(lowcase ?var))
		(format t "%s (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
		(while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
	)
	?respuesta
)

; Función para realizar una pregunta de sí o no al usuario
(deffunction si-o-no-p (?pregunta)
	(bind ?respuesta (pregunta ?pregunta si no))
	(if (eq (lowcase ?respuesta) si)
		then TRUE
		else FALSE
	)
)

; Función para calcular la intensidad inicial que se asigna al usuario según su IMC
(deffunction calcular_int_ini_imc (?imc)
	(if (< ?imc 15) then -30 else
	(if (< ?imc 16) then -20 else
	(if (< ?imc 18.5) then -10 else
	(if (< ?imc 25) then 0 else
	(if (< ?imc 30) then -10 else 
	(if (< ?imc 35) then -20 else
	(if (< ?imc 40) then -30 else
	-40)))))))
)

; Función para calcular la intensidad inicial que se asigna al usuario según su dieta
(deffunction calcular_int_ini_dieta (?fruta ?verdura ?sal ?basura ?picar)
	(bind ?resultado 0)
	(bind ?resultado (+ ?resultado (* 2 ?fruta)))
	(bind ?resultado (+ ?resultado (* 2 ?verdura)))
	(bind ?resultado (- ?resultado ?sal))
	(bind ?resultado (- ?resultado (* 2 ?basura)))
	(bind ?resultado (- ?resultado (* 2 ?picar)))
	?resultado
)

; Función para calcular la intensidad inicial que se asigna al usuario según los ejercicios sencillos / tests que realice
(deffunction calcular_int_ini_ejercicios (?edad ?ppm ?cansancio ?mareo ?tirantez)
	(bind ?resultado 0)

	;; Se aplica un factor de 10 + (220-edad x 0,85)
	(bind ?ppmIdealCorriendo (- 220 (* ?edad 0.85)))
	(bind ?ppmIdealA (+ ?ppmIdealCorriendo 10))
	(if (> ?ppm ?ppmIdealA) then (bind ?resultado (- ?resultado 15)))

	(if (> ?cansancio 5) then (bind ?resultado (- ?resultado (* 2 ?cansancio))))
	(bind ?resultado (- ?resultado (* 2 ?mareo)))
	(bind ?resultado (- ?resultado (* 2 ?tirantez)))
	?resultado
)


;;////////////////////
;;      REGLAS       
;;///////////////////

(defmodule MAIN "Módulo principal del programa"
	(export ?ALL)
)

(defrule inicio "Muestra la presentación del programa"
    (declare (salience 200))
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
   (export ?ALL)
)	

(defrule introducir-persona "Regla para introducir las características de la persona"
	(declare (salience 195))
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

	; Creamos la instancia de cada Rutina diaria, con el tiempo disponible, y ejercicios y objetivos vacíos
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

	; Creamos el hecho con la información de la persona
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

(defrule introduce-habitos "Regla para introducir los hábitos de la persona"
	(declare (salience 190))
	?nhb <- (no_hay_habitos)
	?persona <- (Persona)
	=>

	;Listamos todos los hábitos para que el usuario los elija
	(bind ?lista_habitos (find-all-instances ((?a Habito+personal)) TRUE))
	(printout t crlf crlf "HABITOS:" crlf crlf "0. No tengo ninguno mas" crlf)
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

	;Insertamos los hábitos elegidos en la lista de hábitos de la persona
	(modify ?persona (habitos ?lista)) 

	(retract ?nhb)
	(assert (no_hay_dieta))
)	

(defrule introducir-dieta "Regla para introducir la dieta de la persona"
	(declare (salience 185))
	?nhd <- (no_hay_dieta)
	=>
	(printout t crlf crlf "DIETA:" crlf crlf)
	(bind ?fruta (pregunta-numerica "Valora tu consumo de fruta: " 0 10))
	(bind ?verdura (pregunta-numerica "Valora tu consumo de verdura: " 0 10))
	(bind ?sal (pregunta-numerica "Valora cuanta sal consumes normalmente: " 0 10))
	(bind ?picar (pregunta-numerica "Valora cuanto sueles picar entre horas: " 0 10))
	(bind ?basura (pregunta-numerica "Valora tu consumo de bolleria industrial u otra comida basura: " 0 10))
	(printout t crlf)

	; Creamos el hecho con la información sobre la dieta del usuario
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

(defrule introduce-problemas "Regla para introducir los problemas de la persona"
	(declare (salience 180))
	?nhp <- (no_hay_problemas)	
	?persona <- (Persona)
	=>

	;Listamos todos los problemas musculo-esqueleticos para que el usuario los elija
	(printout t crlf "PROBLEMAS MUSCULO-ESQUELETICOS: " crlf)
	(bind ?lista_problemas_musc (find-all-instances ((?p Problema+musculo-esqueletico)) TRUE))
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

	;Listamos todos los problemas cardiorrespiratorios para que el usuario los elija
	(printout t crlf crlf "PROBLEMAS CARDIORRESPIRATORIOS: " crlf)
	(bind ?lista_problemas_cardioresp (find-all-instances ((?p Problema+cardiorrespiratorio)) TRUE))
	(printout t crlf "0. No tengo ninguno mas" crlf)
	(loop-for-count (?i 1 (length$ ?lista_problemas_cardioresp)) do
		(bind ?aux (nth$ ?i ?lista_problemas_cardioresp))
		(printout t ?i ". " (send ?aux get-nombre) crlf)
	)
	(printout t  crlf)
	(bind ?count 0)
	(bind ?respuesta (pregunta-numerica "Que problema de estos tienes? " 0 (length$ ?lista_problemas_cardioresp)))
	(while (> ?respuesta 0) do 
		(bind ?problema (nth$ ?respuesta ?lista_problemas_cardioresp))
		(bind ?lista (insert$ ?lista 1 ?problema))
		(bind ?count (+ ?count 1))
		(bind ?respuesta (pregunta-numerica "Tienes algun problema mas? " 0 (length$ ?lista_problemas_cardioresp)))
	)

	;Insertamos los problemas elegidos en la lista de problemas de la persona
	(modify ?persona (problemas ?lista))

	(assert (cardiorresp ?count))

	(retract ?nhp)
	(assert (no_hay_objetivos))
)

(defrule introduce-objetivos "Regla para introducir los objetivos de la persona"
	(declare (salience 175))
	?nho <- (no_hay_objetivos)
	?persona <- (Persona)
	=>

	;Listamos todos los objetivos para que el usuario los elija
	(printout t crlf crlf "OBJETIVOS: " crlf)
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

	;Insertamos los objetivos elegidos en la lista de objetivos de la persona
	(modify ?persona (objetivos ?lista))

	(retract ?nho)
	(assert (no_hay_ej_sencillos))
)

(defrule introducir-ejercicios-sencillos "Regla para introducir los resultados de los tests / ejercicios sencillos de la persona"
	(declare (salience 170))
	?nhes <- (no_hay_ej_sencillos)
	(Persona (edad ?edad))
	=>
	(printout t crlf crlf)

	; Si el usuario tiene menos de 40 años le preguntamos si quiere realizar los test. Si tiene más, lo hace obligatoriamente
	(bind ?respuesta FALSE)
	(if (< ?edad 40) then
		(bind ?respuesta (si-o-no-p "Quieres realizar un ejercicio sencillo para tener mas informacion sobre tu estado fisico?"))
	else (bind ?respuesta TRUE))

	; Pedimos que el usuario haga el primer test i que introduzca los resultados
	(printout t crlf)
	(if (eq ?respuesta TRUE) then
		(printout t "Corre sostenidamente durante un minuto y contesta las preguntas:" crlf)
		(bind ?ppm (pregunta-numerica "Cuantas pulsaciones tienes?" 0 200))
		(bind ?mareo (pregunta-numerica "Te sientes maredo?" 0 10))
		(bind ?cansancio (pregunta-numerica "Te sientes cansado?" 0 10))
		(bind ?tirantez (pregunta-numerica "Tienes tirantez muscular en algun lugar del cuerpo?" 0 10))
		(printout t crlf)
	else
		(bind ?ppm (- 220 (* 0.85 ?edad))) ; Valor por defecto (ideal) para no afectar a la intensidad
		(bind ?mareo 0)
		(bind ?cansancio 0)
		(bind ?tirantez 0)
	)

	; Creamos el hecho con la información sobre el test que ha realizado el usuario
	(assert
		(Ejercicio_sencillo
		(ppm ?ppm)
   		(mareo ?mareo)
		(cansancio ?cansancio)
   		(tirantez_muscular ?tirantez))
	)

	; Pedimos que el usuario haga el segundo test i que introduzca los resultados
	(if (eq ?respuesta TRUE) then
		(printout t "Sube y baja escaleras durante un minuto y contesta las preguntas:" crlf)
		(bind ?ppm (pregunta-numerica "Cuantas pulsaciones tienes?" 0 200))
		(bind ?mareo (pregunta-numerica "Te sientes maredo?" 0 10))
		(bind ?cansado (pregunta-numerica "Te sientes cansado?" 0 10))
		(bind ?tirantez (pregunta-numerica "Tienes tirantez muscular en algun lugar del cuerpo?" 0 10))
		(printout t crlf)
	else
		(bind ?ppm (- 220 (* 0.85 ?edad))) ; Valor por defecto (ideal) para no afectar a la intensidad
		(bind ?mareo 0)
		(bind ?cansancio 0)
		(bind ?tirantez 0)
	)

	; Creamos el hecho con la información sobre el test que ha realizado el usuario
	(assert
		(Ejercicio_sencillo
		(ppm ?ppm)
   		(mareo ?mareo)
		(cansancio ?cansancio)
   		(tirantez_muscular ?tirantez))
	)
	(retract ?nhes)
)


(defrule pasa-a-inferencia "Regla para pasar al módulo de inferencia de datos"
	(declare (salience 165))
	=>
	(focus inferencia)
	(assert (infiere_problemas))
)

(defmodule inferencia "Modulo de inferencia, donde se infieren nuevos datos a partir de los introducidos"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (export ?ALL)
)

(defrule infiere_problemas "Regla para inferir problemas de la persona según su peso, edad y presión sanguínea"
	(declare (salience 160))
	?ip <- (infiere_problemas)
	?persona <- (Persona (problemas $?problemas) (edad ?edad) (presion_max ?presion_max) (presion_min ?presion_min) (IMC ?imc))
	=>
	(bind ?lista_problemas_inferidos (create$))
	
	;;;;;;;PROBLEMAS DE PESO;;;;;;
	(if (> ?imc 40.0) then
		(bind ?problema (find-instance ((?p Problema+peso)) (eq ?p:nombre "Extremadamente obeso")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Extremadamente obeso]" crlf)
	)
	(if (< ?imc 18.5) then
		(bind ?problema (find-instance ((?p Problema+peso)) (eq ?p:nombre "Extremadamente delgado")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Extremadamente delgado]" crlf)
	)
	
	;;;;;;;PROBLEMAS DE EDAD;;;;;;
	(if (> ?edad 65) then 
		(bind ?problema (find-instance ((?p Problema+edad)) (eq ?p:nombre "Edad avanzada")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Edad avanzada]" crlf)
	)
	(if (< ?edad 10) then
		(bind ?problema (find-instance ((?p Problema+edad)) (eq ?p:nombre "Edad temprana")))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Edad temprana]" crlf)
	)
	
	;;;;;;;PROBLEMAS DE PRESION;;;;;;
	(if (or (> ?presion_max 130) (> ?presion_min 90)) then
		(bind ?problema (find-instance ((?p Problema+presion)) TRUE))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Presion alterada]" crlf)
	)
	(if (or (< ?presion_max 90) (< ?presion_min 60)) then
		(bind ?problema (find-instance ((?p Problema+presion)) TRUE))
		(bind ?lista_problemas_inferidos (insert$ ?problema 1 ?lista_problemas_inferidos))
		(printout t "[PROBLEMA INFERIDO: Presion alterada]" crlf)
	)

	;Añadimos los problemas inferidos a la lista de problemas introducidos por la persona
	(bind ?lista_final (insert$ $?problemas 1 ?lista_problemas_inferidos))
	(modify ?persona (problemas ?lista_final))

	(retract ?ip)
)

(defrule calcula_int_inicial "Regla para calcular la intensidad inicial de la persona"
	(declare (salience 155))
	?persona <- (Persona (edad ?edad) (habitos $?lista_habitos) (IMC ?IMC) (intensidad_inicial Nula))
	(Dieta (consumo_de_fruta ?fruta) (consumo_de_verdura ?verdura) (abuso_de_sal ?sal) (comida_basura ?basura) (picar_entre_horas ?picar))
	(Ejercicio_sencillo (ppm ?ppm) (cansancio ?cansancio) (mareo ?mareo) (tirantez_muscular ?tirantez))
	(cardiorresp ?count)
	=>

	; Para cada elemento sumamos o restamos intensidad inicial a la persona

	;IMC
	(bind ?int_ini (calcular_int_ini_imc ?IMC))
	
	;DIETA
	(bind ?int_ini (+ ?int_ini (calcular_int_ini_dieta ?fruta ?verdura ?sal ?basura ?picar)))
	
	;EJERCICIOS SENCILLOS
	(bind ?int_ini (+ ?int_ini (calcular_int_ini_ejercicios ?edad ?ppm ?cansancio ?mareo ?tirantez)))
	
	;HABITOS PERSONALES
	(progn$ (?habito ?lista_habitos)
		(bind ?puntuacion (send ?habito get-puntuacion))
		(bind ?frec (send ?habito get-frecuencia))
		(bind ?int_ini (+ ?int_ini (* ?puntuacion ?frec)))
	)

	;PROBLEMAS CARDIORRESPIRATORIOS
	(bind ?int_ini (- ?int_ini (* ?count 2)))
	
	; Según el número obtenido, clasificamos la intensidad de la persona en tres categorías:

	;		   -30            0            30
	;-----------|-------------|-------------|---------------
	;	Baja				Media				   Alta

	(if (<= ?int_ini -30) then (bind ?int_ini_cat Baja)
	else (if (< ?int_ini 30) then (bind ?int_ini_cat Media)
	else (bind ?int_ini_cat Alta)))

	(printout t "[INTENSIDAD INICIAL CALCULADA: " ?int_ini_cat "]" crlf)
	
	(modify ?persona (intensidad_inicial ?int_ini_cat))
	(assert (no_hay_obj_cumpl))
)

(defrule limita_tiempo_segun_intensidad
	"Regla para limitar el tiempo que el usuario puede hacer deporte cada día, según su intensidad y número de objetivos"
	
	(declare (salience 150))
	(Persona (objetivos $?objetivos&:(> (length$ $?objetivos) -1)) (intensidad_inicial ?int_ini))
	=>
	(bind ?n_obj (length$ $?objetivos))
	(bind ?rutinas (find-all-instances ((?r Rutina+diaria)) TRUE))
	(progn$ (?rutina ?rutinas)
		(bind ?tx (div (send ?rutina get-tiempo_disp) 60))
		(bind ?dia (send ?rutina get-dia))
		(if (eq ?int_ini Baja) then
			(if (< ?n_obj 3) then
				(if (> ?tx 40) then 
					(send ?rutina put-tiempo_disp (* 40 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 40 minutos]" crlf)
				)
			else
				(if (> ?tx 60) then 
					(send ?rutina put-tiempo_disp (* 60 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 60 minutos]" crlf)
				)
			)
		)
		(if (eq ?int_ini Media) then
			(if (< ?n_obj 3) then
				(if (> ?tx 60) then 
					(send ?rutina put-tiempo_disp (* 60 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 60 minutos]" crlf)
				)
			else
				(if (> ?tx 90) then 
					(send ?rutina put-tiempo_disp (* 90 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 90 minutos]" crlf)
				)
			)
		)
		(if (eq ?int_ini Alta) then
			(if (< ?n_obj 3) then
				(if (> ?tx 90) then 
					(send ?rutina put-tiempo_disp (* 90 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 90 minutos]" crlf)
				)
			else
				(if (> ?tx 120) then 
					(send ?rutina put-tiempo_disp (* 120 60))
					(printout t "[TIEMPO DISPONIBLE DIA " ?dia " LIMITADO: 120 minutos]" crlf)
				)
			)
		)
	)
)

(defrule objetivos_cumplidos_habitos 
	"Regla para calcular qué objetivos son cumplidos por los hábitos personales del usuario y en qué medida"

	(declare (salience 145))
	?nhoc <- (no_hay_obj_cumpl)
	(Persona (habitos $?lista_habitos))
	=>

	; Si el hábito es favorable para un objetivo, generamos una pareja objetivo-hábito con su puntuación
	(progn$ (?habito ?lista_habitos)
		(bind ?lista_objetivos (send ?habito get-favorable))
		(bind ?duracion (send ?habito get-duracion))
		(bind ?frec (send ?habito get-frecuencia))
		(bind ?puntuacion (send ?habito get-puntuacion))
		(progn$ (?objetivo ?lista_objetivos)
			(assert (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion (* ?puntuacion ?duracion ?frec))))
		)
	)
	(retract ?nhoc)
	(assert (no_hay_obj_eje))
)

(defrule combina_objetivos "Regla para combinar aquellas parejas habito - objetivo que tengan el mismo objetivo"
	(declare (salience 140))
	?o1 <- (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?punt1))
	?o2 <- (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?o1) (fact-index ?o2))) ;Comprobamos que no sean el mismo
	=>
	; Creamos un nuevo hecho sumando ambas puntuaciones, y eliminamos los dos originales
	(assert (objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion (+ ?punt1 ?punt2))))
	(retract ?o1)
	(retract ?o2)
)

(defrule crea_ejercicios
	"Regla para generar todas las parejas ejercicio-objetivo tal que el ejercicio cumple
	el objetivo y dicho objetivo es uno de los escogidos por la persona"

	(declare (salience 135))
	?nhoe <- (no_hay_obj_eje)
	(Persona (objetivos $?objetivos_persona) (intensidad_inicial ?int_ini) (problemas $?problemas_persona))
	=>

	;Iteramos por la lista de objetivos de la persona
	(progn$ (?obj_pers $?objetivos_persona)
		(bind ?lista_ejercicios (find-all-instances ((?ej Ejercicio)) (and (eq ?int_ini ?ej:intensidad) (member ?obj_pers ?ej:objetivos))))
		(bind ?problematico FALSE)

		;Y generamos una pareja con cada ejercicio que lo cumple
		(loop-for-count (?i 1 (length$ ?lista_ejercicios)) do
			(bind ?ejercicio (nth$ ?i ?lista_ejercicios))

			; Cogemos solo aquellos ejercicios que no son contraindicados para ningún problema de la persona
			(bind ?problemas_ej (send ?ejercicio get-contraindicado))
			(progn$ (?problema_ej ?problemas_ej)
 				(if (member ?problema_ej $?problemas_persona) then 
                    (bind ?problematico TRUE)
                    (bind ?nombre (send ?ejercicio get-nombre))
                    (bind ?nombre2 (send ?problema_ej get-nombre))
                    (printout t "[EJERCICIO " ?nombre " DESCARTADO POR PROBLEMA " ?nombre2 "]" crlf)
                )
 			)
			(if (eq ?problematico FALSE) then
				(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
				(bind ?rep_min (send ?ejercicio get-repeticiones+min))
				(bind ?duracion_min (* ?dur_rep ?rep_min))
				(assert (ejercicio_objetivo (ejercicio ?ejercicio) (objetivo ?obj_pers) (duracion ?duracion_min) (rebajado FALSE)))
            )
		)
	)
	(assert (lista_objetivos1 (nombre 1) (objetivos (create$))))
	(assert (lista_objetivos2 (nombre 2) (objetivos (create$))))
	(retract ?nhoe)
)

(defrule quita_ejercicios_ya_cumplidos_con_habitos 
	"Regla para descartar objetivos o a rebajar la intensidad de ejercicios que ya se cumplen con hábitos"

	(declare (salience 130))
	(objetivo_cumplido_habito (objetivo ?objetivo) (puntuacion ?puntuacion_habito))
	?ej_obj <- (ejercicio_objetivo (objetivo ?objetivo) (ejercicio ?ejercicio) (rebajado FALSE))
	=>

	; Si la puntuacion de los hábitos que cumplen el objetivo es muy alta, eliminamos la lista
	(if (> ?puntuacion_habito 2000) then
		(bind ?nombre (send ?objetivo get-nombre))
		(printout t "[OBJETIVO DESCARTADO POR HABITOS: " ?nombre "]" crlf)
		(retract ?ej_obj)

	; Si la puntuacion de los hábitos que cumplen el objetivo es alta, bajamos la intensidad de los ejercicios que cumplen dicho objetivo
	else (if (> ?puntuacion_habito 1500) then
		(bind ?nombre (send ?ejercicio get-nombre))
		(bind ?intensidad (send ?ejercicio get-intensidad))
		(if (eq ?intensidad Alta) then
			(bind ?ej2 (nth$ 1 (find-instance ((?ej Ejercicio)) (and (eq ?ej:nombre ?nombre) (eq ?ej:intensidad Media)))))
			(modify ?ej_obj (ejercicio ?ej2) (rebajado TRUE))
			(printout t "[EJERCICIO " ?nombre " REBAJADO A INTENSIDAD " Media "]" crlf)
		else (if (eq ?intensidad Media) then
				(bind ?ej2 (nth$ 1 (find-instance ((?ej Ejercicio)) (and (eq ?ej:nombre ?nombre) (eq ?ej:intensidad Baja)))))
				(modify ?ej_obj (ejercicio ?ej2) (rebajado TRUE))
				(printout t "[EJERCICIO " ?nombre " REBAJADO A INTENSIDAD " Baja "]" crlf)
			)
		)
	))
)

(defrule lista_objetivos "Regla para listar todos los objetivos que se deben cumplir"
	(declare (salience 125))
	(ejercicio_objetivo (objetivo ?objetivo))
	?lista_obj1 <- (lista_objetivos1 (objetivos $?objetivos))
	=>
	(if (not (member ?objetivo $?objetivos)) then
		(bind ?aux (insert$ ?objetivos 1 ?objetivo))
		(modify ?lista_obj1 (objetivos ?aux))
	)
)

(defrule si_hay_pocos_objetivos "Regla para generar ejercicios y objetivos si la persona tiene pocos objetivos"
	(declare (salience 120))
	?lista_obj1 <- (lista_objetivos1 (objetivos $?objetivos))
	(test(< (length$ $?objetivos) 3))
	(Persona (intensidad_inicial ?int_ini))
	=>
	(printout t "[OBJETIVOS ANADIDOS]" crlf)
	(bind $?s_objetivos (create$ "Equilibrio" "Flexibilidad" "Aliviar dolor espalda" "Aliviar dolor extremidades inferiores" "Aliviar dolor extremidades superiores" "Aliviar dolor cervicales"))
	(bind $?aux $?objetivos)
	(progn$ (?s_objetivo $?s_objetivos)
		(bind ?objetivo (nth$ 1 (find-instance ((?obj Objetivo)) (= (str-compare ?obj:nombre ?s_objetivo) 0))))
		(bind ?ejercicios (find-all-instances ((?ej Ejercicio)) (and (member ?objetivo ?ej:objetivos) (eq ?int_ini ?ej:intensidad))))
		(progn$ (?ejercicio ?ejercicios)
			(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
			(bind ?rep_min (send ?ejercicio get-repeticiones+min))
			(bind ?duracion_min (* ?dur_rep ?rep_min))
			(assert (ejercicio_objetivo (ejercicio ?ejercicio) (objetivo ?objetivo) (duracion ?duracion_min)))

			(if (not (member ?objetivo $?aux)) then
				(bind $?aux (insert$ $?aux 1 ?objetivo))
			)
		)
	)
	(modify ?lista_obj1 (objetivos $?aux))	
)

(defrule pasa-a-resolucion "Regla para pasar al módulo de resolucion"
	(declare (salience 117))
	=>
	(focus resolucion)
	(printout t crlf "Pulsa enter para generar tu programa recomendado ")
	(readline)
)

(defmodule resolucion "Modulo de resolución, donde se crean las rutinas y se les asignan los ejercicios"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (import inferencia ?ALL)
  (export ?ALL)
)

(defrule copia_l1_a_l2 "Regla auxiliar para copiar los objetivos pendientes de una lista a otra cuando la segunda se queda vacía"
	(declare (salience 115))
	?l1 <- (lista_objetivos1 (objetivos $?objetivos1))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos2))
	(test(eq (length$ $?objetivos2) 0))
	=>
	(modify ?l2 (objetivos $?objetivos1))
)

(defrule crea_rutinas_vacias "Regla para crear un hecho para cada día, que contendrá los ejercicios de cada uno"
	(declare (salience 110))
	=>
	(assert (ejercicios_rutina (dia 1) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 2) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 3) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 4) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 5) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 6) (ejercicios (create$))))
	(assert (ejercicios_rutina (dia 7) (ejercicios (create$))))
)

(defrule dia1 "Regla para asignar ejercicios al primer día del programa"
	(declare (salience 105))
	?ej_rutina <- (ejercicios_rutina (dia 1) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 1) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina))) 
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 1) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia2 "Regla para asignar ejercicios al segundo día del programa"
	(declare (salience 100))
	(ejercicios_rutina (dia 1) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 2) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 2) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 2) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia2b "Regla auxiliar para asignar ejercicios al segundo día del programa"
	(declare (salience 95))
	?ej_rutina <- (ejercicios_rutina (dia 2) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 2) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 2) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia3 "Regla para asignar ejercicios al tercer día del programa"
	(declare (salience 90))
	(ejercicios_rutina (dia 2) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 3) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 3) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 3) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia3b "Regla auxiliar para asignar ejercicios al tercer día del programa"
	(declare (salience 85))
	?ej_rutina <- (ejercicios_rutina (dia 3) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 3) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 3) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia4 "Regla para asignar ejercicios al cuarto día del programa"
	(declare (salience 80))
	(ejercicios_rutina (dia 3) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 4) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 4) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 4) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia4b "Regla auxiliar para asignar ejercicios al cuarto día del programa"
	(declare (salience 75))
	?ej_rutina <- (ejercicios_rutina (dia 4) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 4) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 4) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia5 "Regla para asignar ejercicios al quinto día del programa"
	(declare (salience 70))
	(ejercicios_rutina (dia 4) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 5) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 5) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 5) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia5b "Regla auxiliar para asignar ejercicios al quinto día del programa"
	(declare (salience 65))
	?ej_rutina <- (ejercicios_rutina (dia 5) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 5) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 5) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia6 "Regla para asignar ejercicios al sexto día del programa"
	(declare (salience 60))
	(ejercicios_rutina (dia 5) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 6) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 6) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 6) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia6b "Regla auxiliar para asignar ejercicios al sexto día del programa"
	(declare (salience 55))
	?ej_rutina <- (ejercicios_rutina (dia 6) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 6) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 6) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia7 "Regla para asignar ejercicios al séptimo día del programa"
	(declare (salience 50))
	(ejercicios_rutina (dia 6) (ejercicios $?ejercicios_rutina_anterior))
	?ej_rutina <- (ejercicios_rutina (dia 7) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 7) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(and (not (member ?ejercicio ?ejercicios_rutina)) (not (member ?ejercicio ?ejercicios_rutina_anterior))))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 7) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule dia7b "Regla auxiliar para asignar ejercicios al séptimo día del programa"
	(declare (salience 45))
	?ej_rutina <- (ejercicios_rutina (dia 7) (ejercicios $?ejercicios_rutina))
	?rutina <- (object (is-a Rutina+diaria) (dia 7) (tiempo_disp ?tiempo_disp) (ejercicios $?ejercicios_rec) (objetivos $?objetivos_rutina) (duracion+total ?duracion_total))
	?l2 <- (lista_objetivos2 (objetivos $?objetivos_pendientes))
	(test(neq (length$ $?objetivos_pendientes) 0))
	(ejercicio_objetivo (ejercicio ?ejercicio&:(not (member ?ejercicio ?ejercicios_rutina)))
						(duracion ?duracion_min&:(< ?duracion_min ?tiempo_disp))
						(objetivo ?objetivo&:(member ?objetivo $?objetivos_pendientes))
	)
	=>

	; Crear un ejercicio recomendado y añadirlo a la lista de ejercicios de la rutina
	(bind ?dur_rep (send ?ejercicio get-duracion_por_rep))
	(bind ?rep_max (send ?ejercicio get-repeticiones+max))
	(bind ?duracion (* ?dur_rep ?rep_max))

	(bind ?duracion_real (min ?duracion ?tiempo_disp))
	(bind ?rep_reales (div ?duracion_real ?dur_rep))

	(bind ?ej_rec (make-instance (gensym*) of Ejercicio+recomendado))
	(send ?ej_rec put-ejercicio ?ejercicio)
	(send ?ej_rec put-duracion ?duracion_real)
	(send ?ej_rec put-repeticiones ?rep_reales)
	(send ?rutina put-ejercicios (insert$ ?ejercicios_rec 1 ?ej_rec))

	; Añadir el ejercicio asignado a la lista de ejercicios que se hacen en la rutina (en el template)
	(modify ?ej_rutina (dia 7) (ejercicios (insert$ ?ejercicios_rutina 1 ?ejercicio)))

	; Sumar el tiempo del ejercicio asignado a la duracion total de la rutina
	(send ?rutina put-duracion+total (+ ?duracion_total ?duracion_real))	

	; Restar el tiempo del ejercicio asignado al tiempo disponible de la rutina
	(send ?rutina put-tiempo_disp (- ?tiempo_disp ?duracion_real))

	; Para cada objetivo que cumple el ejercicio asignado
	(bind $?objetivos_ejercicio (send ?ejercicio get-objetivos))
	(bind ?aux ?objetivos_rutina)
	(bind ?aux2 ?objetivos_pendientes)
	(progn$ (?obj $?objetivos_ejercicio)

		; Añadirlo a la lista de objetivos cumplidos en la rutina
		(if (not (member ?obj $?aux)) then
			(bind ?aux (insert$ $?aux 1 ?obj))
		)

		; Si está en la lista de objetivos pendientes, eliminarlo de la lista
		(if (member ?obj $?aux2) then
			(bind ?aux2 (delete-member$ $?aux2 ?obj))
		)
	)
	(send ?rutina put-objetivos $?aux)
	(modify ?l2 (objetivos ?aux2))
)

(defrule pasa-a-solucion "Regla para pasar al módulo de solución"
	(declare (salience 40))
	=>
	(focus solucion)
)

(defmodule solucion "Modulo de solución, donde se crea y se imprime el programa recomendado"
  (import MAIN ?ALL)
  (import preguntas ?ALL)
  (import inferencia ?ALL)
  (import resolucion ?ALL)
  (export ?ALL)
)

(defrule crea_programa "Regla para crear el programa a partir de las rutinas construidas"
	(declare (salience 35))
	=>
	(bind ?rutinas (find-all-instances ((?ej Rutina+diaria)) TRUE))
	(bind ?programa (make-instance (gensym*) of Programa))
	(send ?programa put-rutinas+diarias ?rutinas)
)

(defrule print_programa "Regla para imprimir el programa construido"
	(object (is-a Programa) (rutinas+diarias $?rutinas))
	(Persona (nombre ?nombre))
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
			(bind ?nombre (send ?ejercicio get-nombre))
			(bind ?intensidad (send ?ejercicio get-intensidad))
			(printout t ?nombre " de intensidad " ?intensidad crlf)
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
		(printout t crlf "Objetivos cumplidos: " crlf)
		(progn$ (?objetivo $?objetivos_rutina)
			(printout t " - " (send ?objetivo get-nombre) crlf)
		)

		;Los añadimos a la lista total de objetivos cumplidos en el programa
		(progn$  (?objetivo ?objetivos_rutina)
			(if (not (member ?objetivo ?obj_programa)) then
				(bind ?obj_programa (insert$ ?obj_programa 1 ?objetivo))
			)
		)
		(bind ?dia (+ ?dia 1))
	)

	;Objetivos que cumple el programa en global
	(printout t crlf crlf "Objetivos cumplidos en el programa: " crlf)
	(progn$ (?objetivo $?obj_programa)
		(printout t " - " (send ?objetivo get-nombre) crlf)
	)
	(printout t crlf)
)