//Importación de archivos:
	import wollok.game.*
	import Link.*
	import Enemigos.*
	import bomba.*

//Clase de equipables:
	class Equipable{
		
		//Atributos:
			
			//Posición por defecto:
				var property position
			
			//Nombre / ID:
				var property nombre
				
			//Duración de ataque:
				var property duracion
			
			//Daño del equipable:
				var property danoCorazon
			
			//Imagen Grafica:
				var property image
		
			//Estado:
				var property equipado = false
			
	}
//Clase que de Espadas que hereda por parte de la clase de Equipable:
	class Espada inherits Equipable{
		
		//Estado para atacar (Cooldown):
			var property estadoUso = false 
		
		//Motor de colisión:
		method position(prediccionPosicion){
			var hayJugador = []
			var hayEnemigo = []
			
			//Colisiones:
			
				//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
					hayJugador = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "Link"})
					hayEnemigo = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "moblin"})
					
				//Jugador:
					if (hayJugador.size() == 0){
						
						position = prediccionPosicion
						
					}
					
				//Enemigo:
					if(hayEnemigo.size() > 0){
						
						hayEnemigo.forEach{visuales =>
							//Recibe daño:
								visuales.corazonesE(visuales.corazonesE() - self.danoCorazon())
								visuales.morir()
							
						}
						
					}
					
		}
		//Atacar:
		method ataque(){
			
			//Primero revisa si es posible atacar:
				if (jugador.puedeAtaque()){
					
					//Se añade el visual, el sprite orientado y la posición de la espada, según la condición:
						if (jugador.orientacion() == jugador.arriba()){
							jugador.espadaObj().image("espada0.png")
							game.addVisual(jugador.espadaObj())
							jugador.espadaObj().position(jugador.position().up(1))
						}
						
						if (jugador.orientacion() == jugador.abajo()){
							jugador.espadaObj().image("espada1.png")
							game.addVisual(jugador.espadaObj())
							jugador.espadaObj().position(jugador.position().down(1))
						
						}
						
						if (jugador.orientacion() == jugador.izquierda()){
							jugador.espadaObj().image("espada2.png")
							game.addVisual(jugador.espadaObj())
						jugador.espadaObj().position(jugador.position().left(1))
						
						}
						
						if (jugador.orientacion() == jugador.derecha()){
							jugador.espadaObj().image("espada3.png")
							game.addVisual(jugador.espadaObj())
						jugador.espadaObj().position(jugador.position().right(1))
						
						}
						
					//Ya atacó, no es posible volver a atacar:
						jugador.puedeAtaque(false)
					//Con la duración de la espada; el estado vuelve a su valor original (Es posible atacar) y se remueve el visual.
						game.schedule(jugador.espadaObj().duracion(), {=> jugador.puedeAtaque(true) ; game.removeVisual(jugador.espadaObj())})
				
				}
						
		}
		
	}
	
//!ADVERTENCIA: CODIGO FEO!

//Clase que de Boomerangs que hereda por parte de la clase de Equipable: 
	class Boomerang inherits Equipable{
		
		//Atributos:
			
			//Rango de alcance del boomerang, 0 a 5 cuadros:
				const rango = [0, 5]
			
			//Contador de sprites:
				var property contadorImg = 0
			
			//Estado para atacar (Cooldown):
				var property estadoUso = false
			
			//Estado para comprobar si tiene que ir o volver, dependiendo del estado se ejecuta uno u otro:
				var property yendo = false
			
			//Se guarda el valor del objeto tipo Position para obtener el limite hacia donde se lance el boomerang:
				var property objetivo = null
			
			//Se guarda la orientación del jugador para luego ser un valor propio del boomerang:
				var property orientacionBoomerang = null
		
		//Motor de colisión:
		method position(prediccionPosicion){
			var hayPared = []
			var hayEnemigo = []
			
			//Colisiones:
			
				//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
					hayPared = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "pared"})
					hayEnemigo = game.getObjectsIn(prediccionPosicion).filter({visual => visual.nombre() == "moblin"})
				//Pared:
					if (hayPared.size() <= 0){
						
						position = prediccionPosicion
						
					}
				
				//Si hay pared; que choque y vuelva:
					else{
						
						yendo = false
						
					}
					
				//Enemigo:
					if(hayEnemigo.size() > 0){
						
						//Choca y vuelve:
							yendo = false
						
						//Por cada enemigo; Recibe daño:
							hayEnemigo.forEach{visuales =>
							
							visuales.corazonesE(visuales.corazonesE() - self.danoCorazon())
							visuales.morir()
							
							}
						
					}
					
		}
		
		//Metodo que comprueba si la flecha pasó los bordes del mapa o está en la misma posición del jugador:
		method comprobar(){
			
			if(self.position().x() > game.width() -1 or //Limite derecha
				self.position().y() > game.height() -1 or //Limite arriba
				self.position().x() < 0 or //Limite izquierda
				self.position().y() < 0){ //Limite abajo
				
				//Si esta en algún borde; se remueve el boomerang:
					self.remover()
				
			}
			//Si está en el mismo lugar que el jugador; se remueve el boomerang:
				if(self.position() == jugador.position()){
					
					self.remover()
					
				}
				
		}
		
		//Método que obtiene el rango del boomerang, obtiene el valor del objeto Position dada la orientación y distancia por parámetro. 
		method obtenerObjetivo(orientacion, distancia){
			
			//En este caso; posición del jugador y un valor numérico:
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
					
			//Retorna nulo para que en todos los casos devuelvan algo:
				return null
		
		}
		
		//Método de animaciones del boomerang:
		method animaciones(){
			
			self.image("boomerang" + contadorImg.toString() + ".png")
			
			contadorImg += 1
			
				if (contadorImg == 4){
					contadorImg = 0
				} 
			
		}
		
		//Metodo que simplemente hace avanzar al boomerang, dependiendo de su orientación:
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
		
		//Es lo mismo que ir(), pero ahora depende de la posición del jugador:
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
		
		//Metodo que remueve el boomerang y sus eventos:
		method remover(){
			//Cambia su estado, se puede usar:
				estadoUso = false
						
			//Se remueve tanto su visual como sus eventos constantes:
				game.removeVisual(self)
				game.removeTickEvent("boomerang")
				game.removeTickEvent("lanzamiento")
			
			//Vuelve a tener la posición del jugador para cuando se lance de nuevo:
				self.position(jugador.position())
			
		}
		
		//Metodo que agrupa todos los metodos anteriormente vistos, esto lo ejecuta cuando el jugador ataca:
		method lanzar(){
			
			//Arranca en la misma posición que el jugador y se añade el visual:
				self.position(jugador.position())
				game.addVisual(self)
			
			//Se guarda el valor del objeto tipo Position, se obtiene dada la orientación del jugador y el limite de rango por parámetro:
				objetivo = self.obtenerObjetivo(jugador.orientacion(), rango.get(1))
			
			//Se cambia el estado yendo y estadoUso; lo que significa que debe IR al objetivo, y ya atacó:
				yendo = true
				estadoUso = true
			
			//Se ejecuta constantemente con la duración del boomerang, si el estado yendo es True; ejecuta el método para avanzar (ir()).
				game.onTick(self.duracion(), "boomerang", {
					
					if(yendo){
						
						self.ir()
						
						//Si ya llegó al objetivo (comparando valores Position) el estado yendo pasa a false:
							if(self.position() == objetivo){
								
								yendo = false
								
							}
						
					}
				//Por último, se va comprobando si el boomerang llegó al borde de la ventana o si llegó al jugador (comprobar()):
					else{
							
						self.comprobar()
						
						//Al tener el estado yendo en false, se ejecuta el caso contrario y usa el metodo para volver (volver()):
						self.volver()
								
						}
					
				})
			//Mientras el método está en marcha, se ejecutan las animaciones:
				game.onTick(60, "lanzamiento",{self.animaciones()})
					
		}
		
	}

//Objetos dada la clase:

	const espada = new Espada(position = game.at(4, 4),
		nombre = "espada", duracion = 200, danoCorazon = 2, image = "espada0.png")
		
		
	const arco = new Equipable(position = game.at(11, 4),
		nombre = "arco", duracion = 100, danoCorazon = 1, image = "arco.png")
		
		
	const boomerang = new Boomerang(position = game.at(8, 7),
		nombre = "boomerang", duracion = 100, danoCorazon = 1, image = "boomerang0.png")
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////