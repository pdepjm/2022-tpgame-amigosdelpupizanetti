

object arriba {
    var numero
	method restart() {numero=20}
    method siguientePosicion(pos) = pos.up(1)
    method findeanimacion(){
        if (numero==24) numero=21
    }
    method animacion(persona){
        numero+=1
        self.findeanimacion() 
        return numero.toString()+".png"
    }
}
//
object derecha {
    var numero
    method restart() {numero=40}
    method siguientePosicion(pos) = pos.right(1)
    method findeanimacion(){
        if (numero==44) numero=41
    }
    method animacion(persona){
        numero+=1
        self.findeanimacion()
        return numero.toString()+".png"
    }
}

object izquierda {
    var numero
    method restart() {numero=30}
    method siguientePosicion(pos) = pos.left(1)
    method findeanimacion(){
        if (numero==34) numero=31
    }
    method animacion(persona){
        numero+=1
        self.findeanimacion() 
        return numero.toString()+".png"
    }
}

object abajo {
    var numero
    method restart() {numero=10}
    method findeanimacion(){
        if (numero==14) numero=11
    }
    method animacion(persona){
        numero+=1
        self.findeanimacion() 
        return numero.toString()+".png"
    }
    method siguientePosicion(pos) = pos.down(1)
}