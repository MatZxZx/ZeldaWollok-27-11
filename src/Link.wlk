//Importación de archivos:
	import wollok.game.*
	import consumibles.*
	import equipables.*
	import paredes.*
	import mapas.*
	import bomba.*

//Objeto del jugador:
	object jugador {
		
		//Atributos:
		
			//Posición por defecto:
			var property position = game.at(8, 4)
			
			//Nombre:
				var property nombre = "Link"
				
			//Inventario de Items Consumibles:
				var property corazonesL = 3
				var property bombas = 0
				var property rupias = 0
				var property espadaObj = null
				var property arcoObj = null
				var property boomerangObj = null
				var property bombaObj = null
				
			//Inventario de Items:
				var property equipadoAhora = "nada"
				var property objEquipadoAhora = "nada"
				
			//Estados:
				var property puedeAtaque = true
				var property puedeUsarItem = true
				
			//Orientacion del jugador:
				var property orientacion = 0
			
				//Direcciones:
					var property arriba = 0
					var property abajo = 1
					var property izquierda = 2
					var property derecha = 3
			
			//Imagen Grafica:
				var property image = "jugador.png"
		
		//Comportamientos:
		
			//Dañarse:
			method recibirDano(dano){
				
				corazonesL = (corazonesL - dano)
				
				if (corazonesL <= 0){
					
					corazonesL = 0
					return corazonesL
					
				}
				
				return corazonesL
				
			}
		
			//Morir:
			method morir(){
				
				if (self.corazonesL() <= 0){
					game.stop()			
									
				}
				
			}
			
			//Motor de colisión:
			method position(prediccionPosicion){
				var area = []
				
				//Colisiones:
				
					//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
						area = game.getObjectsIn(prediccionPosicion).filter({ visual =>
							visual.nombre() == "pared"
						})
						
					//Si no se detecta ninguna pared con la colección, simplemente pase a la posición predecida:
						if (area.size() == 0){
							position = prediccionPosicion
						}
				
			} 
			
			
			//Orientación al caminar:
			method giro(){
		
				if (orientacion == arriba){
					image = "jugador1.png"
				}
				
				if (orientacion == abajo){
					image = "jugador.png"
				}
				
				if (orientacion == izquierda){
					image = "jugador3.png"
				}
				
				if (orientacion == derecha){
					image = "jugador2.png"
				}
			}
			
			//Registro de ataque:
			method ataqueReg(){
				
				//Acción al no tener nada:
					if (equipadoAhora == "nada"){
						
						game.say(self, "No llevas nada equipado.")
						
					}
				
				//Acción al tener la espada:
					if(espadaObj.equipado()){
				
						espada.ataque()
						
					}
				
				//Acción al tener arco:
					if (arcoObj.equipado()){
						
						flecha.lanzarFlecha(orientacion, self.position())
						
					}
					
				////Acción al tener el boomerang:
					if (boomerangObj.equipado()){
						
						boomerang.lanzar()
						
					}
					
			}
			
			//Registro de item:
			method itemReg(){
				
				//Acción al no tener nada:
					if (objEquipadoAhora == "nada"){
						game.say(self, "No tienes ningún item equipado.")
					}
				
				//Acción al tener bombas:
					if (bombaObj.equipado()){
						
						//Si no hay...
							if (bombas <= 0){
								
								bombas = 0
							
							}
						//Si hay...
							if(bombas > 0){
								
								bombas = (bombas - bombaObj.valor())
								//Colocación de bombas:
									bombaObj.iniciar()
									game.schedule(bombaObj.duracion(), {bombaObj.explotar()})
							
							}
						
					}
				
			}
			
			//Agarrar Rupia:
			method agarrarRupia(rupia){
				
				rupias = (rupias + rupia.valor())
				
				if (rupias >= rupia.limite()){
					
						rupias = rupia.limite()
						
					}
		
				game.removeVisual(rupia)
				
				return rupias
			}
				
			//Agarrar Corazon:
			method agarrarCorazon(corazon){
				
				corazonesL = (corazonesL + corazon.valor())
						
				if (corazonesL >= corazon.limite()){
					
						corazonesL = corazon.limite()
						
					}

				game.removeVisual(corazon)
				
				return corazonesL
			}
			
			//Agarrar Bomba
			method agarrarBomba(bomba){
				
				if (not bomba.estadoUso()){
					
					self.bombaObj(bomba)
					bombaObj.equipado(true)
					bombas = (bombas + bomba.valor())
						
					if (bombas >= bomba.limite()){
						
							bombas = bomba.limite()
							
						}
					
					objEquipadoAhora = bombaObj.nombre()
					game.removeVisual(bomba)
		
				}
			
			}
			
			
			//Agarrar Espada:
			method agarrarEspada(){
				
				if (not espada.estadoUso()) {
					
					game.removeVisual(arcoObj)
					game.removeVisual(boomerangObj)
					
					espada.estadoUso(true)
					espadaObj.equipado(true)
					equipadoAhora = espadaObj.nombre()
					
					game.say(self, "Espada añadida al inventario.")
					
					game.removeVisual(espadaObj)
					
				}
					
			}
			
			//Agarrar Boomerang:
			method agarrarBoomerang(){
				
				if (not boomerang.estadoUso()) {
					
					game.removeVisual(arcoObj)
					game.removeVisual(espadaObj)
					
					boomerang.estadoUso(true)
					boomerangObj.equipado(true)
					equipadoAhora = boomerangObj.nombre()
					
					game.say(self, "Boomerang añadida al inventario.")
					
					game.removeVisual(boomerangObj)
					
				}
					
			}
			
			//Agarrar Arco:
			method agarrarArco(){
				game.removeVisual(espadaObj)
				game.removeVisual(boomerangObj)
				
				arcoObj.equipado(true)
				equipadoAhora = arcoObj.nombre()
				
				game.say(self, "Arco añadido al inventario.")
				
				game.removeVisual(arcoObj)
			}
	
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////