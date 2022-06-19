;Programa que intercambia los contenidos entre las direcciones 0x0C y 0x1D

;Para intercambiar dos posiciones debemos utilizar un auxiliar como intermediario, en este caso 0x0D

	LIST P=16f84	;Indica el modelo del microcontrolador PIC
		
	ORG 0x00		;Indica la ubicación de la primera instrucción ("Contador de programa")
	MOVF 0x0C,0		;Mueve el contenido de 0x0C al acumulador o W (Parámetro 0)
	MOVWF 0x0D		;Mueve lo que se halla en el acumulador al auxiliar
	MOVF 0x1D,0		;Mueve el contenido de 0x1D a W
	MOVWF 0x0C		;Mueve lo que se halla en W a 0x0C
	MOVF 0x0D,0		;Mueve lo que se halla en el auxiliar a W
	MOVWF 0x1D		;Mueve el contenido de W a 0x1D, que estaba vacío.
	end			