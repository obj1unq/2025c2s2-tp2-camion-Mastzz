// Para que el dominio y validaciones tengan sentido, el mensaje que entiende el camion de cargar, deberia validar que la cosa a cargar no esté ya en el almacen (enviando un mensaje al mismo y utilizando bloque de predicado para todas las cosas del almacen). En caso contrario, habrían cosas duplicadas. Pero bueno el ejercicio no pide esto
object almacen {
    const property cosas = #{}
    method estibar(carga){
        // También iría bien una validación aca además de lo de arriba (por las dudas)
        cosas.addAll(carga)
    }
}