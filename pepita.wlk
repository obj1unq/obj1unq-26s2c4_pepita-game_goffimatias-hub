import alimentos.*
import obstaculos.*
import wollok.game.*
object pepita {

	// CONFIGURACION INICIAL
	
	var property energia = 100 //El getter y setter solo lo necesito para testear
	var position = game.origin()
	var imagen = "pepita.png"

	method image() { //metodo necesario para wollok game
		return imagen
	}

	method position() { //metodo necesario para wollok game
		return position
	}

	method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

	// VALIDACIONES

	method validarVolar(distancia) {
		if (not self.puedeVolar(distancia)) {
			self.cansada()
		}
	}

	// FIN VALIDACIONES

	// CONSULTAS

	method energiaQueGastaAlVolar(distancia) {
		return 10 + distancia/10
  	}

	method estaPepitaEnElSuelo() {
		return self.position().y() == 0
	}

	method text() { //metodo opcional para mostrar un texto en wollok game
		return energia.toString()
	}

	method textColor() { //metodo opcional para definir el color del texto (RGBA)
		return "FF0000FF"
	}

	method puedeVolar(distancia) {
		return energia >= self.energiaQueGastaAlVolar(distancia)
	}

	// FIN CONSULTAS

	// ACCIONES
	
	method cambiarImagen(_imagen) {
		imagen = _imagen
	}

	method cansada() {
		self.cambiarImagen("pepita-gris.png")
		self.error("No tengo energia para volar")
	}

	method comer() {
		const alimento = alimentos.darAlimentoEn(self.position())
    	energia += alimento.energiaQueAporta()
	}

	method evitarObstaculoDesde(positionAnterior) {
		if (obstaculos.hayObstaculoEn(position)) {
			self.position(positionAnterior)
			self.rollBackGastoDeEnergia()
		}
	}

	method mover(direccion) {
		const positionAnterior = position
		const nuevaPosition = direccion.siguiente(position) //valida el tablero antes de gastar energia
		self.volar(10)
		position = nuevaPosition
		self.evitarObstaculoDesde(positionAnterior)
	}

	method volar(distancia) {
		self.validarVolar(distancia)
    	energia -= self.energiaQueGastaAlVolar(distancia)
  	}

	method perderGravedad() {
		if (not self.estaPepitaEnElSuelo()) {
        	position = game.at(
				self.position().x(), 
				self.position().y() - 1
			) 
		}
	}

	method rollBackGastoDeEnergia() {
		energia += self.energiaQueGastaAlVolar(10)
	}

	// FIN ACCIONES
}

