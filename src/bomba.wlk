	import wollok.game.*
	import Link.*
	import paredes.*
	import consumibles.*
	import equipables.*
	import Enemigos.*

//Clase Humo para la explosión de la bomba
	class Humo{
		
		//Nombre / ID:
			var property nombre
		
		//Posición por defecto:
			var property position
		
		//Imagen Grafica:
			var property image
		
		//Contador de sprites:
			var property contadorImg = 0
		
		//Este metodo se ejecuta automaticamente por Wollok, por lo que es una animación infinita sin necesidad de llamarlo:
			method image(){
				
				contadorImg += 1
				
				if (contadorImg == 3){
					
					contadorImg = 0
				
				}
				
				return "humo" + contadorImg.toString() + ".png"
				
			}
			
	}
	
	

//Clase de Bombas que hereda por parte de la clase de Equipable. Aunque es un hibrido entre consumible y equipable:
	class Bomba inherits Equipable{
		
		//Estado para atacar (Cooldown):
			var property estadoUso = false
		
		//Valor de inventario:
			var property valor = 1
		
		//Limite de inventario:
			var property limite = 10
		
		//Rango de explosión:
			var property rango = (0.. 2)
		
		//Colección que recibe una matriz como rango de explosión final:
			var property rangoObtenido = []
		
		//Metodo para iniciar el comportamiento de la bomba:
		method iniciar(){
			
			//Se cambia el estadoUso a True, ya dejó la bomba. En la misma posición del jugador se añade el visual y obtiene su rango de explosión:
				estadoUso = true
				
				self.position(jugador.position())
				
				game.addVisual(self)
				
				self.obtenerRango()
			
		}
		
		//Metodo que deja la bomba. Recibe la posición del jugador y su orientación como parámetro:
		method tirar(posicionJugador, orientacion){
			
			//La posición de la bomba colocada es la misma en la que está el jugador:
				self.position(posicionJugador)
				
				//En base a eso, dependiendo de la orientación se coloca la bomba:
					if (orientacion == jugador.derecha()){
						
							self.position(self.position().right(1))
							
					}
						
					if (orientacion == jugador.izquierda()){
						
							self.position(self.position().left(1))
							
					}
						
					if (orientacion == jugador.arriba()){
						
							self.position(self.position().up(1))
							
					}
						
					if (orientacion == jugador.abajo()){
						
							self.position(self.position().down(1))
							
					}
			
		}
		//Metodo que obtiene el rango de explosión. Crea una matríz:
		method obtenerRango(){
			
			//Posiciones X , Y de la bomba colocada:
				var x = position.x() - 1
				var y = position.y() - 1
			
			//Recorre los valores numéricos del rango, en base a eso; crea una matriz:
				rango.forEach{ i =>
					
					rango.forEach{ j =>
						
						//Se va llenando la colección con las referencias Position. Creando así una matriz de posiciones:
							rangoObtenido.add(game.at(x + j, y + i))
						
					}
					
				}
				
		}
		//Metodo que hace explotar la bomba. Oblitera objetos en su rango:
		method explotar(){
			
			//Colección para la colocación de humos más adelante
				var humos = []
			
			//Recorre el las posiciones obtenidas por la matriz:
				rangoObtenido.forEach{ posicion =>
					
					//Por cada objeto encontrado...
						game.getObjectsIn(posicion).forEach{ visual =>
							
						//Pared:
							if(visual.nombre() == "pared"){
								
								//Si la explosión alcanza una pared, que esta se destruya:
									game.removeVisual(visual)
								
							}
						
						//Enemigo:
							else if(visual.nombre() == "moblin"){
								
								//Si la explosión alcanza a los enemigos, estos reciben un daño crítico. Haciendo que mueran al instante:
									visual.corazonesE(visual.corazonesE() - self.danoCorazon())
									visual.morir()
								
							}
							
						//Jugador:
							else if(visual.nombre() == "Link"){
								
								//Si la explosión alcanza al jugador, este recibe un daño crítico, así mueriendo. En el gameplay hay que usar las bombas con cuidado: 
									visual.recibirDano(self.danoCorazon())
									visual.morir()
								
							}
							
						}
					
				}
			
			//Al explotar, se remueve la visual:
				game.removeVisual(self)
			
			//Para el humo se recorren de nuevo los valores Position:
				rangoObtenido.forEach{ posicionHumo =>
						
						//Se generan las constantes dada la clase:
							const humo = new Humo(nombre = "humo", position = posicionHumo, image = "humo0.png")
						
						//Se añade la visual y se llena la colección con los humos generados (Linea 175):
							game.addVisual(humo)
							humos.add(humo)
						
				}
			
			
			//Se establece una duración donde se remueven los humos, por último; Se reinician las colecciones para una nueva explosión: 
				game.schedule(200, {humos.forEach{visual => game.removeVisual(visual)} ; humos = [] ; rangoObtenido = []})
				
		}
			
	}
		

