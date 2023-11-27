//Importación de archivos:
	import wollok.game.*
	import Link.*
	import consumibles.*

//Clase de Enemigos:
	class Enemigo {
		
		//Atributos:
		
			//Corazones de enemigos:
				var property corazonesE
		
			//Posición por defecto:
				var property position
			
			//Nombre / ID:
				var property nombre
		
			//Daño al contacto o a distancia:
				var property dano
		
			//Imagen Grafica:
				var property image
				
			//Orientacion del enemigo:
				var property orientacion = 0
			
				//Direcciones:
					var property arriba = 0
					var property abajo = 1
					var property izquierda = 2
					var property derecha = 3
				
		//Metodo avanzar del enemigo, persigue al jugador:
			method avanzar(posicionLink){
				
				const jugadorX = posicionLink.x()
				const jugadorY = posicionLink.y()
				
				if(jugadorX < position.x()){
					self.position(position.left(1))
					self.orientacion(2)
				}
				
				if(jugadorX > position.x()){
					self.position(position.right(1))
					self.orientacion(3)
				}
				
				if(jugadorY < position.y()){
					self.position(position.down(1))
					self.orientacion(1)
					
				}
				
				if(jugadorY > position.y()){
					self.position(position.up(1))
					self.orientacion(0)
					
				}
				//Cambio de sprites:
					self.giro()
			}
			
			//Motor de colisión:
			method position(prediccionPosicion){
				var area = []
				var hayJugador = []
				
				//Colisiones:
				
					//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
						area = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "pared" or visual.nombre() == "moblin"})
						hayJugador = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "Link"})
						
					//Si hay paredes o el mismo enemigo, el enemigo no puede atravesarlo. Sino, que solo pase a la posición predecida:
						if (area.size() == 0){
							
							position = prediccionPosicion
							
						}
					
					//Jugador:	
						if (hayJugador.size() > 0){
							
							//Recibe daño:
								jugador.recibirDano(self.dano())
								jugador.morir()
							
						}
						
			}
			
			//Metodo que cambia los sprites, según su orientación:
			method giro(){
		
				if (orientacion == arriba){
					image = "moblin1.png"
				}
				
				if (orientacion == abajo){
					image = "moblin0.png"
				}
				
				if (orientacion == izquierda){
					image = "moblin3.png"
				}
				
				if (orientacion == derecha){
					image = "moblin2.png"
				}
			}
			
			//Metodo morir:
			method morir(){
				
				//Si la vida del enemigo llega a 0, se remueve el visual y por ende deja de seguir al jugador:
					if(corazonesE <= 0){
						corazonesE = 0
						game.removeVisual(self)
						game.removeTickEvent("seguir")
						
					}
				
			}
				
	}