import wollok.game.*
import juego.*
import direcciones.*
import niveles.*

object jugador {
	var amarillas =0
	var enMovimiento = false
	var property position = game.origin().up(1).right(1)
	var anterior
	var property image = "11.png"
	var cantEstrellas = 0
	var objetivo
	method ponerObjetivo(nuevoObjetivo){
		objetivo=nuevoObjetivo
	}
	
	method choque(x){
		
	}
	method setearBase(){
		self.modificarPosicion(game.origin().up(1).right(1))
		amarillas=0
		cantEstrellas=0
	}
	method es(pj) = pj==self
	
	method sumarTarjeta(){
		amarillas=amarillas+1
	}
	method resetarAmarillas(){
		amarillas=0
	}
	method cuantasAmarillas() = amarillas
	
	method anterior() = anterior
	
	method sumarEstrella() {
		cantEstrellas = cantEstrellas + 1
		if (cantEstrellas ==objetivo){
			juego.aparecerCopa()
		}
	}
	method modificarPosicion(pos) {
		position = pos
	}
	
	method parar(){
		game.removeTickEvent("animacion")
		game.removeTickEvent("moverseA")
		self.modificarMueve()
	}
	method modificarMueve() {
	
		enMovimiento = enMovimiento.negate()
	}
	

	method movimiento(dir){
        if(enMovimiento.negate()){
            self.modificarMueve()
            dir.restart()
            game.onTick(100,"moverseA",{self.moverA(dir)})
            game.onTick(100,"animacion",{self.animacion(dir)})
        }
	}
	
	method animacion(dir){
        image = dir.animacion(self)
    }
    
	method moverA(dir) {
		anterior = position
		position = dir.siguientePosicion(position) 
	}

}

class Estrella{
	var property position
	const sonicRing = game.sound("sonicRing.mp3")
	method image() {return "estrella.png"}
	method choque(pj) {
		if(jugador.es(pj)){
		pj.sumarEstrella()
		sonicRing.play()
		sonicRing.volume(0.2)
		game.removeVisual(self)
		}
	}
}


class Pared {
	var property position
	var property image
	method choque(pj){
		pj.parar()
		pj.modificarPosicion(pj.anterior())
	}
	
}

object copa { 
	var property position = game.at(1,1)
	method tocarPosicion(pos) {
		position = pos
	}
	method choque(pj){
		if(jugador.es(pj)){
			juego.ganaste()
		}
	}
	method image() =  "copa.png"
}


class Tarjeta {
	var property position
	var property roja
	method choque(pj){
		if(jugador.es(pj)){
		if((roja|| pj.cuantasAmarillas()==1) && jugador.es(pj)) juego.perdiste(true)
		else{
				game.removeVisual(self)
				pj.sumarTarjeta()
				game.say(jugador,"Tengo una amarilla")
				game.sound("silbato.mp3").play()
				}
		} 
		
	}

	
	
	method image() = if(roja) "roja.png" else "amarilla.png"	
}

class JuezRandom inherits Tarjeta {
	
	var property anterior = game.center()
	const movimientos= [izquierda,derecha,abajo,arriba] 
	
	method modificarPosicion(pos) {
		position = pos
	}
	
	method parar(){
	game.removeTickEvent("moverJuez")
	self.movimiento()
	}
	method movimiento(){
		const dir = movimientos.get(0.randomUpTo(4).truncate(0))
        game.onTick(150,"moverJuez",{self.moverA(dir)})
	}

	method moverA(dir) {
		anterior = position
		position = dir.siguientePosicion(position) 
	}

	 override method image() = if(roja) "arbitroRoja.png" else "arbitroAmarilla.png"
}

class JuezArribaAbajo inherits Tarjeta {
	
	var property anterior = game.center()
	const movimientos= [abajo,arriba] 
	
	method modificarPosicion(pos) {
		position = pos
	}
	
	method parar(){
	game.removeTickEvent("moverJuez")
	self.movimiento()
	}
	method movimiento(){
		const dir = movimientos.get(0.randomUpTo(2).truncate(0))
        game.onTick(150,"moverJuez",{self.moverA(dir)})
	}

	method moverA(dir) {
		anterior = position
		position = dir.siguientePosicion(position) 
	}

	 override method image() = if(roja) "arbitroRoja.png" else "arbitroAmarilla.png"
}

class JuezDerechaIzquierda inherits Tarjeta {
	
	var property anterior = game.center()
	const movimientos= [izquierda,derecha] 
	
	method modificarPosicion(pos) {
		position = pos
	}
	
	method parar(){
	game.removeTickEvent("moverJuez")
	self.movimiento()
	}
	method movimiento(){
		const dir = movimientos.get(0.randomUpTo(2).truncate(0))
        game.onTick(150,"moverJuez",{self.moverA(dir)})
	}

	method moverA(dir) {
		anterior = position
		position = dir.siguientePosicion(position) 
	}

	 override method image() = if(roja) "arbitroRoja.png" else "arbitroAmarilla.png"
}

class CuadradoNivel{
	var property image
	var property position
	
}

object pressStart{ 
	var property image = "pressEnter.png"
	var property position = game.center().down(5)
	method cambiarFoto() {
		game.onTick(500,"cambiarFotito",{self.logica()})
	}
	method logica() {
		if(game.hasVisual(self)) game.removeVisual(self) else game.addVisual(self)
	}
		
	
}

class PoblaPeres{ 
	var property image = "poblaPeres.png"
	var property position = game.center().down(5)
	var tilteado = false 
	method choque(pj) {
		if (tilteado) {
			if(jugador.es(pj)) {
				juego.perdiste(false)
			} else {
				game.removeVisual(pj) 
			}
		} 
		else {
		image = "poblaPeresEnojado.png"
		game.say(self,"¡ESTOY ENOJADO!")
		 tilteado = true
		 }
	}
	
}
class Un225{ 
	var property image = "dosveinte.png"
	var property position 
	
	method choque(pj) {
		if  (jugador.es(pj)){
			jugador.resetarAmarillas()
		 	game.say(jugador,"Tengo 0 amarillas")
		 	game.removeVisual(self)
		} 
			
	}
	
}

object contador {
	method position() = game.at(11,12)
	method image() = "tarjeta" + jugador.cuantasAmarillas() + ".png"
}

object flecha{
	
	var property position = game.center().left(5).down(3)
	
	var numPosition = 0
	
	const niveles = [nivel1, nivel2, nivel3]
	method image() = "flecha.png"
	method cambiarSeleccion(mov){
		if(mov == 1){
			numPosition = 2.min(numPosition+1)
			position = niveles.get(numPosition).posicion()
		}else{
			numPosition = 0.max(numPosition-1)
			position = niveles.get(numPosition).posicion()
		}
		
		}
		
	method enter(){
		game.clear()
		niveles.get(numPosition).cargar()
		
	}

}



