import wollok.game.*
import objetos.*
import juego.*

object nivel1{
	method cargar() {
		const jugadoresArgentina = [game.origin().up(1).right(3),game.origin().up(12).right(2),game.origin().up(11).right(3),game.origin().up(10).right(1)]
		const jugadoresPolonia = []
		const estrellasNivel = []
		const tarjetasRojas = []
		const tarjetasAmarillas = []
		const juez = [game.center()]
		jugadoresPolonia.add(game.origin().up(9).right(4))
		jugadoresPolonia.add(game.origin().up(13).right(11))
		jugadoresPolonia.add(game.origin().up(11).right(10))
		jugadoresPolonia.add(game.origin().up(3).right(4))
		jugadoresPolonia.add(game.origin().up(2).right(12))
		tarjetasRojas.add(game.origin().up(4).right(2))
		tarjetasAmarillas.add(game.origin().up(1).right(2))
		estrellasNivel.add(game.origin().up(12).right(3))
		estrellasNivel.add(game.origin().up(2).right(11))
		estrellasNivel.add(game.origin().up(3).right(1))
		jugador.ponerObjetivo(estrellasNivel.size())					
		
		tarjetasRojas.forEach{pos=>juego.nuevaTarjeta(pos,true)}
		tarjetasAmarillas.forEach{pos=>juego.nuevaTarjeta(pos,false)}
		jugadoresArgentina.forEach{pos=>juego.nuevaPared(pos,"mbappe.png")}
		jugadoresPolonia.forEach{pos=>juego.nuevaPared(pos,"hinchaRiver.png")}
		estrellasNivel.forEach{pos=>juego.nuevaEstrella(pos)}
		juez.forEach{pos=>juego.nuevoJuez(pos,false)}
		
		juego.agregarParedes()
		juego.agregarJugador()
	}
	method posicion () = game.center().left(5).down(3)
}
object nivel2{
	method cargar() {
		const paredesNuevas = [game.origin().up(1).right(13),game.origin().up(2).right(1),game.origin().up(2).right(3),game.origin().up(2).right(5),game.origin().up(2).right(7),
							game.origin().up(2).right(9),game.origin().up(2).right(11),
							game.origin().up(3).right(1),game.origin().up(4).right(13),game.origin().up(4).right(9),game.origin().up(4).right(12),
							game.origin().up(5).right(1),game.origin().up(5).right(11),game.origin().up(4).right(3),game.origin().up(4).right(5),game.origin().up(4).right(7),
							game.origin().up(6).right(2),game.origin().up(6).right(4),game.origin().up(6).right(6),game.origin().up(6).right(8),
							game.origin().up(8).right(2),game.origin().up(8).right(4),game.origin().up(8).right(6),game.origin().up(8).right(8),game.origin().up(8).right(10),
							game.origin().up(8).right(1),game.origin().up(7).right(1),game.origin().up(10).right(2),game.origin().up(10).right(4),game.origin().up(10).right(6),
							game.origin().up(10).right(8),game.origin().up(10).right(11),game.origin().up(10).right(12),game.origin().up(10).right(13)]
		const estrellasNivel = []
		estrellasNivel.add(game.origin().up(1).right(12))
		estrellasNivel.add(game.origin().up(3).right(3))
		estrellasNivel.add(game.origin().up(5).right(10))
		estrellasNivel.add(game.origin().up(5).right(13))
		estrellasNivel.add(game.origin().up(7).right(2))
		estrellasNivel.add(game.origin().up(9).right(1))
		estrellasNivel.add(game.origin().up(9).right(13))
		jugador.ponerObjetivo(estrellasNivel.size())					
		paredesNuevas.forEach{pos=>juego.nuevaPared(pos,"mbappe.png")
		const titulo = new CuadradoNivel(position = game.center().right(1).up(5),image="titulo.png")
		game.addVisual(titulo) 
		const opcion1 = new CuadradoNivel(position = game.center().left(5).up(5),image="nivel1.png")
		game.addVisual(opcion1)
	}
	estrellasNivel.forEach{pos=>juego.nuevaEstrella(pos)}
	
	juego.agregarParedes()
	juego.agregarJugador()
	}
	method posicion () = game.center().down(3)
}
object nivel3{
	method cargar() {
		
	}
	method posicion () = game.center().right(5).down(3)
}
//
