import wollok.game.*
import objetos.*
import direcciones.*
import niveles.*
object juego {
	const musicaDeFondo = game.sound("betterTogether.mp3")
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.cargarMenu()
		game.start()
		musicaDeFondo.play()
		musicaDeFondo.volume(0.02)
		
	}
	method volverAlMenu(imagen) {
		game.clear()
		const titulito = new CuadradoNivel(position = game.center().left(1),image=imagen)
		game.schedule(100,{=>game.addVisual(titulito)}) 
		game.schedule(2000,{=>self.cargarMenu()})
		
	}
	method perdiste(tipo){
		game.schedule(200,{=>game.say(jugador,"Perdimos el partido")})
		if (tipo) {
		
		game.schedule(3000,{=>self.volverAlMenu("perdiste.png")})
		
		} else {
			game.schedule(3000,{=>self.volverAlMenu("moriste.png")})
		}
		
		
		
	}
	method ganaste(){

		game.schedule(200,{=>game.say(jugador,"Ganamos el partido")})
		
		game.schedule(3000,{=>self.volverAlMenu("ganaste.png")})
		
	}
	method cargarMenu(){
		keyboard.enter().onPressDo({flecha.enter()})
		keyboard.d().onPressDo({flecha.cambiarSeleccion(1)})
		keyboard.a().onPressDo({flecha.cambiarSeleccion(2)})
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
		game.addVisual(pressStart)
		pressStart.cambiarFoto()
	}

	
	method hacerConfiguracionInicial() {
		game.title("Qatar2022Run")
		game.width(15)
		game.height(15) 
		game.boardGround("canchita.jpg")
	}
	
	method agregarParedes() {
		const paredes = [game.origin()]
		14.times({ i => paredes.add(game.origin().up(i))})
		14.times({ i => paredes.add(game.origin().right(i))})
		13.times({ i => paredes.add(game.origin().up(14).right(i))})
		14.times({ i => paredes.add(game.origin().up(i).right(14))})
		paredes.forEach{pos=>self.nuevaPared(pos,"nada.png")}
		game.addVisual(contador)
		
	}
	
	method agregarJugador() {
		game.addVisual(jugador) 
		game.onCollideDo(jugador,{personaje=>personaje.choque(jugador)})
	}

	method nuevaPared(posicion,imagen){
		const pared = new Pared(position = posicion,image=imagen)
		game.addVisual(pared)
	}
	
	method nuevoPobla(posicion){
		const poblaPeres = new PoblaPeres(position = posicion)
		game.addVisual(poblaPeres)
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
	method nuevo225(posicion){
		const un225 = new Un225(position = posicion)
		game.addVisual(un225)
	}
	method nuevoJuezRandom(posicion,color){
		const juez = new JuezRandom(position = posicion,roja = color)
		game.addVisual(juez)
		game.onCollideDo(juez,{personaje=>personaje.choque(juez)})
		juez.movimiento()
	}
	method nuevoJuezArribaAbajo(posicion,color){
		const juez = new JuezArribaAbajo(position = posicion,roja = color)
		game.addVisual(juez)
		game.onCollideDo(juez,{personaje=>personaje.choque(juez)})
		juez.movimiento()
	}
	method nuevoJuezDerechaIzquierda(posicion,color){
		const juez = new JuezDerechaIzquierda(position = posicion,roja = color)
		game.addVisual(juez)
		game.onCollideDo(juez,{personaje=>personaje.choque(juez)})
		juez.movimiento()
	}
	method aparecerCopa() {
		
		game.addVisual(copa)
		
	}
	

	
}




