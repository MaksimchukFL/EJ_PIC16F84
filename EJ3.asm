;Programa que realiza la multiplicacion de las direcciones 2Ah y 2Fh. Guarda el resultado en 0Ch.

;Para multiplicar en PIC en este caso, debemos hacer sumas sucesivas.
;Para hacer un programa eficiente, debemos considerar el caso particular en el que uno de los factores sea 0 o ambos.

	LIST P=16f84	
		
	ORG 0x00
	CLRF 0x0C	;Coloca a 0 la dirección adonde va el resultado.
	MOVF 0x2A,1	;Moverá sobre si mismo el primer valor a chequear y esto es para poder ser revisado por el registro STATUS.
;Este registro tiene la final de hacer chequeos de estado, revisando la última operación realizada. (UTILIZAR DATASHEET)
	BTFSC 0x03,2	;0x03 es la dirección del registro STATUS y se realiza el chequeo en el bit 2 o BIT Z.
;Este bit tendrá 1 si el valor referenciado es 0. BTFSC salteará la proxima instrucción si el bit Z es 0.
	GOTO FIN	;La instrucción GOTO hará un salto a la etiqueta de programa especificada.
	MOVF 0x2F,1	;Se procede de manera analógica para el otro operando.
	BTFSC 0x03,2
	GOTO FIN
	MOVF 0x2A,0
SEGUIR	ADDWF 0X0C,1	;Sobre la posición de memoria del resultado que está ya inicializada en 0, se irá sumando 2A.
	DECFSZ 0x2F,1	;Vamos decrementando 2F hasta que llegue a 0 en bucle, DECFSZ establece la condición para dejar de sumar.
	GOTO SEGUIR
FIN	NOP -		;Esto debemos agregarle antes del end, asi el salto se realiza en caso de que uno e los factores sea 0.		
	end
