import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
	const property maximoPeso = 2500
		
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
	method pesoTotal() {
	  return tara + self.pesoDeCarga()
	}
	method pesoDeCarga() {
	  return cosas.sum({cosa => cosa.peso()})
	}
	method estaExcedidoDePeso() {
	  return self.pesoTotal() > maximoPeso
	}
	method cosaConPeligrosidad(nivelPeligrosidad) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})
	}
	method cosasConMasNivelDe(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasConMasNivelQue(cosa){
		return self.cosasConMasNivelDe(cosa.nivelPeligrosidad())
	}
	method puedeCircularEnRuta(nivelPeligrosidad){
		return !self.estaExcedidoDePeso() && !self.hayAlgunoConMasNivel(nivelPeligrosidad)
	}
	// podria usar un predicate para especificamente consultar esto pero prefiero reutilizar código
	method hayAlgunoConMasNivel(nivelPeligrosidad) {
	  return self.cosasConMasNivelDe(nivelPeligrosidad).size() > 0
	}
}
