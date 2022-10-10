import wollok.game.*
import objetos.*
import direcciones.*
import niveles.*
object juego {
	const musicaDeFondo = game.sound("betterTogether.mp3")
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.configurarTeclas()
		game.start()
		musicaDeFondo.play()
		musicaDeFondo.volume(0.02)
		self.cargarMenu()

	}
	
	method cargarMenu(){
		const copita = new CuadradoNivel(position = game.center().left(4).up(2),image="copitapixel.png")
		game.addVisual(copita) 
		const titulo = new CuadradoNivel(position = game.center().right(1).up(4),image="titulo.png")
		game.addVisual(titulo) 
		const opcion1 = new CuadradoNivel(position = game.center().left(5),image="nivel1.png")
		game.addVisual(opcion1)
		const opcion2 = new CuadradoNivel(position = game.center(),image="nivel2.png")
		game.addVisual(opcion2)
		const opcion3 = new CuadradoNivel(position = game.center().right(5),image="nivel3.png")
		game.addVisual(opcion3)
		game.addVisual(flecha)
		
	}

	
	method hacerConfiguracionInicial() {
		game.title("Qatar2022Run")
		game.width(15)
		game.height(15) 
		game.boardGround("canchita.jpg")
	}
	
	method agregarParedes() {
		
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
		
	}
	
	method teclasMenu(){
		
	}
	
	method configurarTeclas() {
		keyboard.w().onPressDo({jugador.movimiento(arriba)}) 
		keyboard.d().onPressDo({jugador.movimiento(derecha)})
		keyboard.s().onPressDo({jugador.movimiento(abajo)})
		keyboard.a().onPressDo({jugador.movimiento(izquierda)})
		keyboard.enter().onPressDo({flecha.enter()})
		
		keyboard.right().onPressDo({flecha.cambiarSeleccion(1)})
		keyboard.left().onPressDo({flecha.cambiarSeleccion(2)})

	}
}



