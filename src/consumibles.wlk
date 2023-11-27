//Importación de archivos:
	import wollok.game.*
	import Link.*

//Clase de consumibles:
	class Consumible {
		
		//Atributos:
			
			//Posición por defecto:
				var property position
			
			//Nombre / ID:
				var property nombre
				
			//Valor del consumible:
				var property valor
			
			//Cantidad limite para el inventario:
				var property limite
			
			//Imagen Grafica:
				var property image
		
		//Animaciones:
		
			//Corazón
				method rupiaAnimacion(){
					
					if (image == "rupia0.png"){
						image = "rupia1.png"	
					}
					
					else{
						image = "rupia0.png"			
					}
				}
			
			//Rupia
				method corazonAnimacion(){
					
					if (image == "corazon0.png"){
						image = "corazon1.png"	
					}
					
					else{
						image = "corazon0.png"			
					}
				}
			
	}

//Clase que de flechas que hereda por parte de la clase de Consumible:
	class Flecha inherits Consumible{
		
		//Atributos:
		
			//Estado de flecha si se puede lanzar o no:
				var property flecha_lanzada = false
			
			//Velocidad de la flecha (Ms):
				const velocidad = 60
			
			//Orientacion de la flecha:
				var property orientacion = 0
			
		//Metodo que remueve la flecha del tablero:
			method remover(){
				
				//Se le avisa al estado que la flecha fue disparada, por ende vuelve a su estado por defecto:
					flecha_lanzada = false
					
				//Se remueve el visual junto con su avance constante:	
					game.removeVisual(self)
					game.removeTickEvent("avanzar")
					
				//La posición regresa a el jugador:
					self.position(jugador.position())
			}
			
		//Metodo que comprueba si la flecha pasó los bordes del mapa:
			method comprobar(){
				
				if(self.position().x() > game.width() -1 or //Limite derecha
					self.position().y() > game.height() -1 or //Limite arriba
					self.position().x() < 0 or //Limite izquierda
					self.position().y() < 0){ //Limite abajo
						
					//Si la flecha se está por pasar del limite, se remueve:
						self.remover()
				}
				
			}
			
		//Metodo para iniciar el comportamiento de la flecha. Dada la orientación y posición del jugador como parametro:
			method iniciar(direccion, posicion){
				
				//Se añade la visual:
					game.addVisual(self)
				
				//La flecha empieza por la posición del jugador. De ahí, también se define la orientación a donde vaya:
					self.orientacion(direccion)
					self.position(posicion)
				
				//Cambio de Sprites:
					if (orientacion == jugador.derecha()){
						self.image("flechaD.png")
					}
					
					if (orientacion == jugador.izquierda()){
						self.image("flechaIZ.png")
					}
					
					if (orientacion == jugador.arriba()){
						self.image("flechaAR.png")
					}
					
					if (orientacion == jugador.abajo()){
						self.image("flechaAB.png")
					}
					
					
				
				//Motor de colisión:
					//Con onCollideDo se coloca un visual como parametro y recorre las posiciones de los objetos en el tablero para luego compararse entre sí:
						game.onCollideDo(self, {visuales =>
							
							//Enemigos:
								if(visuales.nombre() == "moblin"){
									
									//Recibe Daño:
										visuales.corazonesE(visuales.corazonesE() - 1)
										self.remover()
									
								}
							
							//Paredes
								if(visuales.nombre() == "pared"){
									
									//Choca y se rompe la flecha:
										self.remover()
										
								}
							
						})
				
			}
				
		//Metodo de avance de la flecha dependiendo su orientación:
			method avanzar(){
				
				if (orientacion == jugador.derecha()){
					self.position(position.right(1))
				}
				
				if (orientacion == jugador.izquierda()){
					self.position(position.left(1))
				}
				
				if (orientacion == jugador.arriba()){
					self.position(position.up(1))
				}
				
				if (orientacion == jugador.abajo()){
					self.position(position.down(1))
				}
				
			}
			
		//Metodo para lanzar flechas, recibe por parametro la orientación del jugador junto con su posición. En base a esto se ejecuta:
			method lanzarFlecha(direccion, posicion){
				
				//Revisa el estado de la flecha:
					if(not flecha_lanzada){
						
						//Si la flecha fue lanzada, se inicia el comportamiento de la flecha en sí. Como parámetros la orientación del jugador junto con su posición como en el mismo método:
							self.iniciar(direccion, posicion)
							
						//Se ejecuta la acción avanzar constantemente, mientras que a la vez también se comprueba la posición de la flecha en conjunto.
							game.onTick(velocidad, "avanzar", { self.avanzar() ; self.comprobar()})
							
						//Se le avisa al estado que la flecha fue lanzada:
							flecha_lanzada = true
						
					}
					
			}
		
	}
	
//Objeto dada la clase:
	const flecha = new Flecha(position = jugador.position(), nombre = "flecha", valor = 0, limite = 10, image = "flechaAR.png")
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////