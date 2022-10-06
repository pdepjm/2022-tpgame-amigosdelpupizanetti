import wollok.game.*
import objetos.*
import direcciones.*
import niveles.*
object juego {
	const musicaDeFondo = game.sound("betterTogether.mp3")
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.agregarObjetos()
		self.configurarTeclas()
		game.boardGround("canchita.jpg")
		game.start()
		primerPartido.cargar()
		game.schedule(1000,{game.say(jugador,"Me muevo con WASD")})	
		musicaDeFondo.play()
		musicaDeFondo.volume(0.02)
	}
	method hacerConfiguracionInicial() {
		game.title("Qatar2022Run")
		game.width(15)
		game.height(15) 
	}
	

	method agregarObjetos() {
		self.agregarJugador()
		//limites
		const paredes = [game.origin()]
		14.times({ i => paredes.add(game.origin().up(i))})
		14.times({ i => paredes.add(game.origin().right(i))})
		13.times({ i => paredes.add(game.origin().up(14).right(i))})
		14.times({ i => paredes.add(game.origin().up(i).right(14))})
		paredes.forEach{pos=>self.nuevaPared(pos,"nada.png")}
	}
	method agregarJugador() {
		game.addVisual(jugador) 
		game.onCollideDo(jugador,{personaje=>personaje.choque(jugador)})
	}

	method nuevaPared(posicion,imagen){
		const pared = new Pared(position = posicion,image=imagen)
		game.addVisual(pared)
	}
	
	method nuevaEstrella(posicion){
		const estrella = new Estrella(position = posicion)
		game.addVisual(estrella)
	}
	//
	method nuevaTarjeta(posicion,color){
		const tarjeta = new Tarjeta(position = posicion,roja = color)
		game.addVisual(tarjeta)
	}
	method nuevoJuez(posicion,color){
		const juez = new Juez(position = posicion,roja = color)
		game.addVisual(juez)
		game.onCollideDo(juez,{personaje=>personaje.choque(juez)})
		juez.movimiento()
	}
	method aparecerCopa() {
		
		copa.tocarPosicion(game.origin().up(1).right(4))
		game.addVisual(copa)
		game.onCollideDo(copa,{personaje=>personaje.chocar(copa)})
	}
	
	method configurarTeclas() {
		keyboard.w().onPressDo({jugador.movimiento(arriba)}) 
		keyboard.d().onPressDo({jugador.movimiento(derecha)})
		keyboard.s().onPressDo({jugador.movimiento(abajo)})
		keyboard.a().onPressDo({jugador.movimiento(izquierda)})

	}
}
