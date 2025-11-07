#a0 = endereco imagem
#a1 = x
#a2 = y
#a3 = frame (0 ou 1)
#
##
#
#t0 = bitmap
#t1 = imagem
#t2 = count linha
#t3 = count coluna
#t4 = largura
#t5 = altura
#
##
#
#s0 = frame atual (0 ou 1) 
#s1 = inversão de frames
#s2 = sprite de direção do link (cima/baixo/direita/esquerda)
#s3 = flag de animação do link (pra alternar os pés)

.data
	.include "sprites/tile.s"
	.include "sprites/mapa1.s"
	.include "sprites/link.s"

CHAR_POS:	.half 48,16			# x, y
OLD_CHAR_POS:	.half 48,16			# x, y


#Pra funcionar a colisão, precisa fazer um mapa de colisão 20x15. Cada valor desse mapa representa um tile 16x16
#1 - tem obstáculo
#0 - n tem
mapa1_colisao:

.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1


.text


MAIN: 
	la a0, mapa1
	li a1, 0
	li a2, 0
	li a3, 0
	call PRINT			# imprime o sprite
	li a3,1				# frame = 1
	call PRINT			# imprime o sprite
	
	li s0, 0			#vai ser usado para verificar o frame
	la s2, baixo2
	li s3,0

GAME_LOOP: 

	call KEY_SELECT
	xori s0, s0, 1			#alterna entre 0 e 1 frame, visto que xor 0, 1 = 1 e xor 1, 1 = 0. Pinta primeiro em 1
	
	la t0, CHAR_POS			#carrega para t0 a posicao do personagem
	mv a0,s2			#passa o valor s2 (sprite do link) pra a0, que vai ser argumento pro print	
	lh a1, 0,(t0)			#carrega a posicao x no CHAR_POS
	lh a2, 2(t0)			#carrega a posicao y no CHAR_POS
	mv a3, s0			#define o frame
	call PRINT
	
	li t2,0xFF200604	# t2 aponta para o endereco onde eu decido qual frame mostra
	sw s0,0(t2)		# coloca no endereco que decide o que mostra o frame s0
	
	#limpeza do frame invisivel (para apagar o rastro)
	#limpa-se o frame invisivel, pois no proximo loop, quando printar, o loop repetirá e terá um frame zerado sem o rastro.
	
	xori s1, s0, 1 			#processo de inversao do frame visivel e salvar o inverso em s1
	
	la t0, OLD_CHAR_POS		#carrega para t0 a posicao do personagem
	la a0, tile			#printa o personagem
	lh a1, 0,(t0)			#carrega a posicao x no CHAR_POS
	lh a2, 2(t0)			#carrega a posicao y no CHAR_POS
	mv a3, s1			#define o frame
	call PRINT
	
	j GAME_LOOP
	
	
KEY_SELECT: li t1,0xFF200000		# carrega o endere o de controle do KDMMIO 
LOOP: 	lw t0,0(t1)			# Le bit de Controle Teclado # endereco da flag tecla apertada 
   	andi t0,t0,0x0001		# mascara o bit menos significativo
   					# (lê do endereco controle de teclado uma flag(0 = tecla apertada | 1 = tecla apertada)			
   	beq t0,zero,FIM_LOOP		# n o tem tecla pressionada ent o volta ao loop
   	lw t2,4(t1)			# le o valor da tecla (no endereco 0xFF200004) #endereco dos valores ASCII
  	sw t2,12(t1)  			# escreve a tecla pressionada no display (no endereco 0xFF200012) #enderco do display
  	
  	
  	#Procedimento pra interpretar as teclas( mudar as posicoes respectivas quando w, a, s ou d forem clicadas)

	li t0,'w'
	beq t2,t0,CHAR_CIMA		# se tecla pressionada for 'w', chama CHAR_CIMA
	
	li t0,'a'
	beq t2,t0,CHAR_ESQ		# se tecla pressionada for 'a', chama CHAR_ESQ
	
	li t0,'s'
	beq t2,t0,CHAR_BAIXO		# se tecla pressionada for 's', chama CHAR_BAIXO
	
	li t0,'d'
	beq t2,t0,CHAR_DIR		# se tecla pressionada for 'd', chama CHAR_DIR

	

FIM_LOOP:	ret
  	
CHAR_DIR: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endereço de retorno(ra), então ele não retorna pro loop se não salvar
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o pé)		
	la t0, CHAR_POS  #carrega o endereco da posicao 
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	
	#Procedimento pra checar colisão
	
	addi t3, t1, 16	#t3 vai guardar o valor x do endereço previsto depois da movimentação t1(x) + 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compatível com o mapa de colisão
	srai t4, t2, 4 #divide o y previsto por 16 
	
	jal CHECAR_COLISAO #a função vai retornar t5 = 1 se tiver obstáculo no endereço previsto e t5 = 0 senão
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endereço de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colisão
	
	
	#Não teve colisão, então carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
	addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
	sh t1, 0(t0) #faz o store do valor x novo
	
	beq s3, zero, p1d #s3 decide qual sprite do link vai ser printado (muda a posição dos pés)
	la s2,direita2 
	ret
	p1d:	la s2, direita
		ret

CHAR_ESQ: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endereço de retorno(ra), então ele não retorna pro loop se não salvar
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o pé)	
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	
	#Procedimento pra checar colisão
	
	addi t3, t1, -16 #t3 vai guardar o valor x do endereço previsto depois da movimentação t1(x) - 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compatível com o mapa de colisão
	srai t4, t2, 4 #divide o y previsto por 16
	
	jal CHECAR_COLISAO #a função vai retornar t5 = 1 se tiver obstáculo no endereço previsto e t5 = 0 senão
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endereço de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colisão
	
	
	#Não teve colisão, então carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
	addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
	sh t1, 0(t0) #faz o store do valor x novo
	
	beq s3, zero, p1e #s3 decide qual sprite do link vai ser printado (muda a posição dos pés)
	la s2,esquerda2
	ret
	p1e:	la s2, esquerda
		ret
		
		
CHAR_CIMA:
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endereço de retorno(ra), então ele não retorna pro loop se não salvar
	 
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o pé)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, -16 #t4 vai guardar o valor x do endereço previsto depois da movimentação t2(y) - 16	
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compatível com o mapa de colisão
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colisão
	
	jal CHECAR_COLISAO #a função vai retornar t5 = 1 se tiver obstáculo no endereço previsto e t5 = 0 senão
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endereço de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colisão
	
	#Não teve colisão, então carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 2(t0) #carrega o valor x posicao
	addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
	sh t1, 2(t0) #faz o store do valor x novo
	
	beq s3, zero, p1c #s3 decide qual sprite do link vai ser printado (muda a posição dos pés)
	la s2,cima2
	ret
	p1c:	la s2, cima
		ret
	
CHAR_BAIXO: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endereço de retorno(ra), então ele não retorna pro loop se não salvar
		
	xori s3, s3, 1 #inverte o s3, que decide qual sprite do link vai usar (muda o pé)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, 16	 #t4 vai guardar o valor x do endereço previsto depois da movimentação t2(y) + 16
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compatível com o mapa de colisão
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colisão
	
	jal CHECAR_COLISAO #a função vai retornar t5 = 1 se tiver obstáculo no endereço previsto e t5 = 0 senão
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endereço de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colisão
	
	#Não teve colisão, então carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 2(t0) #carrega o valor x posicao
	addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
	sh t1, 2(t0) #faz o store do valor x novo
	
	beq s3, zero, p1b #s3 decide qual sprite do link vai ser printado (muda a posição dos pés)
	la s2,baixo2
	ret
	p1b:	la s2, baixo
		ret

COLISAO: ret

CHECAR_COLISAO:
	li t0, 20 #carrega t1=20, sendo 20 a largura do mapa de colisão (largura do mapa em tiles) 	
	mul t0, t0, t4 #multiplica t4(y do endereço previsto) por 20 pra achar a linha em que o personagem está
	add t0, t0, t3 #soma t3(x do endereço previsto) pelo valor da multiplicação pra achar a coordenada na linha
	
	la t1, mapa1_colisao #carrega o mapa de colisão em t1
	add t1, t1, t0 #guarda t1 as coordenadas previstas do personagem no mapa de colisão
	
	lbu t5, 0(t1) #carrega em t5 o valor que está nas coordenadas previstas do personagem no mapa de calor
	#t5 = 1 se tem obstáculo
	#t5 = 0 se não tem obstáculo
	ret

PRINT:
	li t0, 0xFF0 #bitmap
	add t0, t0, a3 #qual frame esta (o ou 1)
	slli t0, t0, 20 #desloca 20 bits (4 hexadecimal)
	
	add t0, t0, a1 #add o x
	li t1, 320 #t1 = 320 temporario para fazer o calculo do y
	mul t1, t1, a2
	add t0, t0, t1 #endereco bitmap final
	
	addi t1, a0, 8 #pula a parte .word 16, 16 da imagem # Endereco da imagem = a0 + 8
	
	mv t2, zero
	mv t3, zero
	
	lw t4, 0(a0) #faz o load do tamanho da imagem no arquivo (.word 16, 16 seta ambos pra 16)
	lw t5, 4(a0)
	
	
	
PRINT_LINHA:
	lw t6, 0(t1) #pega as cores dos 4 pixels em 0(t1) # cada pixel tem 4 bytes 
	sw t6, 0(t0) #'printa' os pixels no bitmap
	
	addi t1, t1, 4
	addi t0, t0, 4 #incrementa ambos bitmap e imagem para os proximos bytes
	
	addi t3, t3, 4
	
	blt t3, t4, PRINT_LINHA #enquanto nao estivermos no t3 = t5 (ou seja, ultimo byte), printa a coluna
	
	addi t0, t0, 320 #soma para pular de linha
	sub t0, t0, t4 #subtrai para voltar ao incio da linha
	
	mv t3, zero #zero coluna
	addi t2, t2, 1 #soma a altura
	
	blt t2, t5, PRINT_LINHA #enquanto nao estivermos na ultima linha, printe a linha
	
	ret
	
	
