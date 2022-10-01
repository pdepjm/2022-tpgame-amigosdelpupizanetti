import wollok.game.*

object jugador {

	var enMovimiento = false
	var position = game.center()
	var anterior
	
	method quieto(){
		enMovimiento = false
		game.removeTickEvent("moverseA")
		position = anterior
		
	}
	
	method image() { return "mario.png"}
	method position() { return position}
	
	method movimiento(dir){
		if(enMovimiento.negate()){
			enMovimiento = true
			game.onTick(50,"moverseA",{self.moverA(dir)})
		}
	}
	method moverA(dir) {
		anterior = position
		position = dir.siguientePosicion(position) 
	}

}

class Pared {
	var property position
	method image() {return "pared.png"}
}
