import wollok.game.*
import objetos.*
import juego.*
import direcciones.*
class Nivel {
	method cargar() {
		jugador.setearBase()
		keyboard.w().onPressDo({jugador.movimiento(arriba)}) 
		keyboard.d().onPressDo({jugador.movimiento(derecha)})
		keyboard.s().onPressDo({jugador.movimiento(abajo)})
		keyboard.a().onPressDo({jugador.movimiento(izquierda)})
		juego.agregarParedes()
		juego.agregarJugador()
		const titulo = new CuadradoNivel(position = game.center().left(6).up(5),image="titulo.png")
		game.addVisual(titulo) 
}

}
object nivel1 inherits Nivel {
	override method cargar() {
		super()
		const dosveintes = [game.at(2,3),game.at(3,9)]
		const paredesNuevas = [game.origin().up(1).right(13),game.origin().up(2).right(3),game.origin().up(2).right(5),game.origin().up(2).right(7),
							game.origin().up(2).right(9),game.origin().up(2).right(11),
							game.origin().up(3).right(1),game.origin().up(4).right(13),game.origin().up(10).right(9),game.origin().up(4).right(12),
							game.origin().up(5).right(1),game.origin().up(5).right(11),game.origin().up(4).right(3),game.origin().up(4).right(5),game.origin().up(4).right(7),
							game.origin().up(6).right(2),game.origin().up(6).right(4),game.origin().up(6).right(6),game.origin().up(6).right(8),
							game.origin().up(8).right(2),game.origin().up(8).right(4),game.origin().up(8).right(6),game.origin().up(8).right(8),game.origin().up(8).right(10),
							game.origin().up(8).right(1),game.origin().up(7).right(2),game.origin().up(10).right(2),game.origin().up(10).right(4),game.origin().up(10).right(6),
							game.origin().up(10).right(8),game.origin().up(10).right(11),game.origin().up(10).right(12),game.origin().up(10).right(13),game.origin().up(8).right(12),
							game.origin().up(8).right(3),game.origin().up(10).right(1),game.at(4,2),game.at(3,3)]
		const estrellasNivel = [game.at(12,1)]
		const tarjetasAmarillas = [game.at(13,2),game.at(2,5)]
		const juez = [game.at(9,5)]
		copa.tocarPosicion(game.at(1,1))
		
		
		estrellasNivel.add(game.origin().up(5).right(10))
		estrellasNivel.add(game.origin().up(5).right(13))
		estrellasNivel.add(game.origin().up(7).right(3))
		estrellasNivel.add(game.origin().up(9).right(1))
		estrellasNivel.add(game.origin().up(9).right(13))
		jugador.ponerObjetivo(estrellasNivel.size())					
		paredesNuevas.forEach{pos=>juego.nuevaPared(pos,"cono.png")}
		
		const opcion1 = new CuadradoNivel(position = game.center().left(2).up(5),image="nivel1.png")
		game.addVisual(opcion1)
		tarjetasAmarillas.forEach{pos=>juego.nuevaTarjeta(pos,false)}
		estrellasNivel.forEach{pos=>juego.nuevaEstrella(pos)}
		juez.forEach{pos=>juego.nuevoJuezArribaAbajo(pos,false)}
		dosveintes.forEach{pos=>juego.nuevo225(pos)}
	}
	method posicion () = game.center().left(5).down(3)
	
}

object nivel2 inherits Nivel{
	
	override method cargar() {
		super()
		const conos = [game.at(3,1),game.at(3,8),game.at(1,9),game.at(3,10),game.at(4,10),game.at(5,10),game.at(6,10),
			game.at(7,10),game.at(8,9),game.at(6,6),game.at(6,5),game.at(4,2),game.at(4,3),game.at(2,5),game.at(13,2),game.at(12,6),game.at(10,8)]
		const jugadores = [game.at(3,4),game.at(10,11),game.at(8,10),game.at(2,10),game.at(7,1),game.at(8,4)]
		const poblas = [game.at(6,9),game.at(9,2)]
		const dosveintes = [game.at(4,1)]
		
		const estrellasNivel = []
		const tarjetasRojas = []
		const tarjetasAmarillas = [game.at(8,1),game.at(5,6)]
		const juez = [game.at(7,6)]
		
		tarjetasRojas.add(game.at(2,4))
		
		copa.tocarPosicion(game.at(1,3))
		
		estrellasNivel.add(game.at(4,4))
		estrellasNivel.add(game.at(7,8))
		estrellasNivel.add(game.at(12,2))
		
		jugador.ponerObjetivo(estrellasNivel.size())					
		
		tarjetasRojas.forEach{pos=>juego.nuevaTarjeta(pos,true)}
		tarjetasAmarillas.forEach{pos=>juego.nuevaTarjeta(pos,false)}
		conos.forEach{pos=>juego.nuevaPared(pos,"cono.png")}
		jugadores.forEach{pos=>juego.nuevaPared(pos,"hinchaRiver.png")}
		estrellasNivel.forEach{pos=>juego.nuevaEstrella(pos)}
		juez.forEach{pos=>juego.nuevoJuezDerechaIzquierda(pos,false)}
		poblas.forEach{pos=>juego.nuevoPobla(pos)}
		dosveintes.forEach{pos=>juego.nuevo225(pos)}
		const opcion2 = new CuadradoNivel(position = game.center().left(2).up(5),image="nivel2.png")
		game.addVisual(opcion2)
		
	}
	method posicion () = game.center().down(3)
}

object nivel3 inherits Nivel{
	override method cargar() {
		super()
		
		const opcion3 = new CuadradoNivel(position = game.center().left(2).up(5),image="nivel3.png")
		game.addVisual(opcion3)
		
		const poblas = [game.origin().up(1).right(4)]
		poblas.forEach{pos=>juego.nuevoPobla(pos)}
		const dosveintes = [game.origin().up(1).right(7)]
		dosveintes.forEach{pos=>juego.nuevo225(pos)}
		const tarjetasAmarillas = [game.origin().up(1).right(8),game.origin().up(1).right(6)]
		tarjetasAmarillas.forEach{pos=>juego.nuevaTarjeta(pos,false)}
	}
	
	method posicion () = game.center().right(5).down(3)
}
