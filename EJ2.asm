;Programa que permite sumar el contenido de 2Ah,2Bh,2Ch y 2Dh, y guarda el resultado en 0Dh.
;Se considera las direcciones ya cargadas con valores

	LIST P=16f84	
		
	ORG 0x00
	MOVF 0x2A,0	;Mueve el contenido de 0x2A a W.
	ADDWF 0x2B,0	;Suma el contenido de 0x2B con lo que se halla en W, el resultado se mantiene en el registro.
	ADDWF 0x2C,0	;Se realiza de manera analógica con los demás sumandos.
	ADDWF 0X2D,0
	MOVWF 0x0D	;Se almacena el resultado en la dirección especificada.
	end
