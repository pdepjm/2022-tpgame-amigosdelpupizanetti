import wollok.game.*
import juego.*
import direcciones.*

object jugador {
	var amarillas =0
	var enMovimiento = false
	var property position = game.origin().up(1).right(1)
	var anterior
	var property image = "11.png"
	var cantEstrellas = 0
	
	method sumarTarjeta(){
		amarillas=amarillas+1
	}
	method cuantasAmarillas() = amarillas
	
	method anterior() = anterior
	
	method sumarEstrella() {
		cantEstrellas = cantEstrellas + 1
		if (cantEstrellas ==3){
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
		if(pj==jugador){
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
	var property position
	method tocarPosicion(pos) {
		position = pos
	}
	method choque(pj){
		game.allVisuals().forEach{objeto=>game.removeVisual(objeto)}
		juego.agregarObjetos()
	}
	method image() =  "copa.png"
}

class Tarjeta {
	var property position
	var property roja
	method choque(pj){
		if(roja|| pj.cuantasAmarillas()==1) game.allVisuals().forEach{objeto=>game.removeVisual(objeto)} else pj.sumarTarjeta()
		game.removeVisual(self)
	}
	method image() = if(roja) "roja.png" else "amarilla.png"	
}
class Juez inherits Tarjeta {
	
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
