/*-----------------------------------------------------------------------------------------------------------------*/
{ /* Region Imports */
	import flash.geom.Point;
}
/*-----------------------------------------------------------------------------------------------------------------*/
{ /* Region Variáveis */
	/* Reconhecimento teclas */
	var direitapressionada:Boolean = false;
	var esquerdapressionada:Boolean = false;
	var cimapressionada:Boolean = false;
	var baixopressionada:Boolean = false;
	/* Velocidade Padrão */
	var velocidadeX:Number = 8;
	var velocidadeY:Number = 8;
	/* Posição Camera */
	var cameraX:int = 0;
	var cameraY:int = 0;
	/* Fricção movimentação */
	var friccaoConstante:Number = 2;
	var friccaoBase:Number = 0.89;
	/* Rotação base */
	var rotateX:int = 0;
	var rotateY:int = 0;
	/* Reconhecimento Pontos */
	var ColisaoPontoN:Boolean = false;
	var ColisaoPontoNNE:Boolean = false;
	var ColisaoPontoNE:Boolean = false;
	var ColisaoPontoENE:Boolean = false;
	var ColisaoPontoE:Boolean = false;
	var ColisaoPontoESE:Boolean = false;
	var ColisaoPontoSE:Boolean = false;
	var ColisaoPontoSSE:Boolean = false;
	var ColisaoPontoS:Boolean = false;
	var ColisaoPontoSSO:Boolean = false;
	var ColisaoPontoSO:Boolean = false;
	var ColisaoPontoOSO:Boolean = false;
	var ColisaoPontoO:Boolean = false;
	var ColisaoPontoONO:Boolean = false;
	var ColisaoPontoNO:Boolean = false;
	var ColisaoPontoNNO:Boolean = false;
	/* Localização Pontos */
	var pontoN:Point = new Point(-7,-81);
	var pontoNNE:Point = new Point(23,-76);
	var pontoNE:Point = new Point(46,-58);
	var pontoENE:Point = new Point(62,-35);
	var pontoE:Point = new Point(67,-10);
	var pontoESE:Point = new Point(62,18);
	var pontoSE:Point = new Point(46,44);
	var pontoSSE:Point = new Point(23,59);
	var pontoS:Point = new Point(-7,67);
	var pontoSSO:Point = new Point(-38,59);
	var pontoSO:Point = new Point(-64,44);
	var pontoOSO:Point = new Point(-78,18);
	var pontoO:Point = new Point(-83,-10);
	var pontoONO:Point = new Point(-78,-35);
	var pontoNO:Point = new Point(-64,-58);
	var pontoNNO:Point = new Point(-38,-76);
	/* Fricção Gravidade */
	var gravidadeConstante:Number = 3;
	var puloConstante:Number = -25;
	/* Chaves */
	var possuiBattery:Boolean = false;
	var possuiBattery2:Boolean = false;
	/* Porta */
	var porta:Boolean = false;
}
/*-----------------------------------------------------------------------------------------------------------------*/
{ /* Region Funções */
	function TeclaPressionada(e:KeyboardEvent):void
	{
		/*------------------------------------------------------------------------------------------------------------*/
		{ /* Pressionar Teclas Eixo X */
			if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				esquerdapressionada = true;
			else if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				direitapressionada = true;
		}
		/*------------------------------------------------------------------------------------------------------------*/
		{ /* Pressionar Teclas Eixo Y */
			if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W)
				cimapressionada = true;
			else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S)
				baixopressionada = true;
		}
		/*------------------------------------------------------------------------------------------------------------*/
	}
	/*-------------------------------------------------------------------------------------------------------------*/
	function TeclaSolta(e:KeyboardEvent):void
	{
		/*------------------------------------------------------------------------------------------------------------*/
		{ /* Soltar Teclas Eixo X */
			if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.A)
				esquerdapressionada = false;
			else if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.D)
				direitapressionada = false;
		}
		/*------------------------------------------------------------------------------------------------------------*/
		{ /* Soltar Teclas Eixo Y */
			if (e.keyCode == Keyboard.UP || e.keyCode == Keyboard.W)
				cimapressionada = false;
			else if (e.keyCode == Keyboard.DOWN || e.keyCode == Keyboard.S)
				baixopressionada = false;
		}
		/*---------------------------------------------------------------------------------------------------------*/
	}
	/*-------------------------------------------------------------------------------------------------------------*/
	function loop(e:Event):void
	{
		{ /* Region Verificação Colisão */
			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoN.x, MvcBolinhaFeliz.y + pontoN.y, true))
				ColisaoPontoN = true;
			else
				ColisaoPontoN = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoNNE.x, MvcBolinhaFeliz.y + pontoNNE.y, true))
				ColisaoPontoNNE = true;
			else
				ColisaoPontoNNE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoNE.x, MvcBolinhaFeliz.y + pontoNE.y, true))
				ColisaoPontoNE = true;
			else
				ColisaoPontoNE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoENE.x, MvcBolinhaFeliz.y + pontoENE.y, true))
				ColisaoPontoENE = true;
			else
				ColisaoPontoENE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoE.x, MvcBolinhaFeliz.y + pontoE.y, true))
				ColisaoPontoE = true;
			else
				ColisaoPontoE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoESE.x, MvcBolinhaFeliz.y + pontoESE.y, true))
				ColisaoPontoESE = true;
			else
				ColisaoPontoESE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoSE.x, MvcBolinhaFeliz.y + pontoSE.y, true))
				ColisaoPontoSE = true;
			else
				ColisaoPontoSE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoSSE.x, MvcBolinhaFeliz.y + pontoSSE.y, true))
				ColisaoPontoSSE = true;
			else
				ColisaoPontoSSE = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoS.x, MvcBolinhaFeliz.y + pontoS.y, true))
				ColisaoPontoS = true;
			else
				ColisaoPontoS = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoSSO.x, MvcBolinhaFeliz.y + pontoSSO.y, true))
				ColisaoPontoSSO = true;
			else
				ColisaoPontoSSO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoSO.x, MvcBolinhaFeliz.y + pontoSO.y, true))
				ColisaoPontoSO = true;
			else
				ColisaoPontoSO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoOSO.x, MvcBolinhaFeliz.y + pontoOSO.y, true))
				ColisaoPontoOSO = true;
			else
				ColisaoPontoOSO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoO.x, MvcBolinhaFeliz.y + pontoO.y, true))
				ColisaoPontoO = true;
			else
				ColisaoPontoO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoONO.x, MvcBolinhaFeliz.y + pontoONO.y, true))
				ColisaoPontoONO = true;
			else
				ColisaoPontoONO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoNO.x, MvcBolinhaFeliz.y + pontoNO.y, true))
				ColisaoPontoNO = true;
			else
				ColisaoPontoNO = false;

			if (MvcMeio.MvcChaoLimite.hitTestPoint(MvcBolinhaFeliz.x + pontoNNO.x, MvcBolinhaFeliz.y + pontoNNO.y, true))
				ColisaoPontoNNO = true;
			else
				ColisaoPontoNNO = false;
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Teclas Pressionadas */
			if(esquerdapressionada)
				velocidadeX -= friccaoConstante;
			else if (direitapressionada)
				velocidadeX += friccaoConstante;
			/*
				if (cimapressionada)
					velocidadeY -= friccaoConstante;
				else if (baixopressionada)
					velocidadeY += friccaoConstante;
			*/
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Calculos Colisão */
			{ /* Region VelocidadeX < - Esquerda */
				if(ColisaoPontoONO || ColisaoPontoO || ColisaoPontoOSO)
					if(velocidadeX < 0)
						velocidadeX *= -0.5;
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeX > - Direita */
				if(ColisaoPontoENE || ColisaoPontoE || ColisaoPontoESE)
					if(velocidadeX > 0)
						velocidadeX *= -0.5;
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeY < - Cima */
				if(ColisaoPontoNNO || ColisaoPontoN || ColisaoPontoNNE)
					if(velocidadeY < 0)
						velocidadeY *= -0.5;
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeY > - Baixo */
				if(ColisaoPontoSSO || ColisaoPontoS || ColisaoPontoSSE)
				{
					if(velocidadeY > 0)
						velocidadeY *= -0.5;
					if(cimapressionada)
						velocidadeY += puloConstante;
				}
				else
					velocidadeY += gravidadeConstante;
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeX < + VelocidadeY < - Esquerda + Cima */
				if(ColisaoPontoNO)
					if(velocidadeX < 0 && velocidadeY < 0)
					{
						velocidadeX *= -0.5;
						velocidadeY *= -0.5;
					}
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeX < + VelocidadeY > - Esquerda + Baixo */
				if(ColisaoPontoSO)
					if(velocidadeX < 0 && velocidadeY > 0)
					{
						velocidadeX *= -0.5;
						velocidadeY *= -0.5;
					}
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeX > + VelocidadeY < - Direita + Cima */
				if(ColisaoPontoNE)
					if(velocidadeX > 0 && velocidadeY < 0)
					{
						velocidadeX *= -0.5;
						velocidadeY *= -0.5;
					}
			}
			/*-----------------------------------------------------------------------------------------------------*/
			{ /* Region VelocidadeX > + VelocidadeY > - Direita + Baixo */
				if(ColisaoPontoSE)
					if(velocidadeX > 0 && velocidadeY > 0)
					{
						velocidadeX *= -0.5;
						velocidadeY *= -0.5;
					}
			}
			/*-----------------------------------------------------------------------------------------------------*/
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Calculos Movimentação cenário*/
			cameraX -= velocidadeX;
			cameraY -= velocidadeY;
			velocidadeX *= friccaoBase;
			velocidadeY *= friccaoBase;
			MvcMeio.x = cameraX;
			MvcMontanhas.x = cameraX*2;
			MvcLua.x = cameraX * -1 /8;
			MvcMeio.y = cameraY;
			MvcMontanhas.y = cameraY*2;
			//MvcLua.y = cameraY * -1 /8;
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region "Freio" ABS */
			/* Manual
				if (velocidadeX < 0 && velocidadeX > -0.89)
					velocidadeX = 0;
				if (velocidadeY < 0 && velocidadeY > -0.89)
					velocidadeY = 0;
				if (velocidadeX > 0 && velocidadeX < 0.89)
					velocidadeX = 0;
				if (velocidadeY > 0 && velocidadeY < 0.89)
					velocidadeY = 0;
			*/
			if (Math.abs(velocidadeX) < 0.89)
				velocidadeX = 0;
			if (Math.abs(velocidadeY) < 0.89)
				velocidadeY = 0;

		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Verificação Chaves */
			if (!possuiBattery)
				if (MvcBolinhaFeliz.hitTestObject(MvcMeio.MvcBattery))
				{
					MvcMeio.MvcBattery.visible = false;
					MvcBatteryMini.visible = true;
					possuiBattery = true;
				}
			if (!possuiBattery2)
				if (MvcBolinhaFeliz.hitTestObject(MvcMeio.MvcBattery2))
				{
					MvcMeio.MvcBattery2.visible = false;
					MvcBattery2Mini.visible = true;
					possuiBattery2 = true;
				}
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Verificação Porta */
			if (!porta)
				if (possuiBattery && possuiBattery2)
					if (MvcBolinhaFeliz.hitTestObject(MvcMeio.MvcDoor))
					{
						MvcBatteryMini.visible = false;
						MvcBattery2Mini.visible = false;
						MvcMeio.MvcDoor.gotoAndStop(2);
						gotoAndStop(1, "ScnWin");
						porta = true;
					}
		}
		/*---------------------------------------------------------------------------------------------------------*/
		{ /* Region Exibição Valores Calculos */
			//trace ("MvcMeio.x: " + MvcMeio.x);
			//trace ("MvcMeio.y: " + MvcMeio.y);
			//trace ("MvcMontanhas.x: " + MvcMontanhas.x);
			//trace ("MvcMontanhas.y: " + MvcMontanhas.y);
			//trace ("MvcLua.x: " + MvcLua.x);
			//trace ("MvcLua.y: " + MvcLua.y);
			//trace ("CameraX: " + cameraX);
			//trace ("CameraY: " + cameraY);
			//trace ("VelocidadeX: " + velocidadeX);
			//trace ("VelocidadeY: " + velocidadeY + "\n");
		}
	}
}
/*-----------------------------------------------------------------------------------------------------------------*/
{ /* Region Eventos */
	stage.addEventListener(Event.ENTER_FRAME, loop);
	stage.addEventListener(KeyboardEvent.KEY_DOWN, TeclaPressionada);
	stage.addEventListener(KeyboardEvent.KEY_UP, TeclaSolta);
}
/*-----------------------------------------------------------------------------------------------------------------*/
{ /* Region Exec Ao Iniciar */
	MvcMeio.MvcDoor.gotoAndStop(1);
	MvcBatteryMini.visible = false;
	MvcBattery2Mini.visible = false;
}
/*-----------------------------------------------------------------------------------------------------------------*/
