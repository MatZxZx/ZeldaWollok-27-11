//Random Pos:
	//game.at(0.randomUpTo(game.width()), 0.randomUpTo(game.height()))
	
//Comportamiento de flecha anterior:
//	if (orientacion == arriba){
//					(0..15).forEach{ alcance => 
//						flecha.position(self.position().up(alcance))
//						game.addVisual(flecha)
//					}
//				}

//Motor de spawn anterior
	/*  
		//Rupias:
		const crearRupias = {cantidadR =>
			(1 .. cantidadR).forEach{ forR =>
				const rupia = new Consumible(nombre = "rupia", valor = 1, limite = 99, image = "rupia0.png")
				game.addVisual(rupia)
				game.onCollideDo(rupia, {pickR => jugador.agarrarRupia(rupia)})
				game.onTick(200, "rupia",{rupia.rupiaAnimacion()})
			}
		}
		//crearRupias.apply(6)
		
		//Corazones:
		const crearCorazones = {cantidadC =>
			(1 .. cantidadC).forEach{ forC =>
				const corazon = new Consumible(nombre = "corazon", valor = 1, limite = 3, image = "corazon0.png")
				game.addVisual(corazon)
				game.onCollideDo(corazon, {pickC => jugador.agarrarCorazon(corazon)})
				game.onTick(200, "corazon",{corazon.corazonAnimacion()})
			}
		}
		//crearCorazones.apply(3)
		*/


//flecha anterior
/*game.onTick(60, "avanzar", {self.avanzar()})
						
						
		if (orientacion == derecha and flecha.position().x() < game.width() -1){
			flecha.image("flechaD.png")
			flecha.position(flecha.position().right(1))

		}
		
		else if (orientacion == izquierda and flecha.position().x() < game.width() -1){
			flecha.image("flechaIZ.png")
			flecha.position(flecha.position().left(1))
			
		}
		
		else if (orientacion == arriba and flecha.position().y() < game.height() -1){
			flecha.image("flechaAR.png")
			flecha.position(flecha.position().up(1))

		}
		
		else if (orientacion == abajo and flecha.position().y() < game.height() -1){
			flecha.image("flechaAB.png")
			flecha.position(flecha.position().down(1))

		}
	
	
		else {
			game.removeVisual(flecha)
			game.removeTickEvent("alcance")
		}*/
		
//Motor de mapeado Anterior:

/* 		var mapa_actual = estructuraMapa1.estructura()
        var x = 0
        var y = 13
        const mapping = {=>
        	
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
                
                //x += 1
                
                	//Corazones:
                	if(rastreador == 2){
	                	const corazon = new Consumible(position = game.at(x, y), nombre = "corazon", valor = 1, limite = 3, image = "corazon0.png")
						game.addVisual(corazon)
						game.onCollideDo(corazon, {pickC => jugador.agarrarCorazon(corazon)})
						game.onTick(200, "corazon",{corazon.corazonAnimacion()})
	                }
	                
	                //Rupias:
	                if(rastreador == 3){
	                	const rupia = new Consumible(position = game.at(x, y), nombre = "rupia", valor = 1, limite = 99, image = "rupia0.png")
						game.addVisual(rupia)
						game.onCollideDo(rupia, {pickR => jugador.agarrarRupia(rupia)})
						game.onTick(200, "rupia",{rupia.rupiaAnimacion()})
	                }
	                
	                //Enemigos Moblin:
                	if(rastreador == 4){
	                	const enemigo1 = new Enemigo(corazonesE = 2, position = game.at(x, y), nombre = "moblin", dano = 1, image = "enemigo.png")
						game.addVisual(enemigo1)
						game.onTick(500, "seguir", {enemigo1.avanzar(jugador.position())})
						
	                }
	                
	                //Paredes Enemigas:
                	if(rastreador == 5){
	                	const paredEnemiga = new TipoPared(position = game.at(x, y), nombre = "paredEnemiga", dano = 1, image = "paredEnemiga.png")
						game.addVisual(paredEnemiga)
						//Colision Pared Enemiga:
							game.onCollideDo(paredEnemiga, {tocar =>
							jugador.chocarParedEnemiga()
							if (jugador.corazonesL() <= 0){
								jugador.morir()}
							})
						
	                }
	                
	                //Paso a la pantalla siguiente:
	                if(rastreador == 9){
	                	const paso = new TipoPared(position = game.at(x, y), nombre = "paso", dano = 0, image = "paso.png")
						game.addVisual(paso)
						game.onCollideDo(paso, {teleport => mapa_actual = estructuraMapa2.estructura() /* CARGANDO MAPA EN CUESTIÓN */ //})
	      //          }
       	//		x += 1
       // 	}
        	
     //   }
        
   // mapping.apply() 
   
/*   //Sentencias:
 * 
 * 	jugador.espadaObj(espada)
	jugador.arcoObj(arco)

					//Visuales:
		game.addVisual(jugador)
		game.addVisual(espada)
		game.addVisual(arco)
	
		//Pickeos:
			game.onCollideDo(espada, {pick => jugador.agarrarEspada()})
			game.onCollideDo(arco, {pick => jugador.agarrarArco()})
		
	//Registros de tecla:
		keyboard.enter().onPressDo{ game.say(jugador, "Corazones: " + jugador.corazonesL().toString() + " / " + "Rupias: " + jugador.rupias().toString())}
		keyboard.backspace().onPressDo{ game.say(jugador, "Lleva: " + jugador.equipadoAhora().toString() + " como equipable.")}
		
		//Interacciones del jugador:
		
			//Arriba:
			keyboard.up().onPressDo{jugador.position(jugador.position().up(1));
				jugador.orientacion(0);
				jugador.giro()
			}
			
			//Abajo:
			keyboard.down().onPressDo{jugador.position(jugador.position().down(1));
				jugador.orientacion(1);
				jugador.giro()
			}

			//Izquierda:
			keyboard.left().onPressDo{jugador.position(jugador.position().left(1));
				jugador.orientacion(2);
				jugador.giro()
			}
									
			//Derecha:
			keyboard.right().onPressDo{jugador.position(jugador.position().right(1));
				jugador.orientacion(3);
				jugador.giro()
			}
			
			//Teclas de interacción:
			keyboard.z().onPressDo{jugador.ataqueReg()} //A
			keyboard.x().onPressDo{jugador.itemReg()} //B */
			
								/* 	[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			
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
			                       
			                         0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0] */
			                         
/* //Acción al tener espada:
					if (espadaObj.equipado()){
						
						ataque = true
						
						if (orientacion == arriba){
							espadaObj.image("itemE.png")
							game.addVisual(espadaObj)
							espadaObj.position(self.position().up(1))
						}
						
						if (orientacion == abajo){
							espadaObj.image("itemE1.png")
							game.addVisual(espadaObj)
							espadaObj.position(self.position().down(1))
						
						}
						
						if (orientacion == izquierda){
							espadaObj.image("itemE2.png")
							game.addVisual(espadaObj)
						espadaObj.position(self.position().left(1))
						
						}
						
						if (orientacion == derecha){
							espadaObj.image("itemE3.png")
							game.addVisual(espadaObj)
						espadaObj.position(self.position().right(1))
						
						}
					
						game.schedule(espadaObj.duracion(), {=> ataque = false; game.removeVisual(espadaObj)})
					
					} */