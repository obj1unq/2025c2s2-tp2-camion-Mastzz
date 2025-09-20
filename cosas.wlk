object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){return 1}
	method accidentar() {}
}
object arenaGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1}
	method bulto(){return 1}
	method accidentar(){peso += 20}
}
object bumblebee {
	var property transformado = false
	method modoAuto(){transformado = true}
	method modoRobot() {transformado = false}
	method peso() {return 800}
	method nivelPeligrosidad(){return if (transformado) 15 else 30}
	method bulto(){return 2}
	method accidentar() {
	  if (transformado){
		self.modoRobot()
	  }
	  else{
		self.modoAuto()
	  }
	}
}
object paqueteLadrillos {
	var property cantidad = 0
	const property pesoLadrillo=2
	method peso(){return cantidad * pesoLadrillo}
	method nivelPeligrosidad(){return 2}
	method bulto(){
		return if (cantidad <= 100) 1 else if (cantidad >= 101 && cantidad <= 300) 2 else 3
	}
	method accidentar(){cantidad = (cantidad - 12).max(0)}
}
object bateriaAntiarea {
	var property misiles = false
	method cargada(){misiles=true}
	method descargada(){misiles=false}
	method peso(){return if (misiles) 300 else 200}
	method nivelPeligrosidad(){return if (misiles) 100 else 0}
	method bulto(){return if (misiles) 2 else 1}
	method accidentar(){self.descargada()}
}
object residuosRadiactivos {
	var property peso = 0
	method nivelPeligrosidad(){return 200}
	method bulto(){return 1}
	method accidentar(){peso +=15}
}
object contenedorPortuario {
	const property cosas = #{}
	const property neto = 100
	method agregarCosa(unaCosa){
		cosas.add(unaCosa)
	}
	method pesoCosas() {
	  return cosas.sum({cosa => cosa.peso()})
	}
	method peso() {
	  return neto + self.pesoCosas()
	}
	method cosaConMasNivelDePeligrosidad() {
	  return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
	method nivelPeligrosidad(){
		return if (!cosas.isEmpty()) self.cosaConMasNivelDePeligrosidad().nivelPeligrosidad() else 0
	}
	method bulto(){
		return cosas.sum({cosa => cosa.bulto()}) + 1
	}
	method accidentar(){cosas.forEach({cosa => cosa.accidentar()})}
}
object embalajeSeguridad {
	var property cosa = null
	method peso() {
	  return cosa.peso()
	}
	method nivelPeligrosidad(){
		return cosa.nivelPeligrosidad() / 2
	}
	method bulto(){return 2}
	method accidentar(){cosa.accidentar()}
}

