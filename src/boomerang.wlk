	import wollok.game.*
	import Link.*
	import paredes.*
	import consumibles.*
	import equipables.*
	import Enemigos.*
	
class Boomerang inherits Equipable{
	
	const rango = [0, 5]
	
	var property contadorImg = 0
	
	var property estadoUso = false
	
	var property yendo = false
	
	var property objetivo = null
	
	var property orientacionBoomerang = null
	
	//Motor de colisión:
	method position(prediccionPosicion){
		var hayPared = []
		var hayEnemigo = []
		
		//Colisiones:
		
			//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
				hayPared = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "pared"})
				hayEnemigo = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "moblin"})
			//Si no se detecta ninguna pared con la colección, simplemente pase a la posición predecida:
				if (hayPared.size() <= 0){
					
					position = prediccionPosicion
					
				}
				
				else{
					
					yendo = false
					
				}
				
				if(hayEnemigo.size() > 0){
					
					yendo = false
					
					hayEnemigo.forEach{visuales =>
						
						visuales.corazonesE(visuales.corazonesE() - self.danoCorazon())
						visuales.morir()
						
					}
					
				}
				
				
	}
	
	method comprobar(){
		
		if(self.position().x() > game.width() -1 or //Limite derecha
			self.position().y() > game.height() -1 or //Limite arriba
			self.position().x() < 0 or //Limite izquierda
			self.position().y() < 0){ //Limite abajo
			
			self.remover()
			
			}
			
		if(self.position() == jugador.position()){
			
			self.remover()
			
		}
			
	}
	
	
	method obtenerObjetivo(orientacion, distancia){
		
		orientacionBoomerang = orientacion
		
		if (orientacion == jugador.derecha()){
				return jugador.position().right(distancia)
			}
			
		if (orientacion == jugador.izquierda()){
				return jugador.position().left(distancia)
			}
			
		if (orientacion == jugador.arriba()){
				return jugador.position().up(distancia)
			}
			
		if (orientacion == jugador.abajo()){
				return jugador.position().down(distancia)
			}
			
		return null
	
	}
	
	method animaciones(){
		
		self.image("boomerang" + contadorImg.toString() + ".png")
		
		contadorImg += 1
		
			if (contadorImg == 4){
				contadorImg = 0
			} 
		
	}
	
	method ir(){

		if (orientacionBoomerang == jugador.derecha()){
				self.position(self.position().right(1))
			}
			
		if (orientacionBoomerang == jugador.izquierda()){
				self.position(self.position().left(1))
			}
			
		if (orientacionBoomerang == jugador.arriba()){
				self.position(self.position().up(1))
			}
			
		if (orientacionBoomerang == jugador.abajo()){
				self.position(self.position().down(1))
			}
					
	}
	
	method volver(){
		
		const jugadorX = jugador.position().x()
		const jugadorY = jugador.position().y()
		
		if(jugadorX < position.x()){
			self.position(position.left(1))
			
		}
		
		if(jugadorX > position.x()){
			self.position(position.right(1))
			
		}
		
		if(jugadorY < position.y()){
			self.position(position.down(1))
			
		}
		
		if(jugadorY > position.y()){
			self.position(position.up(1))
			
		}
		
	}
	
	method remover(){
		estadoUso = false
					
		game.removeVisual(self)
		game.removeTickEvent("boomerang")
		game.removeTickEvent("lanzamiento")
		
	
		self.position(jugador.position())
		
	}
	
	method lanzar(){
		self.position(jugador.position())
		game.addVisual(self)
		objetivo = self.obtenerObjetivo(jugador.orientacion(), rango.get(1))
		
		yendo = true
		estadoUso = true
		game.onTick(self.duracion(), "boomerang", {
			
			if(yendo){
				
				self.ir()
				
				if(self.position() == objetivo){
					
					yendo = false
					
					
				}
				
			}
			
			else{
				
				self.comprobar()
				
				self.volver()
					
			}
			
		})
		
		game.onTick(60, "lanzamiento",{self.animaciones()})
				
	}
	
}
