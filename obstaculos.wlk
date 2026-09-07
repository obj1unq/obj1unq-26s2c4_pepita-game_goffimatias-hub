object obstaculos {
    const elementos = [muro]

    method hayObstaculoEn(unaPosicion) {
        return elementos.any { obstaculo => obstaculo.position() == unaPosicion }
    }
}

object muro {
    var position = game.at(1, 2)
    const imagen = "muro.png"

    method image() {
        return imagen
    }

    method position() {
        return position
    }

    method position(_position) {
        position = _position
    }
}
