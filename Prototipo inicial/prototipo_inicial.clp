; Sun May 03 12:14:19 CEST 2020
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot contraindicado
;+		(comment "Lista de condicionantes para los cualos este ejercicio es contraindicado.")
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(multislot objetivos
;+		(comment "Objetivos que cumple esta actividad.")
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot desfavorable
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(create-accessor read-write))
	(single-slot calorias+por+min
;+		(comment "Calorias que se queman por minuto con este ejercicio")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos)
		(create-accessor read-write))
	(single-slot duracion_por_rep
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion
;+		(comment "Duracion de la actividad, en minutos")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot repeticiones+min
;+		(comment "Minimo de repeticiones de ejercicio")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
		(range -3 3)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot indicado
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot ejercicio
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot frecuencia
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot favorable
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(create-accessor read-write))
	(single-slot tipo+de+ejercicio
		(type SYMBOL)
		(allowed-values cardio con_pesas con_aparatos suelo estiramiento)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot rutinas+diarias
		(type INSTANCE)
;+		(allowed-classes Rutina+diaria)
		(cardinality 1 7)
		(create-accessor read-write))
	(single-slot repeticiones+max
;+		(comment "Maximo de repeticiones de ejercicio")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot ejercicios
		(type INSTANCE)
;+		(allowed-classes Ejercicio+recomendado)
		(create-accessor read-write))
	(single-slot repeticiones
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion+total
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot intensidad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dia
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values moderada normal dificil)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Programa
	(is-a USER)
	(role concrete)
	(multislot rutinas+diarias
		(type INSTANCE)
;+		(allowed-classes Rutina+diaria)
		(cardinality 1 7)
		(create-accessor read-write)))

(defclass Rutina+diaria
	(is-a USER)
	(role concrete)
	(multislot ejercicios
		(type INSTANCE)
;+		(allowed-classes Ejercicio+recomendado)
		(create-accessor read-write))
	(multislot objetivos
;+		(comment "Objetivos que cumple esta actividad.")
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot duracion+total
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot dia
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Ejercicio+recomendado
	(is-a USER)
	(role concrete)
	(single-slot repeticiones
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot duracion
;+		(comment "Duracion de la actividad, en minutos")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ejercicio
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dificultad
		(type SYMBOL)
		(allowed-values moderada normal dificil)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Ejercicio "Ejercicio que realiza una persona"
	(is-a USER)
	(role concrete)
	(single-slot duracion_por_rep
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipo+de+ejercicio
		(type SYMBOL)
		(allowed-values cardio con_pesas con_aparatos suelo estiramiento)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot contraindicado
;+		(comment "Lista de condicionantes para los cualos este ejercicio es contraindicado.")
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot repeticiones+min
;+		(comment "Minimo de repeticiones de ejercicio")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
		(range -3 3)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot indicado
		(type INSTANCE)
;+		(allowed-classes Problemas)
		(create-accessor read-write))
	(single-slot repeticiones+max
;+		(comment "Maximo de repeticiones de ejercicio")
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot objetivos
;+		(comment "Objetivos que cumple esta actividad.")
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot intensidad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot calorias+por+min
;+		(comment "Calorias que se queman por minuto con este ejercicio")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos)
		(create-accessor read-write)))

(defclass Condicionante "Condicionantes que tiene la persona, que afectan a su capacidad para realizarcierto tipo de ejercicios."
	(is-a USER)
	(role concrete))

(defclass Habito+personal "Habito que tiene la persona"
	(is-a Condicionante)
	(role concrete)
	(multislot favorable
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(create-accessor read-write))
	(multislot desfavorable
		(type INSTANCE)
;+		(allowed-classes Objetivo)
		(create-accessor read-write))
	(single-slot duracion
;+		(comment "Duracion de la actividad, en minutos")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos)
		(create-accessor read-write))
	(single-slot puntuacion
		(type INTEGER)
		(range -3 3)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot frecuencia
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Objetivo "Objetivo que puede tener un usuario."
	(is-a Condicionante)
	(role concrete)
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Problemas
	(is-a Condicionante)
	(role concrete)
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Problemas+musculo-esqueleticos "Problema musculo-esqueletico que tiene el usuario."
	(is-a Problemas)
	(role concrete)
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos)
		(create-accessor read-write)))

(defclass Problemas+cardiorespiratorios "Problema cardio-respiratorio que tiene el usuario."
	(is-a Problemas)
	(role concrete))

(defclass Problema+peso "Problema relacionado con el IMC del usuario."
	(is-a Problemas)
	(role concrete))

(defclass Problema+edad
	(is-a Problemas)
	(role concrete))

(defclass Problema+presion
	(is-a Problemas)
	(role concrete))

(definstances instancias
; Sun May 03 12:14:19 CEST 2020
; 
;+ (version "3.5")
;+ (build "Build 663")

([30-4-20_Class18] of  Habito+personal

	(favorable [30-4-20_Class24])
	(grupo_muscular Brazos)
	(nombre "Planchar")
	(puntuacion 1))

([30-4-20_Class19] of  Habito+personal

	(desfavorable [30-4-20_Class26])
	(favorable
		[30-4-20_Class24]
		[30-4-20_Class23])
	(grupo_muscular Brazos)
	(nombre "Levantar cajas")
	(puntuacion 2))

([30-4-20_Class20] of  Habito+personal

	(favorable [30-4-20_Class25])
	(grupo_muscular Piernas)
	(nombre "Compras")
	(puntuacion 1))

([30-4-20_Class21] of  Habito+personal

	(favorable
		[30-4-20_Class23]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class28])
	(grupo_muscular Espalda Brazos Abdominales)
	(nombre "Natacion")
	(puntuacion 3))

([30-4-20_Class22] of  Habito+personal

	(favorable
		[30-4-20_Class27]
		[30-4-20_Class25])
	(grupo_muscular Gluteos Piernas)
	(nombre "Pasear la mascota")
	(puntuacion 2))

([30-4-20_Class23] of  Objetivo

	(nombre "Adelgazar"))

([30-4-20_Class24] of  Objetivo

	(nombre "Tonificar brazo"))

([30-4-20_Class25] of  Objetivo

	(nombre "Tonificar piernas"))

([30-4-20_Class26] of  Objetivo

	(nombre "Tonificar espalda"))

([30-4-20_Class27] of  Objetivo

	(nombre "Tonificar gluteos"))

([30-4-20_Class28] of  Objetivo

	(nombre "Tonificar abdomen"))

([30-4-20_Class30] of  Problemas+musculo-esqueleticos

	(grupo_muscular Brazos)
	(nombre "Dolor en el brazo"))

([30-4-20_Class31] of  Problemas+musculo-esqueleticos

	(grupo_muscular Piernas)
	(nombre "Rodilla operada"))

([30-4-20_Class32] of  Problemas+cardiorespiratorios

	(nombre "Asma"))

([30-4-20_Class33] of  Problemas+cardiorespiratorios

	(nombre "Coronavirus"))

([30-4-20_Class34] of  Problema+peso

	(nombre "Extremadamente obeso"))

([30-4-20_Class36] of  Problema+peso

	(nombre "Extremadamente delgado"))

([30-4-20_Class37] of  Problema+edad

	(nombre "Edad avanzada"))

([30-4-20_Class38] of  Problema+edad

	(nombre "Edad temprana"))

([30-4-20_Class41] of  Ejercicio

	(contraindicado [30-4-20_Class30])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Baja)
	(nombre "Levantar pesas de intensidad baja")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([30-4-20_Class42] of  Ejercicio

	(contraindicado [30-4-20_Class31])
	(duracion_por_rep 4)
	(grupo_muscular Gluteos)
	(intensidad Baja)
	(nombre "Sentadillas de intensidad baja")
	(objetivos [30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([30-4-20_Class43] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38])
	(duracion_por_rep 10)
	(grupo_muscular Espalda)
	(intensidad Baja)
	(nombre "Hiperextensiones de intensidad baja")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 10)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([30-4-20_Class44] of  Ejercicio

	(duracion_por_rep 30)
	(grupo_muscular Piernas)
	(intensidad Baja)
	(nombre "Estirar quadriceps de intensidad baja")
	(objetivos
		[30-4-20_Class45]
		[30-4-20_Class46])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([30-4-20_Class45] of  Objetivo

	(nombre "Mejorar flexibilidad"))

([30-4-20_Class46] of  Objetivo

	(nombre "Aliviar el dolor"))

([CP_Class0] of  Problemas+musculo-esqueleticos

	(grupo_muscular Espalda)
	(nombre "Columna vertebral torcida"))

([CP_Class1] of  Problema+presion

	(nombre "Presion alterada"))

([CP_Class10] of  Ejercicio

	(contraindicado [CP_Class1])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Alta)
	(nombre "Bicicleta estatica de intensidad alta")
	(objetivos [30-4-20_Class25])
	(repeticiones+max 12)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))

([CP_Class10003] of  Habito+personal

	(duracion 0)
	(nombre "Mirar la television")
	(puntuacion -1))

([CP_Class10004] of  Habito+personal

	(duracion 0)
	(nombre "Fumar")
	(puntuacion -3))

([CP_Class10005] of  Habito+personal

	(duracion 0)
	(nombre "Beber cerveza")
	(puntuacion -1))

([CP_Class15] of  Ejercicio

	(duracion_por_rep 60)
	(grupo_muscular Piernas)
	(intensidad Media)
	(nombre "Estirar quadriceps de intensidad media")
	(objetivos
		[30-4-20_Class45]
		[30-4-20_Class46])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([CP_Class16] of  Ejercicio

	(duracion_por_rep 120)
	(grupo_muscular Piernas)
	(intensidad Alta)
	(nombre "Estirar quadriceps de intensidad alta")
	(objetivos
		[30-4-20_Class45]
		[30-4-20_Class46])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([CP_Class17] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38])
	(duracion_por_rep 5)
	(grupo_muscular Espalda)
	(intensidad Media)
	(nombre "Hiperextensiones de intensidad media")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 20)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([CP_Class18] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38])
	(duracion_por_rep 3)
	(grupo_muscular Espalda)
	(intensidad Alta)
	(nombre "Hiperextensiones de intensidad alta")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 30)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([CP_Class19] of  Ejercicio

	(contraindicado [30-4-20_Class30])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Media)
	(nombre "Levantar pesas de intensidad media")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 50)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class20] of  Ejercicio

	(contraindicado [30-4-20_Class30])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Alta)
	(nombre "Levantar pesas de intensidad alta")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 100)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class21] of  Ejercicio

	(contraindicado [30-4-20_Class31])
	(duracion_por_rep 3)
	(grupo_muscular Gluteos)
	(intensidad Media)
	(nombre "Sentadillas de intensidad media")
	(objetivos [30-4-20_Class27])
	(repeticiones+max 25)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class22] of  Ejercicio

	(contraindicado [30-4-20_Class31])
	(duracion_por_rep 3)
	(grupo_muscular Gluteos)
	(intensidad Alta)
	(nombre "Sentadillas de intensidad alta")
	(objetivos [30-4-20_Class27])
	(repeticiones+max 40)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class3] of  Ejercicio

	(contraindicado [30-4-20_Class34])
	(duracion_por_rep 3)
	(grupo_muscular Abdominales)
	(intensidad Baja)
	(nombre "Abdominales de intensidad baja")
	(objetivos [30-4-20_Class28])
	(repeticiones+max 30)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class4] of  Ejercicio

	(contraindicado [30-4-20_Class34])
	(duracion_por_rep 3)
	(grupo_muscular Abdominales)
	(intensidad Media)
	(nombre "Abdominales de intensidad media")
	(objetivos [30-4-20_Class28])
	(repeticiones+max 75)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class5] of  Ejercicio

	(contraindicado [30-4-20_Class34])
	(duracion_por_rep 2)
	(grupo_muscular Abdominales)
	(intensidad Alta)
	(nombre "Abdominales de intensidad alta")
	(objetivos [30-4-20_Class28])
	(repeticiones+max 150)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class6] of  Ejercicio

	(contraindicado [CP_Class1])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Baja)
	(nombre "Bicicleta estatica de intensidad baja")
	(objetivos [30-4-20_Class25])
	(repeticiones+max 3)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))

([CP_Class9] of  Ejercicio

	(contraindicado [CP_Class1])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Media)
	(nombre "Bicicleta estatica de intensidad media")
	(objetivos [30-4-20_Class25])
	(repeticiones+max 6)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))
)

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
		(allowed-values Si No))
	(slot tirantez_muscular (type SYMBOL)
		(allowed-values Si No))
)

(deftemplate Dieta "Dieta del usuario"
	(slot consumo_de_fruta (type SYMBOL)
		(allowed-values Si No))
	(slot abuso_de_sal (type SYMBOL)
		(allowed-values Si No))
	(slot picar_entre_horas (type SYMBOL)
		(allowed-values Si No))
	(slot comida_basura (type SYMBOL)
		(allowed-values Si No))
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

(deffunction calcular_intensidad_inicial_imc(?imc)
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
	(bind ?edad (pregunta-numerica "Edad (anos): " 0 120))
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

	; FALTA AÑADIR PROBLEMAS INFERIDOS A PARTIR DE LOS EJERCICIOS SENCILLOS Y DE LA DIETA

	(bind ?lista_final (insert$ $?problemas 1 ?lista_problemas_inferidos))
	(modify ?persona (problemas ?lista_final))
	(retract ?ip)
)

(defrule calcula_int_inicial
	(declare (salience 18))
	?persona <- (Persona (habitos $?lista_habitos) (IMC ?IMC) (intensidad_inicial Nula))
	=>
	;IMC
	(bind ?int_ini (calcular_intensidad_inicial_imc ?IMC))

	;DIETA
	;(bind ?int_ini (+ ?int_ini (calcular_int_dieta ?persona:dieta)))

	;EJERCICIOS SENCILLOS
	;(bind ?int_ini (+ ?int_ini (calcular_int_ejercicios ?persona:ejercicios)))

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

(deftemplate objetivo_cumplido_habito (slot objetivo (type INSTANCE)))

(defrule objetivos_cumplidos_habitos
	(declare (salience 17))
	?nhoc <- (no_hay_obj_cumpl)
	(Persona (habitos $?lista_habitos))
	=>
	(progn$ (?habito ?lista_habitos)
		(bind ?lista_objetivos (send ?habito get-favorable))
		(progn$ (?objetivo ?lista_objetivos)
			(assert (objetivo_cumplido_habito (objetivo ?objetivo)))
		)
	)
	(retract ?nhoc)
	(assert (no_hay_obj_eje))
)

(defrule combina_objetivos
	(declare (salience 16))
	?o1 <- (objetivo_cumplido_habito (objetivo ?objetivo))
	?o2 <- (objetivo_cumplido_habito (objetivo ?objetivo))
	(test (neq (fact-index ?o1) (fact-index ?o2)))
	=>
	(assert (objetivo_cumplido_habito (objetivo ?objetivo)))
	(retract ?o1)
	(retract ?o2)
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

(defrule combina_ejercicios
	(declare (salience 14))
	?e1 <- (ejercicio_puntuado (ejercicio ?ejercicio))
	?e2 <- (ejercicio_puntuado (ejercicio ?ejercicio))
	(test (neq (fact-index ?e1) (fact-index ?e2)))
	=>
	(retract ?e1)
)

(defrule combina_ejercicios_max
	(declare (salience 14))
	?e1 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt1))
	?e2 <- (ejercicio_puntuado (objetivo ?objetivo) (puntuacion ?punt2))
	(test (neq (fact-index ?e1) (fact-index ?e2)))
	=>
	(assert (ejercicio_puntuado (objetivo ?objetivo) (puntuacion (max ?punt1 ?punt2))))
	(retract ?e1)
	(retract ?e2)
)

(defrule quita_ejercicios_ya_cumplidos_con_habitos
	(declare (salience 13))
	?obj <- (objetivo_cumplido_habito (objetivo ?objetivo))
	?ej <- (ejercicio_puntuado (objetivo ?objetivo))
	=>
	(retract ?ej)
)

(defrule asigna_tiempo
	(declare (salience 12))
	?persona <- (Persona (tiempo_dispo ?tiempo_disp))
	?ej_punt <- (ejercicio_puntuado (ejercicio ?ej))
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
	?persona <- (Persona (nombre ?nombre))
	=>
	(printout t crlf crlf "PROGRAMA RECOMENDADO para " ?nombre ":")
	(bind ?dia 1)
	(bind ?obj_programa (create$))
	(progn$ (?rutina $?rutinas)
		(printout t crlf crlf)
		(send ?rutina put-dia ?dia)
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
	(printout t crlf crlf)
	(printout t "Objetivos cumplidos en el programa: " crlf)
	(progn$ (?objetivo $?obj_programa)
		(printout t " - " (send ?objetivo get-nombre) crlf)
	)
	(printout t crlf)
)