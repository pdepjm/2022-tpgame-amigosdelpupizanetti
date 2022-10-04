import wollok.game.*
import juego.*

object jugador {

	var enMovimiento = false
	var position = game.origin().up(1).right(1)
	var anterior
	var image = "11.png"
	var cantEstrellas = 0
	
	method image() { return image}
	method position() { return position}
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
	
	
	method modificarMueve() {
		enMovimiento = enMovimiento.negate()
	}
	
	method chocar(chocado){
		chocado.choque(self)
	}
	
	method movimiento(dir){
        if(enMovimiento.negate()){
            self.modificarMueve()
            dir.restart()
            game.onTick(50,"moverseA",{self.moverA(dir)})
            game.onTick(50,"animacion",{self.animacion(dir)})
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
	method image() {return "estrella.png"}
	method choque(pj) {
		pj.sumarEstrella()
		
		game.removeVisual(self)
	}
}


class Pared {
	var property position
	var property image
	method image() {return image}
	method choque(pj){
		pj.modificarMueve()
		game.removeTickEvent("animacion")
		game.removeTickEvent("moverseA")
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
	method image() {return "copa.png"}
}

