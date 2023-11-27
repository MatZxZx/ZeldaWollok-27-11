//Importación de archivos:

	import wollok.game.*
	import Link.*
	import paredes.*
	import consumibles.*
	import equipables.*
	import Enemigos.*
	import bomba.*

//Matriz del mappeado:
	object estructuraMapa1{
		var property estructura = [1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 1 , 1 , 1 , 8 , 1 , 1 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 1 , 1 , 0 , 6 , 6 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                      
			                       1 , 1 , 0 , 0 , 6 , 6 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 9,
			                       
			                       1 , 1 , 0 , 3 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 2 , 0 , 1 , 1,
			                       
			                       1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1,
			                       
			                       1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1,
			                       
			                       1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1,
			                       
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			                       
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1]
}

//Matriz del mappeado:
	object estructuraMapa2{
		var property estructura = [1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1,
			
			                       1 , 1 , 1 , 0 , 0 , 0 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 1,
			                       
			                       1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 5 , 5 , 5 , 0 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 2 , 0 , 0 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 2 , 0 , 2 , 0 , 0 , 1,
			                       
			                      10 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 4 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 4 , 0 , 0,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1,
			                       
			                       1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 3 , 0 , 3 , 0 , 1,
			                       
			                       1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 3 , 0 , 3 , 0 , 0 , 1,
			                       
			                       1 , 1 , 1 , 0 , 0 , 0 , 1 , 1 , 1 , 0 , 0 , 3 , 0 , 3 , 0 , 1,
			                       
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1]
}

object estructuraCueva1{
		var property estructura = [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0]
}

//Mapping:


object mapping{
	
	var property mapa_actual = estructuraMapa1.estructura()
	
	method limpiar(){
		game.allVisuals().forEach{visuales =>
			game.removeVisual(visuales)
		}
	}
	
	method dibujar(){
		
        var x = 0
        var y = 13
        	
            mapa_actual.forEach{ rastreador =>
               
                if (x == 16){
                    x = 0
                    y -= 1
                    }
                    
                //Pared (Opera, y está bien):
                if(rastreador == 1){
                    const pared = new TipoPared(position = game.at(x, y), nombre = "pared", dano = 0, image = "pared.png")
                    game.addVisual(pared)
                    	
                
                }
                
                	//Corazones:
                	if(rastreador == 2){
	                	const corazon = new Consumible(position = game.at(x, y), nombre = "corazon", valor = 1, limite = 3, image = "corazon0.png")
						game.addVisual(corazon)
						game.onCollideDo(corazon, {pickC =>
							
							if(pickC.nombre() == "Link" or pickC.nombre() == "boomerang"){
									jugador.agarrarCorazon(corazon)
									
							}
						})
						
						game.onTick(200, "corazon",{corazon.corazonAnimacion()})
	                }
	                
	                //Rupias:
	                if(rastreador == 3){
	                	const rupia = new Consumible(position = game.at(x, y), nombre = "rupia", valor = 1, limite = 99, image = "rupia0.png")
						game.addVisual(rupia)
						game.onCollideDo(rupia, {pickR => 
							
							if(pickR.nombre() == "Link" or pickR.nombre() == "boomerang"){
									jugador.agarrarRupia(rupia)
									
							}
						})
						
						game.onTick(200, "rupia",{rupia.rupiaAnimacion()})
	                }
	                
	                //Enemigos Moblin:
                	if(rastreador == 4){
	                	const enemigo1 = new Enemigo(corazonesE = 3, position = game.at(x, y), nombre = "moblin", dano = 1, image = "moblin0.png")
						game.addVisual(enemigo1)
						
						game.onTick(500, "seguir", {enemigo1.avanzar(jugador.position())})
						
	                }
	                
	                //Paredes Enemigas:
                	if(rastreador == 5){
	                	const paredEnemiga = new TipoPared(position = game.at(x, y), nombre = "paredEnemiga", dano = 1, image = "paredEnemiga.png")
						game.addVisual(paredEnemiga)
						//Colision Pared Enemiga:
							game.onCollideDo(paredEnemiga, {tocar =>
								if(tocar.nombre() == "Link"){
									jugador.recibirDano()
									jugador.morir()
									
								}
							})
						
	                }
	                
	                //Bombas:
	                if(rastreador == 6){
	                	const bomba = new Bomba(position = game.at(x, y), nombre = "bomba", duracion = 1000, danoCorazon = 6, image = "bomba.png")
	                	game.addVisual(bomba)
	                	game.onCollideDo(bomba, {pickB => 
							
							if(pickB.nombre() == "Link" or pickB.nombre() == "boomerang"){
									jugador.agarrarBomba(bomba)
									
							}
						})
	                	
	                	
	                }
	                
	                //Paso a la pantalla siguiente:
	                if(rastreador == 9){
	                	const paso = new TipoPared(position = game.at(x + 1, y), nombre = "paso", dano = 0, image = "paso.png")
						game.addVisual(paso)
						game.onCollideDo(paso, {teleport => 
							
							self.limpiar()
							
							mapa_actual = estructuraMapa2.estructura()
							
							self.dibujar()
							
							game.addVisual(jugador)
							jugador.position(game.at(0, 7)) 
						})
	                }
	                
	                if(rastreador == 10){
	                	const paso = new TipoPared(position = game.at(x - 1, y), nombre = "paso", dano = 0, image = "paso.png")
						game.addVisual(paso)
						game.onCollideDo(paso, {teleport => 
							
							self.limpiar()
							
							mapa_actual = estructuraMapa1.estructura()
							
							self.dibujar()
							
							game.addVisual(jugador)
							jugador.position(game.at(15, 7)) 
						})
	                }
       			x += 1
        	}
        	
        }
        
     
	}
