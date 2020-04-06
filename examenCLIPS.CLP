(deffacts datos
  (montacargas 0 0 paquete1 300 1 paquete2 500 2 paquete3 300 2)
  (destinoPaquete1 3) 
  (destinoPaquete2 3)
  (destinoPaquete3 4)
  (maxpes 650)
)

(defrule recogerPaquete1YLlevarloAlDestino
 ?f1 <- (montacargas ?m paquete1 ?pes1 ?p1 paquete2 ?pes2 p2 paquete3 ?pes3 ?p3)
 ?f2 <- (destinoPaquete1 ?dest1)
 (test (<> ?dest1 0)
  =>
   (retract ?f1)
   (assert (montacargas 3 paquete1 ?p1 paquete2 ?p2 paquete))
   (assert (destinoPaquete1 0)
)