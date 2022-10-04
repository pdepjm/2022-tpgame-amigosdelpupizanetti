import wollok.game.*
import objetos.*
import direcciones.*

object juego {
	
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.agregarObjetos()
		self.nivel1()
		self.configurarTeclas()
		game.boardGround("canchita.jpg")
		game.start()
		
		game.schedule(1000,{game.say(jugador,"Me muevo con WASD")})	
	}
	method hacerConfiguracionInicial() {
		game.title("TombOfTheFulbo")
		game.width(15)
		game.height(15) 
	}
	
	method nivel1(){
		const jugadoresArgentina = [game.origin().up(1).right(3),game.origin().up(12).right(2),game.origin().up(11).right(3),game.origin().up(10).right(1)]
		const jugadoresPolonia = []
		const estrellasNivel = []
		
		jugadoresPolonia.add(game.origin().up(9).right(4))
		jugadoresPolonia.add(game.origin().up(13).right(11))
		jugadoresPolonia.add(game.origin().up(11).right(10))
		
		jugadoresPolonia.add(game.origin().up(3).right(4))
		jugadoresPolonia.add(game.origin().up(2).right(12))
		// en 2:12 segunda estrella
		estrellasNivel.add(game.origin().up(12).right(3))
		estrellasNivel.add(game.origin().up(2).right(11))
		estrellasNivel.add(game.origin().up(3).right(1))
		jugadoresArgentina.forEach{pos=>self.nuevaPared(pos,"mbappe.png")}
		jugadoresPolonia.forEach{pos=>self.nuevaPared(pos,"hinchaRiver.png")}
		estrellasNivel.forEach{pos=>self.nuevaEstrella(pos)}
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
