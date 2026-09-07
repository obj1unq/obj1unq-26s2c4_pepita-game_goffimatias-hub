object alimentos {
    const elementos = [manzana, alpiste]

    method hayAlimentoEn(unaPosicion) {
        return elementos.any { alimento => alimento.position() == unaPosicion }
    }

     method validarComer(unaPosicion) {
        if (not self.hayAlimentoEn(unaPosicion)) {
            self.error("No hay alimento en la posicion")
        }
    }

    method darAlimentoEn(unaPosicion) {
        self.validarComer(unaPosicion)
        const alimento = elementos.find { a => a.position() == unaPosicion }
        elementos.remove(alimento)
        game.removeVisual(alimento)
        return alimento
    }    
}

object manzana {

    var property energia = 60
    var position = game.at(3, 3)
    const imagen = "manzana.png"

    method image() {
        return imagen
    }

    method position() {
        return position
    }

    method position(_position) {
        position = _position 
    }

    method energiaQueAporta() {
        return energia
    }
}

object alpiste {

    var property energia = 40
    var position = game.at(2, 2)
    const imagen = "alpiste.png"

    method image() {
        return imagen
    }

    method position() {
        return position
    }

    method position(_position) {
        position = _position 
    }

    method energiaQueAporta() {
        return energia
    }
}