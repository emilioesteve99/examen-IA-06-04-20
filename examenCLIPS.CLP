(deffacts datos
  (montacargas 0 0 paquete1 300 1 paquete2 500 2 paquete3 300 2)
  (destinoPaquete1 3) 
  (destinoPaquete2 3)
  (destinoPaquete3 4)
  (maxpes 650)
)

(defrule recogerPaquete1YLlevarloAlDestino
 ?f1 <- (montacargas ?m ?carga paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3)
 ?f2 <- (destinoPaquete1 ?dest1)
 (test (<> ?dest1 0))
  =>
   (retract ?f1)
   (retract ?f2)
   (assert (montacargas ?dest1 ?pes1 paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3))
   (assert (destinoPaquete1 0))
)

(defrule recogerPaquete2YLlevarloAlDestino
 ?f1 <- (montacargas ?m ?carga paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3)
 ?f2 <- (destinoPaquete2 ?dest2)
 (test (<> ?dest2 0))
  =>
   (retract ?f1)
   (retract ?f2)
   (assert (montacargas ?dest2 ?pes2 paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3))
   (assert (destinoPaquete2 0))
)


(defrule recogerPaquete3YLlevarloAlDestino
 ?f1 <- (montacargas ?m ?carga paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3)
 ?f2 <- (destinoPaquete3 ?dest3)
 (test (<> ?dest3 0))
  =>
   (retract ?f1)
   (retract ?f2)
   (assert (montacargas ?dest3 ?pes3 paquete1 ?pes1 ?p1 paquete2 ?pes2 ?p2 paquete3 ?pes3 ?p3))
   (assert (destinoPaquete3 0))
)

(defrule final
 (destinoPaquete1 ?dest1)
 (destinoPaquete2 ?dest2)
 (destinoPaquete3 ?dest3)
 (test (<> ?dest1 0))
 (test (<> ?dest2 0))
 (test (<> ?dest3 0))
  =>
 (halt)
)