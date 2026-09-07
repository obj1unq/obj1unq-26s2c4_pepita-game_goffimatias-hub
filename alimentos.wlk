

object manzana {

    var property energia = 60
    var property position = game.at(3, 3)
    const property image = "manzana.png"

    method energiaQueAporta() {
        return energia
    }

    method esComidoPor(ave) {
        ave.energia(ave.energia() + self.energiaQueAporta())
        game.removeVisual(self)
    }

    method atravesable() {
        return true
    }

    method chocar(ave) { }
}

object alpiste {

    var property energia = 50
    var property position = game.at(2, 2)
    const property image = "alpiste.png"

    method energiaQueAporta() {
        return energia
    }

    method esComidoPor(ave) {
        ave.energia(ave.energia() + self.energiaQueAporta())
        game.removeVisual(self)
    }

    method chocar(ave) { }

    method atravesable() {
        return true
    }
}