import camion.*
import cosas.*
// Para que el dominio y validaciones tengan sentido, el mensaje que entiende el camion de cargar, deberia validar que la cosa a cargar no esté ya en el almacen (enviando un mensaje al mismo y utilizando bloque de predicado para todas las cosas del almacen). En caso contrario, habrían cosas duplicadas. Pero bueno el ejercicio no pide esto

// DESTINOS
object almacen {
    const property cosas = #{}
    method estibar(carga){
        // También iría bien una validación aca además de lo de arriba (por las dudas)
        cosas.addAll(carga)
    }
}

// CAMINOS
object rutaNueve {
    method puedeTransitar(vehiculo){
        return vehiculo.puedeCircularEnRuta(20)
    }
}
object caminosVecinales {
    var property pesoMaximoPermitido = 0
    method puedeTransitar(vehiculo){
        return vehiculo.pesoTotal() <= pesoMaximoPermitido
    }
}