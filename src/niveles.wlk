import wollok.game.*
import objetos.*
import juego.*
object nivel1 {
	method cargar() {
		const jugadoresArgentina = [game.origin().up(1).right(3),game.origin().up(12).right(2),game.origin().up(11).right(3),game.origin().up(10).right(1)]
		const jugadoresPolonia = []
		const estrellasNivel = []
		
		jugadoresPolonia.add(game.origin().up(9).right(4))
		jugadoresPolonia.add(game.origin().up(13).right(11))
		jugadoresPolonia.add(game.origin().up(11).right(10))
		jugadoresPolonia.add(game.origin().up(3).right(4))
		jugadoresPolonia.add(game.origin().up(2).right(12))
	
		estrellasNivel.add(game.origin().up(12).right(3))
		estrellasNivel.add(game.origin().up(2).right(11))
		estrellasNivel.add(game.origin().up(3).right(1))
		
		jugadoresArgentina.forEach{pos=>juego.nuevaPared(pos,"mbappe.png")}
		jugadoresPolonia.forEach{pos=>juego.nuevaPared(pos,"hinchaRiver.png")}
		estrellasNivel.forEach{pos=>juego.nuevaEstrella(pos)}
	}
}
