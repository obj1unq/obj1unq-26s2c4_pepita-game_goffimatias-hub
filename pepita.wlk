import alimentos.*
import obstaculos.*
import wollok.game.*
object pepita {

	// CONFIGURACION INICIAL
	
	var property energia = 100 //El getter y setter solo lo necesito para testear
	var property position = game.origin()
	var property image = "pepita.png"

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
	
	method cansada() {
		self.image("pepita-gris.png")
		self.error("No tengo energia para volar")
	}

	method mover(direccion) {
		const nuevaPosition = direccion.siguiente(position) //valida el tablero antes de gastar energia
		self.volar(10)
		self.position(nuevaPosition)
	}

	method volar(distancia) {
		self.validarVolar(distancia)
    	energia -= self.energiaQueGastaAlVolar(distancia)
  	}

	method perderGravedad() {
		if (not self.estaPepitaEnElSuelo()) {
        	self.position(game.at(
				self.position().x(),
				self.position().y() - 1
			))
		}
	}

	// FIN ACCIONES
}

