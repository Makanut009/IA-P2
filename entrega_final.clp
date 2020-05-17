; Sun May 17 10:08:47 CEST 2020
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot tiempo_disp
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot contraindicado
;+		(comment "Lista de condicionantes para los cualos este ejercicio es contraindicado.")
		(type INSTANCE)
;+		(allowed-classes Problema)
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
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos Codo Manos Cuello Hombro Pies)
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
	(single-slot tipo_habito
		(type SYMBOL)
		(allowed-values tarea_domestica desplazamiento trabajo fuera_del_trabajo)
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
	(single-slot tiempo_disp
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
		(create-accessor read-write)))

(defclass Ejercicio "Ejercicio que realiza una persona"
	(is-a USER)
	(role concrete)
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
	(single-slot duracion_por_rep
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipo+de+ejercicio
		(type SYMBOL)
		(allowed-values cardio con_pesas con_aparatos suelo estiramiento)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot intensidad
		(type SYMBOL)
		(allowed-values Baja Media Alta)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot contraindicado
;+		(comment "Lista de condicionantes para los cualos este ejercicio es contraindicado.")
		(type INSTANCE)
;+		(allowed-classes Problema)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos Codo Manos Cuello Hombro Pies)
		(create-accessor read-write))
	(single-slot repeticiones+min
;+		(comment "Minimo de repeticiones de ejercicio")
		(type INTEGER)
;+		(cardinality 1 1)
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
	(single-slot puntuacion
		(type INTEGER)
		(range -3 3)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot frecuencia
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipo_habito
		(type SYMBOL)
		(allowed-values tarea_domestica desplazamiento trabajo fuera_del_trabajo)
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

(defclass Problema
	(is-a Condicionante)
	(role concrete)
	(single-slot nombre
;+		(comment "Nombre")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Problema+cardiorrespiratorio "Problema cardio-respiratorio que tiene el usuario."
	(is-a Problema)
	(role concrete))

(defclass Problema+musculo-esqueletico "Problema musculo-esqueletico que tiene el usuario."
	(is-a Problema)
	(role concrete)
	(multislot grupo_muscular
;+		(comment "Lista de grupos musculares que trabaja esta actividad.")
		(type SYMBOL)
		(allowed-values Espalda Piernas Gluteos Abdominales Brazos Codo Manos Cuello Hombro Pies)
		(create-accessor read-write)))

(defclass Problema+peso "Problema relacionado con el IMC del usuario."
	(is-a Problema)
	(role concrete))

(defclass Problema+edad
	(is-a Problema)
	(role concrete))

(defclass Problema+presion
	(is-a Problema)
	(role concrete))

(definstances instancies
    ; Sun May 17 10:08:47 CEST 2020
; 
;+ (version "3.5")
;+ (build "Build 663")

([30-4-20_Class18] of  Habito+personal

	(favorable [30-4-20_Class24])
	(nombre "Planchar")
	(puntuacion 1)
	(tipo_habito tarea_domestica))

([30-4-20_Class19] of  Habito+personal

	(favorable
		[30-4-20_Class24]
		[30-4-20_Class23]
		[CP_Class20018])
	(nombre "Levantar peso")
	(puntuacion 1)
	(tipo_habito trabajo))

([30-4-20_Class20] of  Habito+personal

	(favorable
		[30-4-20_Class25]
		[30-4-20_Class24])
	(nombre "Compras")
	(puntuacion 1)
	(tipo_habito fuera_del_trabajo))

([30-4-20_Class21] of  Habito+personal

	(favorable
		[30-4-20_Class23]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class28]
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(nombre "Natacion")
	(puntuacion 3)
	(tipo_habito fuera_del_trabajo))

([30-4-20_Class22] of  Habito+personal

	(favorable
		[30-4-20_Class25]
		[30-4-20_Class23]
		[CP_Class20018])
	(nombre "Pasear la mascota")
	(puntuacion 1)
	(tipo_habito desplazamiento))

([30-4-20_Class23] of  Objetivo

	(nombre "Adelgazar"))

([30-4-20_Class24] of  Objetivo

	(nombre "Tonificar brazos"))

([30-4-20_Class25] of  Objetivo

	(nombre "Tonificar piernas"))

([30-4-20_Class26] of  Objetivo

	(nombre "Tonificar espalda"))

([30-4-20_Class27] of  Objetivo

	(nombre "Tonificar gluteos"))

([30-4-20_Class28] of  Objetivo

	(nombre "Tonificar abdomen"))

([30-4-20_Class30] of  Problema+musculo-esqueletico

	(grupo_muscular Brazos)
	(nombre "Dolor o afectacion de brazos"))

([30-4-20_Class32] of  Problema+cardiorrespiratorio

	(nombre "Asma"))

([30-4-20_Class33] of  Problema+cardiorrespiratorio

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

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Baja)
	(nombre "Levantar pesas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([30-4-20_Class42] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 4)
	(grupo_muscular Gluteos)
	(intensidad Baja)
	(nombre "Sentadillas")
	(objetivos
		[30-4-20_Class27]
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([30-4-20_Class43] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[30-4-20_Class34]
		[CP_Class20032])
	(duracion_por_rep 10)
	(grupo_muscular Espalda)
	(intensidad Baja)
	(nombre "Hiperextensiones")
	(objetivos
		[30-4-20_Class26]
		[30-4-20_Class27]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 10)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([30-4-20_Class44] of  Ejercicio

	(duracion_por_rep 30)
	(grupo_muscular Piernas)
	(intensidad Baja)
	(nombre "Estirar quadriceps")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([30-4-20_Class46] of  Objetivo

	(nombre "Aliviar dolor cervicales"))

([CP_Class0] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class23]
		[CP_Class20018]
		[30-4-20_Class25])
	(nombre "Pasear")
	(puntuacion 1)
	(tipo_habito desplazamiento))

([CP_Class1] of  Problema+presion

	(nombre "Presion alterada"))

([CP_Class10] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[CP_Class20024]
		[CP_Class20026]
		[30-4-20_Class38])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Alta)
	(nombre "Bicicleta estatica")
	(objetivos
		[30-4-20_Class25]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 10)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))

([CP_Class10000] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36]
		[CP_Class20033])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Extensiones de triceps en polea con cuerda")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 12)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_aparatos))

([CP_Class10001] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class23]
		[CP_Class20018]
		[30-4-20_Class25])
	(nombre "Desplazamiento laboral")
	(puntuacion 1)
	(tipo_habito desplazamiento))

([CP_Class10002] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(nombre "Atletismo/Correr")
	(puntuacion 3)
	(tipo_habito fuera_del_trabajo))

([CP_Class10003] of  Habito+personal

	(duracion 0)
	(nombre "Mirar la television")
	(puntuacion -1)
	(tipo_habito fuera_del_trabajo))

([CP_Class10004] of  Habito+personal

	(duracion 0)
	(nombre "Fumar")
	(puntuacion -3)
	(tipo_habito fuera_del_trabajo))

([CP_Class10005] of  Habito+personal

	(duracion 0)
	(nombre "Beber cerveza")
	(puntuacion -2)
	(tipo_habito fuera_del_trabajo))

([CP_Class15] of  Ejercicio

	(duracion_por_rep 60)
	(grupo_muscular Piernas)
	(intensidad Media)
	(nombre "Estirar quadriceps")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([CP_Class16] of  Ejercicio

	(duracion_por_rep 120)
	(grupo_muscular Piernas)
	(intensidad Alta)
	(nombre "Estirar quadriceps")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio estiramiento))

([CP_Class17] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[30-4-20_Class34]
		[CP_Class20032])
	(duracion_por_rep 5)
	(grupo_muscular Espalda)
	(intensidad Media)
	(nombre "Hiperextensiones")
	(objetivos
		[30-4-20_Class26]
		[30-4-20_Class27]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 20)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([CP_Class18] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[30-4-20_Class34]
		[CP_Class20032])
	(duracion_por_rep 3)
	(grupo_muscular Espalda)
	(intensidad Alta)
	(nombre "Hiperextensiones")
	(objetivos
		[30-4-20_Class26]
		[30-4-20_Class27]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 30)
	(repeticiones+min 3)
	(tipo+de+ejercicio con_aparatos))

([CP_Class19] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Media)
	(nombre "Levantar pesas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 50)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class20] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36])
	(duracion_por_rep 5)
	(grupo_muscular Brazos)
	(intensidad Alta)
	(nombre "Levantar pesas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 100)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class20000] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20029]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Rollbacks")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio cardio))

([CP_Class20001] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36]
		[CP_Class20033])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Extensiones de triceps en polea con cuerda")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 24)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_aparatos))

([CP_Class20002] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36]
		[CP_Class20033])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Extensiones de triceps en polea con cuerda")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 36)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_aparatos))

([CP_Class20003] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20012]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(nombre "Bailar")
	(puntuacion 2)
	(tipo_habito fuera_del_trabajo))

([CP_Class20004] of  Habito+personal

	(duracion 0)
	(favorable [30-4-20_Class24])
	(nombre "Barrer")
	(puntuacion 1)
	(tipo_habito tarea_domestica))

([CP_Class20005] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class24]
		[30-4-20_Class26])
	(nombre "Colada")
	(puntuacion 1)
	(tipo_habito tarea_domestica))

([CP_Class20006] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[CP_Class20013]
		[30-4-20_Class25])
	(nombre "Entrenamiento de deporte en equipo")
	(puntuacion 3)
	(tipo_habito fuera_del_trabajo))

([CP_Class20007] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class24]
		[30-4-20_Class26])
	(nombre "Fregar")
	(puntuacion 1)
	(tipo_habito tarea_domestica))

([CP_Class20008] of  Habito+personal

	(duracion 0)
	(nombre "Leer")
	(puntuacion -1)
	(tipo_habito fuera_del_trabajo))

([CP_Class20009] of  Habito+personal

	(duracion 0)
	(favorable
		[CP_Class20018]
		[30-4-20_Class24]
		[30-4-20_Class25])
	(nombre "Movimientos repetitivos")
	(puntuacion 1)
	(tipo_habito trabajo))

([CP_Class20010] of  Habito+personal

	(duracion 0)
	(favorable
		[30-4-20_Class27]
		[30-4-20_Class25])
	(nombre "Trabajar de pie")
	(puntuacion 1)
	(tipo_habito fuera_del_trabajo))

([CP_Class20011] of  Habito+personal

	(duracion 0)
	(nombre "Trabajar sentado")
	(puntuacion -2)
	(tipo_habito fuera_del_trabajo))

([CP_Class20012] of  Objetivo

	(nombre "Flexibilidad"))

([CP_Class20013] of  Objetivo

	(nombre "Tonificar pecho"))

([CP_Class20014] of  Objetivo

	(nombre "Aliviar dolor espalda"))

([CP_Class20015] of  Objetivo

	(nombre "Aliviar dolor extremidades inferiores"))

([CP_Class20016] of  Objetivo

	(nombre "Aliviar dolor extremidades superiores"))

([CP_Class20017] of  Objetivo

	(nombre "Equilibrio"))

([CP_Class20018] of  Objetivo

	(nombre "Mantenimiento"))

([CP_Class20019] of  Objetivo

	(nombre "Ponerse en forma"))

([CP_Class20021] of  Problema+cardiorrespiratorio

	(nombre "Angina de pecho"))

([CP_Class20022] of  Problema+cardiorrespiratorio

	(nombre "Bronquitis"))

([CP_Class20023] of  Problema+cardiorrespiratorio

	(nombre "Hipoventilacion"))

([CP_Class20024] of  Problema+cardiorrespiratorio

	(nombre "Insuficiencia cardiaca"))

([CP_Class20025] of  Problema+cardiorrespiratorio

	(nombre "Neumonia"))

([CP_Class20026] of  Problema+cardiorrespiratorio

	(nombre "Taquicardia"))

([CP_Class20027] of  Problema+cardiorrespiratorio

	(nombre "Tuberculosis"))

([CP_Class20028] of  Problema+musculo-esqueletico

	(grupo_muscular Manos)
	(nombre "Dolor o afectacion de manos"))

([CP_Class20029] of  Problema+musculo-esqueletico

	(grupo_muscular Abdominales)
	(nombre "Dolor o afectacion de abdomen"))

([CP_Class20030] of  Problema+musculo-esqueletico

	(grupo_muscular Cuello)
	(nombre "Dolor o afectacion de cuello"))

([CP_Class20032] of  Problema+musculo-esqueletico

	(grupo_muscular Espalda)
	(nombre "Dolor o afectacion de espalda"))

([CP_Class20033] of  Problema+musculo-esqueletico

	(grupo_muscular Codo)
	(nombre "Dolor o afectacion de codo"))

([CP_Class20034] of  Problema+musculo-esqueletico

	(grupo_muscular Piernas)
	(nombre "Dolor o afectacion de piernas"))

([CP_Class20036] of  Problema+musculo-esqueletico

	(grupo_muscular Pies)
	(nombre "Dolor o afectacion de pies"))

([CP_Class21] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 3)
	(grupo_muscular Gluteos)
	(intensidad Media)
	(nombre "Sentadillas")
	(objetivos
		[30-4-20_Class27]
		[CP_Class20019]
		[CP_Class20018]
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 25)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class22] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 3)
	(grupo_muscular Gluteos)
	(intensidad Alta)
	(nombre "Sentadillas")
	(objetivos
		[30-4-20_Class27]
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 40)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class3] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20029]
		[CP_Class20032])
	(duracion_por_rep 3)
	(grupo_muscular Abdominales)
	(intensidad Baja)
	(nombre "Abdominales")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 30)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30000] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Ejercicio del gato")
	(objetivos
		[CP_Class20012]
		[CP_Class20014])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30001] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Plancha con rodilla al pecho")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 24)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class30002] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Flexiones")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30003] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Press de hombros")
	(objetivos
		[30-4-20_Class24]
		[30-4-20_Class26]
		[CP_Class20019])
	(repeticiones+max 12)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30004] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Press de hombros")
	(objetivos
		[30-4-20_Class24]
		[30-4-20_Class26]
		[CP_Class20019])
	(repeticiones+max 24)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30005] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Press de hombros")
	(objetivos
		[30-4-20_Class24]
		[30-4-20_Class26]
		[CP_Class20019])
	(repeticiones+max 36)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30006] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Fondos de triceps")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 10)
	(repeticiones+min 8)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30007] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Fondos de triceps")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 20)
	(repeticiones+min 8)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30008] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class38]
		[CP_Class20032]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Fondos de triceps")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class24])
	(repeticiones+max 30)
	(repeticiones+min 8)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30009] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Curl de biceps con mancuernas")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 12)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30010] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Curl de biceps con mancuernas")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 24)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30011] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class36])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Curl de biceps con mancuernas")
	(objetivos [30-4-20_Class24])
	(repeticiones+max 36)
	(repeticiones+min 12)
	(tipo+de+ejercicio con_pesas))

([CP_Class30012] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Piernas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class30013] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Piernas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class30014] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Piernas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class30015] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Giro de tronco con brazos en mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class30016] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Giro de tronco con brazos en mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class30017] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Giro de tronco con brazos en mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class30018] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Abrir rodillas al suelo con pies tocandose")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30020] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Abrir rodillas al suelo con pies tocandose")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30021] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Abrir rodillas al suelo con pies tocandose")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30022] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Girar cadera y tocar con una rodilla al suelo")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30023] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Girar cadera y tocar con una rodilla al suelo")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30024] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Girar cadera y tocar con una rodilla al suelo")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class30025] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Brazo detras de la espalda de la espalda e inclinar cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30026] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Brazo detras de la espalda de la espalda e inclinar cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30027] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Brazo detras de la espalda de la espalda e inclinar cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class30028] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Baja)
	(nombre "Estirar brazos para desbloquear omoplatos")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio estiramiento))

([CP_Class30029] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Alta)
	(nombre "Estirar brazos para desbloquear omoplatos")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio estiramiento))

([CP_Class30030] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Media)
	(nombre "Estirar brazos para desbloquear omoplatos")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio estiramiento))

([CP_Class30031] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Baja)
	(nombre "Inclinar cuello hacia atras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio estiramiento))

([CP_Class30032] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Media)
	(nombre "Inclinar cuello hacia atras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio estiramiento))

([CP_Class30033] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Alta)
	(nombre "Inclinar cuello hacia atras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio estiramiento))

([CP_Class30034] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Baja)
	(nombre "Bajar barbilla al cuello con los brazos detras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio estiramiento))

([CP_Class30035] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Media)
	(nombre "Bajar barbilla al cuello con los brazos detras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio estiramiento))

([CP_Class30036] of  Ejercicio

	(duracion_por_rep 15)
	(intensidad Alta)
	(nombre "Bajar barbilla al cuello con los brazos detras")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio estiramiento))

([CP_Class30037] of  Ejercicio

	(duracion_por_rep 60)
	(intensidad Baja)
	(nombre "Caminar hacia atras y los lados")
	(objetivos [CP_Class20017])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class30038] of  Ejercicio

	(duracion_por_rep 60)
	(intensidad Media)
	(nombre "Caminar hacia atras y los lados")
	(objetivos [CP_Class20017])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class30039] of  Ejercicio

	(duracion_por_rep 60)
	(intensidad Alta)
	(nombre "Caminar hacia atras y los lados")
	(objetivos [CP_Class20017])
	(repeticiones+max 3)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class30040] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[CP_Class20024]
		[CP_Class20026]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 300)
	(intensidad Baja)
	(nombre "Zumba")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio cardio))

([CP_Class30041] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 600)
	(intensidad Media)
	(nombre "Zumba")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio cardio))

([CP_Class30042] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 900)
	(intensidad Alta)
	(nombre "Zumba")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[CP_Class20018])
	(repeticiones+max 1)
	(repeticiones+min 1)
	(tipo+de+ejercicio cardio))

([CP_Class30043] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Balanceo del cuerpo con peso")
	(objetivos
		[CP_Class20014]
		[CP_Class20017])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30044] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Balanceo del cuerpo con peso")
	(objetivos
		[CP_Class20014]
		[CP_Class20017])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30045] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Balanceo del cuerpo con peso")
	(objetivos
		[CP_Class20014]
		[CP_Class20017])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class30046] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Levantarse sin usar las manos")
	(objetivos [CP_Class20017])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30047] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Levantarse sin usar las manos")
	(objetivos [CP_Class20017])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30048] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Levantarse sin usar las manos")
	(objetivos [CP_Class20017])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30049] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Runner pulls")
	(objetivos
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26])
	(repeticiones+max 20)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30050] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Runner pulls")
	(objetivos
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30051] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Runner pulls")
	(objetivos
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30052] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Plancha con rodilla al pecho")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30053] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Plancha con rodilla al pecho")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class30054] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Levantar una pierna en posicion de marcha")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio suelo))

([CP_Class30055] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Levantar una pierna en posicion de marcha")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30056] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Levantar una pierna en posicion de marcha")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30057] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Elevarse con una sola pierna")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio suelo))

([CP_Class30058] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Elevarse con una sola pierna")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30059] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Elevarse con una sola pierna")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30060] of  Ejercicio

	(contraindicado
		[CP_Class20032]
		[CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Levantar caderas y flexionar piernas con bola suiza")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30061] of  Ejercicio

	(contraindicado
		[CP_Class20032]
		[CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Levantar caderas y flexionar piernas con bola suiza")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30062] of  Ejercicio

	(contraindicado
		[CP_Class20032]
		[CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Levantar caderas y flexionar piernas con bola suiza")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30063] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Zancadas")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class23])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio suelo))

([CP_Class30064] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Zancadas")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class23])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class30065] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Zancadas")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class23])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30066] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 15)
	(intensidad Baja)
	(nombre "Peso muerto con barra")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30067] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 15)
	(intensidad Media)
	(nombre "Peso muerto con barra")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30068] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 15)
	(intensidad Alta)
	(nombre "Peso muerto con barra")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30069] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Peso muerto con mancuernas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30070] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Peso muerto con mancuernas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30071] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Peso muerto con mancuernas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 30)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30072] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Mancuerna con un unico brazo")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30073] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Mancuerna con un unico brazo")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30074] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Mancuerna con un unico brazo")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[30-4-20_Class26]
		[30-4-20_Class27])
	(repeticiones+max 30)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30075] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Clamshell")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30076] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Clamshell")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30077] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Clamshell")
	(objetivos
		[CP_Class20019]
		[30-4-20_Class27])
	(repeticiones+max 30)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30078] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Un paso adelante con mancuernas")
	(objetivos
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class24])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30079] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Un paso adelante con mancuernas")
	(objetivos
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class24])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30080] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20034])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Un paso adelante con mancuernas")
	(objetivos
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25]
		[30-4-20_Class24])
	(repeticiones+max 30)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30081] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20034]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Sentadillas oblicuas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30082] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20034]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Sentadillas oblicuas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30083] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20034]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Sentadillas oblicuas")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 30)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30084] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Flexiones")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio suelo))

([CP_Class30085] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Flexiones")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30086] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Salto de cuerda")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30087] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[CP_Class20036]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Salto de cuerda")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30088] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Salto de cuerda")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30089] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Lunge")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio suelo))

([CP_Class30090] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Lunge")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class30091] of  Ejercicio

	(contraindicado [CP_Class20034])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Lunge")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class30092] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Climbers")
	(objetivos
		[30-4-20_Class23]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class30093] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Climbers")
	(objetivos
		[30-4-20_Class23]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 30)
	(repeticiones+min 20)
	(tipo+de+ejercicio cardio))

([CP_Class30094] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37]
		[30-4-20_Class34])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Burpees")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class30095] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37]
		[30-4-20_Class34])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Burpees")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class30099] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37]
		[30-4-20_Class34]
		[CP_Class20029]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028]
		[CP_Class20034]
		[CP_Class20036]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Burpees con salto de 180 grados")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class30100] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Patinador")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class30101] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Patinador")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio cardio))

([CP_Class30102] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Patinador")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class30103] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20029]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Rollbacks")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class30104] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[CP_Class20029]
		[CP_Class20034]
		[CP_Class20036])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Rollbacks")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20017]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class30105] of  Ejercicio

	(contraindicado
		[CP_Class20032]
		[CP_Class20028]
		[30-4-20_Class30]
		[CP_Class20030]
		[30-4-20_Class38])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Dominadas")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30106] of  Ejercicio

	(contraindicado
		[CP_Class20030]
		[CP_Class20032]
		[CP_Class20028]
		[30-4-20_Class30]
		[30-4-20_Class38])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Dominadas")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30107] of  Ejercicio

	(contraindicado
		[CP_Class20032]
		[CP_Class20028]
		[30-4-20_Class30]
		[CP_Class20030]
		[30-4-20_Class38])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Dominadas")
	(objetivos
		[30-4-20_Class26]
		[30-4-20_Class24])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class30108] of  Ejercicio

	(contraindicado [CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Peso muerto")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30109] of  Ejercicio

	(contraindicado [CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Peso muerto")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class30110] of  Ejercicio

	(contraindicado [CP_Class20032])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Peso muerto")
	(objetivos [30-4-20_Class26])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30111] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Remo con barra en maquina")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class24])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30112] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Remo con barra en maquina")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class24])
	(repeticiones+max 35)
	(repeticiones+min 30)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30113] of  Ejercicio

	(contraindicado
		[30-4-20_Class38]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Remo con barra en maquina")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class26]
		[30-4-20_Class24])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_aparatos))

([CP_Class30114] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Press banca")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30115] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Press banca")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30116] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Press banca")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class30117] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Press con mancuernas inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30118] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Press con mancuernas inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30119] of  Ejercicio

	(contraindicado
		[30-4-20_Class36]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Press con mancuernas inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class30120] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Press declinado con mancuernas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30121] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Press declinado con mancuernas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30122] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20028]
		[30-4-20_Class37])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Press declinado con mancuernas")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013]
		[CP_Class20019])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class30123] of  Ejercicio

	(contraindicado
		[CP_Class20028]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Aperturas en banco inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 10)
	(repeticiones+min 5)
	(tipo+de+ejercicio con_pesas))

([CP_Class30124] of  Ejercicio

	(contraindicado
		[CP_Class20028]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Aperturas en banco inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class30125] of  Ejercicio

	(contraindicado
		[CP_Class20028]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Aperturas en banco inclinado")
	(objetivos
		[30-4-20_Class24]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class4] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20029]
		[CP_Class20032])
	(duracion_por_rep 3)
	(grupo_muscular Abdominales)
	(intensidad Media)
	(nombre "Abdominales")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 75)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class40001] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Ejercicio del gato")
	(objetivos
		[CP_Class20012]
		[CP_Class20014])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40002] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Ejercicio del gato")
	(objetivos
		[CP_Class20012]
		[CP_Class20014])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40003] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37]
		[30-4-20_Class34]
		[CP_Class20029]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028]
		[CP_Class20034]
		[CP_Class20036]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Burpees con salto de 180 grados")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 10)
	(repeticiones+min 10)
	(tipo+de+ejercicio cardio))

([CP_Class40004] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class34]
		[30-4-20_Class37]
		[CP_Class20029]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20028]
		[CP_Class20034]
		[CP_Class20036]
		[30-4-20_Class30])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Burpees con salto de 180 grados")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class40005] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Climbers")
	(objetivos
		[30-4-20_Class23]
		[30-4-20_Class28]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class40007] of  Ejercicio

	(contraindicado
		[CP_Class20024]
		[CP_Class20026]
		[CP_Class1]
		[30-4-20_Class37]
		[30-4-20_Class34])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Burpees")
	(objetivos
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class27]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 5)
	(tipo+de+ejercicio cardio))

([CP_Class40008] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Rodillas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40009] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Rodillas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40010] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Rodillas al pecho")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40011] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40012] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40013] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40014] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar dorsales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40015] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar dorsales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40016] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar dorsales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40017] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar triceps")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40018] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar triceps")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40019] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar triceps")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40020] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Rotacion de hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40021] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Rotacion de hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40022] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Rotacion de hombros")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40023] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Extension de espalda")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40024] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Extension de espalda")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40025] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Extension de espalda")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40026] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Torsion de cadera")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40027] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Torsion de cadera")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40028] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Torsion de cadera")
	(objetivos
		[CP_Class20014]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40029] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estiramiento de la cara posterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40030] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estiramiento de la cara posterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40031] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estiramiento de la cara posterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40032] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estiramiento de la cara anterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40033] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estiramiento de la cara anterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40034] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estiramiento de la cara anterior del hombro")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class40035] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estiramiento de cadera")
	(objetivos
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class40036] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estiramiento de cadera")
	(objetivos
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class40037] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estiramiento de cadera")
	(objetivos
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class5] of  Ejercicio

	(contraindicado
		[30-4-20_Class34]
		[CP_Class20029]
		[CP_Class20032])
	(duracion_por_rep 2)
	(grupo_muscular Abdominales)
	(intensidad Alta)
	(nombre "Abdominales")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 150)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50003] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estiramiento capsular en rotacion interna")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50004] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estiramiento capsular en rotacion interna")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50005] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estiramiento capsular en rotacion interna")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50006] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar isquiosurales y gemelos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50007] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar isquiosurales y gemelos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50008] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar isquiosurales y gemelos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50009] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar flexores de cadera")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50010] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar flexores de cadera")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50011] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar flexores de cadera")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50012] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar psoas iliaco")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50013] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar psoas iliaco")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50014] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar psoas iliaco")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50015] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Elevaciones")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50016] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Elevaciones")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50017] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Elevaciones")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50018] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Flexiones verticales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50019] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Flexiones verticales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50020] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Flexiones verticales")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50021] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar triceps sural")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50022] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar triceps sural")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50023] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar triceps sural")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50024] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar isquiotibiales")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50025] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar isquiotibiales")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50026] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar isquiotibiales")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50027] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar tensor de la fascia lata")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50028] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar tensor de la fascia lata")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50029] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar tensor de la fascia lata")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50030] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar piramidal y gluteos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50031] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar piramidal y gluteos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50032] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar piramidal y gluteos")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50033] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar psoas iliaco estirando el brazo")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50034] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar psoas iliaco estirando el brazo")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50035] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar psoas iliaco estirando el brazo")
	(objetivos
		[CP_Class20015]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50036] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estiramiento mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50037] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estiramiento mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50038] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estiramiento mariposa")
	(objetivos
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50039] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Sentadilla con una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50040] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Sentadilla con una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50041] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Sentadilla con una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class50042] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Sentadilla con salto una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50043] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Sentadilla con salto una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50044] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Sentadilla con salto una sola pierna")
	(objetivos
		[CP_Class20017]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class50045] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class34]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Estocada con patada al frente")
	(objetivos [CP_Class20017])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50046] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class34]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Estocada con patada al frente")
	(objetivos [CP_Class20017])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50047] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class34]
		[30-4-20_Class37])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Estocada con patada al frente")
	(objetivos [CP_Class20017])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class50048] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Flexion cervical")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50049] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Flexion cervical")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50050] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Flexion cervical")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50051] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar trapecio superior")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50052] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar trapecio superior")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50053] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar trapecio superior")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50054] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Ejercicio del pendulo")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50055] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Ejercicio del pendulo")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50056] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Ejercicio del pendulo")
	(objetivos
		[CP_Class20014]
		[CP_Class20016]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50057] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Retraccion del omoplato")
	(objetivos
		[CP_Class20016]
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50058] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Retraccion del omoplato")
	(objetivos
		[CP_Class20016]
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50059] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Retraccion del omoplato")
	(objetivos
		[CP_Class20016]
		[CP_Class20012]
		[30-4-20_Class26])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50060] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar extensiones de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50061] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar extensiones de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50062] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar extensiones de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50063] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class32]
		[30-4-20_Class33])
	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Skipping")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50064] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class32]
		[30-4-20_Class33])
	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Skipping")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50065] of  Ejercicio

	(contraindicado
		[CP_Class20034]
		[30-4-20_Class32]
		[30-4-20_Class33])
	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Skipping")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class50066] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Estirar oblicuo de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50067] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Estirar oblicuo de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50068] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Estirar oblicuo de cuello")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50069] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Baja)
	(nombre "Apertura de la garganta")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50070] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Alta)
	(nombre "Apertura de la garganta")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50071] of  Ejercicio

	(duracion_por_rep 10)
	(intensidad Media)
	(nombre "Apertura de la garganta")
	(objetivos
		[30-4-20_Class46]
		[CP_Class20012])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50072] of  Ejercicio

	(duracion_por_rep 180)
	(intensidad Baja)
	(nombre "Pilates")
	(objetivos
		[CP_Class20012]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class25])
	(repeticiones+max 2)
	(repeticiones+min 1)
	(tipo+de+ejercicio suelo))

([CP_Class50073] of  Ejercicio

	(duracion_por_rep 540)
	(intensidad Alta)
	(nombre "Pilates")
	(objetivos
		[CP_Class20012]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class25])
	(repeticiones+max 2)
	(repeticiones+min 1)
	(tipo+de+ejercicio suelo))

([CP_Class50074] of  Ejercicio

	(duracion_por_rep 360)
	(intensidad Media)
	(nombre "Pilates")
	(objetivos
		[CP_Class20012]
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class24]
		[30-4-20_Class25])
	(repeticiones+max 2)
	(repeticiones+min 1)
	(tipo+de+ejercicio suelo))

([CP_Class50075] of  Ejercicio

	(contraindicado
		[30-4-20_Class32]
		[30-4-20_Class33]
		[CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Fondo de pecho")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50076] of  Ejercicio

	(contraindicado
		[30-4-20_Class32]
		[30-4-20_Class33]
		[CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Fondo de pecho")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50077] of  Ejercicio

	(contraindicado
		[30-4-20_Class32]
		[30-4-20_Class33]
		[CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Fondo de pecho")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio suelo))

([CP_Class50078] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20027])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Pullover")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio con_pesas))

([CP_Class50079] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20027])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Pullover")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio con_pesas))

([CP_Class50080] of  Ejercicio

	(contraindicado
		[30-4-20_Class37]
		[30-4-20_Class30]
		[CP_Class20033]
		[CP_Class20032]
		[CP_Class20027])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Pullover")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio con_pesas))

([CP_Class50081] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Estiramiento de pectoral")
	(objetivos
		[CP_Class20012]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio estiramiento))

([CP_Class50082] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Estiramiento de pectoral")
	(objetivos
		[CP_Class20012]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio estiramiento))

([CP_Class50083] of  Ejercicio

	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Estiramiento de pectoral")
	(objetivos
		[CP_Class20012]
		[CP_Class20019]
		[CP_Class20013])
	(repeticiones+max 20)
	(repeticiones+min 15)
	(tipo+de+ejercicio estiramiento))

([CP_Class50084] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Flexiones inclinadas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 5)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class50085] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Flexiones inclinadas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50086] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[30-4-20_Class30]
		[CP_Class20032])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Flexiones inclinadas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50087] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Tijeras con las piernas")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 5)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class50088] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Tijeras con las piernas")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50089] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Tijeras con las piernas")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28]
		[30-4-20_Class25])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50090] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[CP_Class1])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Flexiones isometricas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 5)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class50091] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[CP_Class1])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Flexiones isometricas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50092] of  Ejercicio

	(contraindicado
		[30-4-20_Class30]
		[CP_Class20032]
		[CP_Class1])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Flexiones isometricas")
	(objetivos
		[CP_Class20018]
		[CP_Class20013])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50093] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "McGill Crunch")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class26]
		[30-4-20_Class25]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 5)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class50094] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "McGill Crunch")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class26]
		[30-4-20_Class25]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50095] of  Ejercicio

	(contraindicado
		[CP_Class20029]
		[CP_Class20032]
		[CP_Class20034]
		[30-4-20_Class34])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "McGill Crunch")
	(objetivos
		[30-4-20_Class28]
		[30-4-20_Class26]
		[30-4-20_Class25]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class50096] of  Ejercicio

	(contraindicado [CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Baja)
	(nombre "Curl de isquiotibiales")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 5)
	(repeticiones+min 3)
	(tipo+de+ejercicio suelo))

([CP_Class50097] of  Ejercicio

	(contraindicado [CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Alta)
	(nombre "Curl de isquiotibiales")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 25)
	(repeticiones+min 20)
	(tipo+de+ejercicio suelo))

([CP_Class50098] of  Ejercicio

	(contraindicado [CP_Class20029])
	(duracion_por_rep 5)
	(intensidad Media)
	(nombre "Curl de isquiotibiales")
	(objetivos
		[CP_Class20018]
		[CP_Class20019]
		[30-4-20_Class28])
	(repeticiones+max 15)
	(repeticiones+min 10)
	(tipo+de+ejercicio suelo))

([CP_Class6] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[CP_Class20024]
		[CP_Class20026]
		[30-4-20_Class38])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Baja)
	(nombre "Bicicleta estatica")
	(objetivos
		[30-4-20_Class25]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 3)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))

([CP_Class9] of  Ejercicio

	(contraindicado
		[CP_Class1]
		[CP_Class20024]
		[CP_Class20026]
		[30-4-20_Class38])
	(duracion_por_rep 300)
	(grupo_muscular Piernas)
	(intensidad Media)
	(nombre "Bicicleta estatica")
	(objetivos
		[30-4-20_Class25]
		[30-4-20_Class23]
		[CP_Class20018]
		[CP_Class20019])
	(repeticiones+max 6)
	(repeticiones+min 2)
	(tipo+de+ejercicio con_aparatos))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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