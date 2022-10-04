import wollok.game.*
import objetos.*
import direcciones.*
import niveles.*
object juego {
	
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.agregarObjetos()
		primerPartido.cargar()
		self.configurarTeclas()
		game.boardGround("canchita.jpg")
		game.start()
		
		game.schedule(1000,{game.say(jugador,"Me muevo con WASD")})	
		game.sound("betterTogether.mp3").play()
		//game.sound("betterTogether.mp3").volume(0.1)
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
	}

	method nuevaPared(posicion,imagen){
		const pared = new Pared(position = posicion,image=imagen)
		game.addVisual(pared)
		game.onCollideDo(pared,{personaje=>personaje.chocar(pared)})
	}
	
	method nuevaEstrella(posicion){
		const estrella = new Estrella(position = posicion)
		game.addVisual(estrella)
		game.onCollideDo(estrella,{personaje=>personaje.chocar(estrella)})
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
