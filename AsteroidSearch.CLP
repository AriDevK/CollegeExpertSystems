;================================================================
; Author: Ariadne Rangel
; File: AsteroidSearch.CLP
; Description: Check if object is an asteroid and define its type
; ===============================================================


(
  deffacts inicio 
  (not (es-asteroide)) 
) 

(
  defrule pregunta1 
  (not (es-asteroide)) 
  => 
  (printout t "¿Es un tipo de roca espacial mucho más pequeño que un planeta? (si/no) " crlf) 
  (assert (es-asteroide (read))) 
) 

(
  defrule no_es_asteroide 
  (es-asteroide no) 
  => 
  (printout t "No es un asteroide." crlf) 
  (halt) ; Termina la ejecución del programa 
) 

(
  defrule orbita_entre_marte_y_jupiter 
  (es-asteroide si) 
  => 
  (printout t "¿Orbita en el espacio entre Marte y Júpiter? (si/no) " crlf) 
  (assert (orbita-entre-marte-y-jupiter (read))) 
) 

(
  defrule orbita_entre_jupiter_o_saturno_y_urano_o_neptuno 
  (es-asteroide si) 
  (not (orbita-entre-marte-y-jupiter si)) 
  => 
  (printout t "¿Orbita entre Júpiter o Saturno y entre Urano o Neptuno? (si/no) " crlf) 
  (assert (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno (read))) 
) 

(
  defrule no_comparte_orbita_de_planeta 
  (es-asteroide si) 
  (not (orbita-entre-marte-y-jupiter si)) 
  (not (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno si)) 
  => 
  (printout t "¿Comparte la órbita de un planeta, pero no suele impactar? (si/no) " crlf) 
  (assert (comparte-orbita-de-planeta (read))) 
) 

(
  defrule no_cruza_orbita_de_marte 
  (es-asteroide si) 
  (not (orbita-entre-marte-y-jupiter si)) 
  (not (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno si)) 
  (not (comparte-orbita-de-planeta si)) 
  => 
  (printout t "¿No cruza la órbita de Marte? (si/no) " crlf) 
  (assert (no-cruza-orbita-de-marte (read))) 
) 

 

(
  defrule no_cruza_orbita_de_tierra 
  (es-asteroide si) 
  (not (orbita-entre-marte-y-jupiter si)) 
  (not (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno si)) 
  (not (comparte-orbita-de-planeta si)) 
  (not (no-cruza-orbita-de-marte si)) 
  => 
  (printout t "¿No cruza la órbita de la Tierra? (si/no) " crlf) 
  (assert (no-cruza-orbita-de-tierra (read))) 
) 

(
  defrule es_ovni 
  (es-asteroide si) 
  (not (orbita-entre-marte-y-jupiter si)) 
  (not (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno si)) 
  (not (comparte-orbita-de-planeta si)) 
  (not (no-cruza-orbita-de-marte si)) 
  (not (no-cruza-orbita-de-tierra si)) 
  => 
  (printout t "Es un OVNI." crlf) 
) 

(
  defrule es_asteroides_aton 
  (es-asteroide si) 
  (orbita-entre-marte-y-jupiter si) 
  => 
  (printout t "Los asteroides Atón." crlf) 
) 

(
  defrule es_asteroides_apolo 
  (es-asteroide si) 
  (orbita-entre-jupiter-o-saturno-y-urano-o-neptuno si) 
  => 
  (printout t "Los asteroides Apolo." crlf) 
) 

(
  defrule es_asteroides_amor 
  (es-asteroide si) 
  (comparte-orbita-de-planeta si) 
  => 
  (printout t "Los asteroides Amor." crlf) 
) 

(
  defrule es_asteroides_troyanos 
  (es-asteroide si) 
  (no-cruza-orbita-de-marte si) 
  => 
  (printout t "Los asteroides Troyanos." crlf) 
) 

(
  defrule es_asteroides_cinturon 
  (es-asteroide si) 
  (no-cruza-orbita-de-tierra si) 
  => 
  (printout t "Los asteroides del Cinturón de asteroides." crlf) 
) 
