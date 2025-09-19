import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarCarga(unaCosa) {
	  if (cosas.contains(unaCosa)){
		self.error("No puedo cargar " + unaCosa + " ya está cargada!")
	  }
	}
	method validarDescarga(unaCosa){
		if (!cosas.contains(unaCosa)){
			self.error("No puedo descargar " + unaCosa + " no hay cargada!")
		}
	}
	// Modularizo y para no tener tantos mensajes encadenados
	method esPesoPar(peso){
		return peso.even()
	}
	method sonPesosPares() {
	  return cosas.all({cosa => self.esPesoPar(cosa.peso())})
	}
	method tieneConPeso(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
}
