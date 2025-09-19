object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object arenaGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1}
}
object bumblebee {
	var transformado = false
	method modoAuto(){transformado = true}
	method modoRobot() {transformado = false}
	method peso() {return 800}
	method nivelPeligrosidad(){return if (transformado) 15 else 30}
}
object paqueteLadrillos {
	var property cantidad = 0
	const property pesoLadrillo=2
	method peso(){return cantidad * pesoLadrillo}
	method nivelPeligrosidad(){return 2}
}
object bateriaAntiarea {
	var misiles = false
	method cargada(){misiles=true}
	method descargada(){misiles=false}
	method peso(){return if (misiles) 300 else 200}
	method nivelPeligrosidad(){return if (misiles) 100 else 0}
}
object residuosRadiactivos {
	var property peso = 0
	method nivelPeligrosidad(){return 200}
}

