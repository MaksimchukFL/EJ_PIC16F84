;Programa que recorra el intervalo [0Fh-22h] y cuente la cantidad de numeros impares dejando dicha cantidad en la posiciòn 2Eh.

;Para el recorrido y tratamiento de intervalos en este modelo de PIC, se debe usar direccionamiento indirecto.
;Se hará uso del registro FSR, que guarda la dirección a la que se quiere acceder. Se halla en la dirección 0x04.
;Para poder trabajar con el contenido de la dirección que se halla en FSR, debemos referenciar a la posición 0x00.
;Cuando nos referimos, o las instrucciones se refieren a LITERALES, son constantes que pasan por direccionamiento inmediato.

	LIST P=16f84	
		
	ORG 0x00
	MOVLW 0X0F	;Cargamos el primer valor del intervalo a W.
	MOVWF 0x04	;Movemos el contenido de W al registro FSR.
	MOVLW 0x14	;Para poder recorrer el intervalo dado, primero que nada debemos hallar la cantidad de posiciones de memoria a recorrer.
;Este valor literal será=VALOR MAYOR DEL INTERVALO-VALOR MENOR DEL INTERVALO+1 (Suma y resta HEX).
	MOVWF 0x0C	;Escojemos una posición de memoria que no pise el intervalo para establecer el contador y movemos el literal.
	CLRF 0x2E	;Aseguramos que la posiciòn a almacenar el resultado está limpia.
SEGUIR	BTFSC 0x00,0	;Recordemos que en binario, la paridad está determinada por el bit de menor peso. Testeamos dicho bit.
	INCF 0x2E,1		;En caso de que haya testeado impar, incrementamos el resultado.
	INCF 0x04,1		;Incrementa el FSR para chequear el siguiente valor. Es importante que sea el FSR ya que es el literal y no la posición de memoria.
	DECFSZ 0x0C,1	;Decremente el contador para pasar a la siguiente posición.
	GOTO SEGUIR		;Realiza la prueba en el proximo valor del intervalo.	
	end