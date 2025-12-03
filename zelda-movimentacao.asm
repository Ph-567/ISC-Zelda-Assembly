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
#s1 = invers�o de frames
#s2 = sprite de dire��o do link (cima/baixo/direita/esquerda)
#s3 = flag de anima��o do link (pra alternar os p�s)

.data

NUM_MELODIA: 	.word 29
NUM_HARPA:   	.word 96

# Relogios separados para cada instrumento (comecam em 0)
PROXIMA_NOTA_HARPA_TEMPO:   .word 0
PROXIMA_NOTA_OCARINA_TEMPO: .word 0

# MELODIA (Ocarina) 
NOTAS_OCARINA: 
.word 76,1132,79,566,74,1132,72,283,74,283,76,1132,79,566,74,1698
.word 76,1132,79,566,86,1132,84,566,79,1132,77,283,76,283,74,1698
.word 76,1132,79,566,74,1132,72,283,74,283,76,1132,79,566,74,1698
.word 76,1132,79,566,86,1132,84,566,91,3396

# HARPA (Arpejo)
NOTAS_HARPA:
.word 72,283,77,283,81,283,77,283,72,283,77,283,71,283,74,283,79,283,74,283,71,283,74,283
.word 72,283,77,283,81,283,77,283,72,283,77,283,71,283,74,283,79,283,74,283,71,283,74,283
.word 72,283,76,283,79,283,76,283,72,283,76,283,74,283,77,283,81,283,77,283,74,283,77,283
.word 71,283,74,283,79,283,74,283,71,283,74,283,72,283,77,283,81,283,77,283,72,283,77,283
.word 71,283,74,283,79,283,74,283,71,283,74,283,72,283,77,283,81,283,77,283,72,283,77,283
.word 71,283,74,283,79,283,74,283,71,283,74,283,72,283,76,283,79,283,76,283,72,283,76,283
.word 74,283,77,283,81,283,77,283,74,283,77,283,71,283,74,283,79,283,74,283,71,283,74,283
.word 71,283,74,283,79,283,74,283,71,283,74,283,71,283,74,283,79,283,74,283,71,283,74,283

	.include "sprites/tile.s"
	.include "sprites/mapa1.s"
	.include "sprites/link.s"
	.include "sprites/espada.s"
	.include "sprites/espada2.s"

CHAR_POS:	.half 48,16			# x, y
OLD_CHAR_POS:	.half 48,16			# x, y

SWORD_POS:	.half 80,48 	#posica espada mapa

HAS_SWORD:	.byte 0		# Flag de estado: 0 = No mapa, 1 = Já foi pega


#Pra funcionar a colis�o, precisa fazer um mapa de colis�o 20x15. Cada valor desse mapa representa um tile 16x16
#1 - tem obst�culo
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


MAIN:   #mapa

	la a0, mapa1
	li a1, 0
	li a2, 0
	li a3, 0
	call PRINT			# imprime o sprite
	li a3,1				# frame = 1
	call PRINT			# imprime o sprite
	
	#espada
	
	la t0, SWORD_POS
	la a0, espada			# Carrega o sprite da espada
	lh a1, 0(t0)			# Carrega x da espada
	
	addi a1, a1, 4			#soma-se 4 para centralizar o sprite da espada de tamanho 8, 16 
	
	lh a2, 2(t0)			# Carrega y da espada
	li a3, 0			# no frame 0
	call PRINT
	li a3, 1			# no frame 1
	call PRINT
	
	lw s4, NUM_MELODIA	# s4 = Total Melodia
	lw s5, NUM_HARPA	# s5 = Total Harpa
	
	la s6, NOTAS_OCARINA	# s6 = Ponteiro para Melodia
	la s7, NOTAS_HARPA	# s7 = Ponteiro para Harpa
	la s8, NOTAS_OCARINA	# s8 = Backup Ponteiro Melodia
	la s9, NOTAS_HARPA	# s9 = Backup Ponteiro Harpa
	
	li s10, 0		# s10 = Contador da Melodia (i)
	li s11, 0		# s11 = Contador da Harpa (j)
	
	# a5 = ponteiro para os relogios (vamos recarregar no loop)
	la t0, PROXIMA_NOTA_HARPA_TEMPO 
	sw zero, 0(t0)		# Garante que o relogio da Harpa comece em 0
	sw zero, 4(t0)		# Garante que o relogio da Ocarina comece em 0
	
	#
	
	li s0, 0			#vai ser usado para verificar o frame
	la s2, baixo2			#sprite incial (link olhando para baixo)
	li s3,0				#flag de animação (pés do link)
	
	#sincronia da musica -- isso serve para evitar que o tempo desalinhe com o start do game e toque muitas notas
	#que nao deveriam ser tocadas ao mesmo tempo
    
	# 1. pega o tempo EXATO 
	
	li a7, 30           # Syscall time
	ecall               # a0 = tempo atual em ms
	    
        # 2. define o inicio da musica para agora -- somente quando ja inicializou tudo
        
        la t0, PROXIMA_NOTA_HARPA_TEMPO
        sw a0, 0(t0)        # proxima nota da Harpa = Agora
        sw a0, 4(t0)        # proxima nota da Ocarina = Agora
	
	#pequeno atraso para o jogo respirar antes da musica
        addi a0, a0, 500  # Adiciona 500ms 
        sw a0, 0(t0)
        sw a0, 4(t0)
	

GAME_LOOP: 

	call KEY_SELECT
	xori s0, s0, 1			#alterna entre 0 e 1 frame, visto que xor 0, 1 = 1 e xor 1, 1 = 0. Pinta primeiro em 1
	
	call CHECAR_PEGOU_ESPADA
	
	call TOCAR_MUSICA
	
	la t0, CHAR_POS			#carrega para t0 a posicao do personagem
	mv a0,s2			#passa o valor s2 (sprite do link) pra a0, que vai ser argumento pro print	
	lh a1, 0,(t0)			#carrega a posicao x no CHAR_POS
	lh a2, 2(t0)			#carrega a posicao y no CHAR_POS
	mv a3, s0			#define o frame
	call PRINT
	
	li t2,0xFF200604	# t2 aponta para o endereco onde eu decido qual frame mostra
	sw s0,0(t2)		# coloca no endereco que decide o que mostra o frame s0
	
	#limpeza do frame invisivel (para apagar o rastro)
	#limpa-se o frame invisivel, pois no proximo loop, quando printar, o loop repetir� e ter� um frame zerado sem o rastro.
	
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
   					# (l� do endereco controle de teclado uma flag(0 = tecla apertada | 1 = tecla apertada)			
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
	
	#NOVA TECLA (B) para fazer a espada bater
	
	

	

FIM_LOOP:	ret
  	
CHAR_DIR: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere�o de retorno(ra), ent�o ele n�o retorna pro loop se n�o salvar
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p�)		
	la t0, CHAR_POS  #carrega o endereco da posicao 
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega o valor y posicao 
	
	
	#Procedimento pra checar colis�o
	
	addi t3, t1, 16	#t3 vai guardar o valor x do endere�o previsto depois da movimenta��o t1(x) + 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compat�vel com o mapa de colis�o
	srai t4, t2, 4 #divide o y previsto por 16 
	
	jal CHECAR_COLISAO #a fun��o vai retornar t5 = 1 se tiver obst�culo no endere�o previsto e t5 = 0 sen�o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere�o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colis�o
	
	
	#N�o teve colis�o, ent�o carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
	addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
	sh t1, 0(t0) #faz o store do valor x novo
	
	beq s3, zero, p1d #s3 decide qual sprite do link vai ser printado (muda a posi��o dos p�s)
	la s2,direita2 
	ret
	p1d:	la s2, direita
		ret

CHAR_ESQ: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere�o de retorno(ra), ent�o ele n�o retorna pro loop se n�o salvar
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p�)	
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	
	#Procedimento pra checar colis�o
	
	addi t3, t1, -16 #t3 vai guardar o valor x do endere�o previsto depois da movimenta��o t1(x) - 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compat�vel com o mapa de colis�o
	srai t4, t2, 4 #divide o y previsto por 16
	
	jal CHECAR_COLISAO #a fun��o vai retornar t5 = 1 se tiver obst�culo no endere�o previsto e t5 = 0 sen�o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere�o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colis�o
	
	
	#N�o teve colis�o, ent�o carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
	addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
	sh t1, 0(t0) #faz o store do valor x novo
	
	beq s3, zero, p1e #s3 decide qual sprite do link vai ser printado (muda a posi��o dos p�s)
	la s2,esquerda2
	ret
	p1e:	la s2, esquerda
		ret
		
		
CHAR_CIMA:
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere�o de retorno(ra), ent�o ele n�o retorna pro loop se n�o salvar
	 
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p�)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, -16 #t4 vai guardar o valor x do endere�o previsto depois da movimenta��o t2(y) - 16	
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compat�vel com o mapa de colis�o
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colis�o
	
	jal CHECAR_COLISAO #a fun��o vai retornar t5 = 1 se tiver obst�culo no endere�o previsto e t5 = 0 sen�o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere�o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colis�o
	
	#N�o teve colis�o, ent�o carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 2(t0) #carrega o valor x posicao
	addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
	sh t1, 2(t0) #faz o store do valor x novo
	
	beq s3, zero, p1c #s3 decide qual sprite do link vai ser printado (muda a posi��o dos p�s)
	la s2,cima2
	ret
	p1c:	la s2, cima
		ret
	
CHAR_BAIXO: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere�o de retorno(ra), ent�o ele n�o retorna pro loop se n�o salvar
		
	xori s3, s3, 1 #inverte o s3, que decide qual sprite do link vai usar (muda o p�)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, 16	 #t4 vai guardar o valor x do endere�o previsto depois da movimenta��o t2(y) + 16
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compat�vel com o mapa de colis�o
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colis�o
	
	jal CHECAR_COLISAO #a fun��o vai retornar t5 = 1 se tiver obst�culo no endere�o previsto e t5 = 0 sen�o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere�o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	li t6, 1
	beq t5, t6, COLISAO #se t6 = 1 teve colis�o
	
	#N�o teve colis�o, ent�o carrega as coisas pra printar o personagem
	
	la t0, CHAR_POS #carrega o endereco da posicao
	la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
	lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
	sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
	lh t1, 2(t0) #carrega o valor x posicao
	addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
	sh t1, 2(t0) #faz o store do valor x novo
	
	beq s3, zero, p1b #s3 decide qual sprite do link vai ser printado (muda a posi��o dos p�s)
	la s2,baixo2
	ret
	p1b:	la s2, baixo
		ret

COLISAO: ret

CHECAR_PEGOU_ESPADA:
	la t0, HAS_SWORD
	lbu t0, 0(t0)
	bne t0, zero, FIM_CHECAR_ESPADA # Se ja tem espada (HAS_SWORD=1), sai

	#LINK
	la t0, CHAR_POS
	lh t1, 0(t0)			# x do Link
	lh t2, 2(t0)			# y do Link
	srai t1, t1, 4			# valor da grade (inves de 340, 240 --- 20, 15)
	srai t2, t2, 4			# valor da grade 
	
	# Carrega as coordenadas de TILE da Espada
	la t0, SWORD_POS
	lh t3, 0(t0)			# x da Espada
	lh t4, 2(t0)			# y da Espada
	srai t3, t3, 4			# valor da grade 
	srai t4, t4, 4			# valor da grade 
	
	# Compara as coordenadas de tile
	bne t1, t3, FIM_CHECAR_ESPADA	# Se x do Link != x da Espada, sai
	bne t2, t4, FIM_CHECAR_ESPADA	# Se y do Link != y da Espada, sai
	
	addi sp, sp, -4  #uma vez que chamaremos print e perderemos o endereco de retorno,
	 		 #salva o endereco de retorn em sp que depois sera restaurado
	sw ra, 0(sp)
	
	
	li t5, 1	#flag HAS_SWORD atualizada
	la t0, HAS_SWORD  
	sb t5, 0(t0)
	
	la t0, SWORD_POS
	la a0, tile		# Carrega o sprite tile
	lh a1, 0(t0)		# x da espada
	lh a2, 2(t0)		# y da espada
	
	li a3, 0		# Seleciona o frame 0
	call PRINT		#apaga do frame 0
	
	li a3, 1		# Seleciona o frame 1
	call PRINT		#apaga do frame 1
	
	#restaura o endereco de retorno para o game_loop
	lw ra, 0(sp)
	addi sp, sp, 4
	
FIM_CHECAR_ESPADA:
	ret
	
	
	

CHECAR_COLISAO:
	li t0, 20 #carrega t1=20, sendo 20 a largura do mapa de colis�o (largura do mapa em tiles) 	
	mul t0, t0, t4 #multiplica t4(y do endere�o previsto) por 20 pra achar a linha em que o personagem est�
	add t0, t0, t3 #soma t3(x do endere�o previsto) pelo valor da multiplica��o pra achar a coordenada na linha
	
	la t1, mapa1_colisao #carrega o mapa de colis�o em t1
	add t1, t1, t0 #guarda t1 as coordenadas previstas do personagem no mapa de colis�o
	
	lbu t5, 0(t1) #carrega em t5 o valor que est� nas coordenadas previstas do personagem no mapa de calor
	#t5 = 1 se tem obst�culo
	#t5 = 0 se n�o tem obst�culo
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
	
TOCAR_MUSICA:

    # 1. Pegar o Tempo Atual
    li a7, 30        # Syscall 30 (Time)
    ecall
    mv t3, a0        # t3 = Tempo Atual 

    # Carrega ponteiro inicial
    la a5, PROXIMA_NOTA_HARPA_TEMPO 

    lw t4, 0(a5)     # t4 = PROXIMA_NOTA_HARPA_TEMPO
    
    bltu t3, t4, CHECAR_OCARINA 

    # É hora de tocar Harpa
    beq s11, s5, REINICIAR_HARPA #considera quando s5 == limite da musica (tempo final) for igual ao tempo atual (notas decorridas)

REINICIAR_HARPA_FIM:
    # Carregar e tocar Harpa
    lw a0, 0(s7)     # Nota
    lw a1, 4(s7)     # Duração
    mv t1, a1        # Salva duração em t1
    li a2, 46        # Instrumento Harpa
    li a3, 90        # Volume
    li a7, 31        #Midi nao bloq
    ecall
    
    la a5, PROXIMA_NOTA_HARPA_TEMPO #garantir a nao alteracao apos chamada de ecall
    
    add t4, t3, t1      # ProximaNota = TempoAtual + Duracao
    sw t4, 0(a5)        # Salva
    
    # Avançar Harpa
    addi s7, s7, 8
    addi s11, s11, 1

CHECAR_OCARINA:
    
    lw t4, 4(a5)        # t4 = PROXIMA_NOTA_OCARINA_TEMPO --- a5 ja foi checado para ver se esta certo (trecho acima)
    
    bltu t3, t4, FIM_MUSICA 

    # É hora de tocar Ocarina
    beq s10, s4, REINICIAR_MELODIA

REINICIAR_MELODIA_FIM:
    # Carregar e tocar Ocarina
    lw a0, 0(s6)
    lw a1, 4(s6)
    mv t1, a1
    li a2, 79
    li a3, 127
    li a7, 31
    ecall
    
    la a5, PROXIMA_NOTA_HARPA_TEMPO #garantir que o a5 nao tenha sido alterado por ecall
    
    # Atualizar relógio da Ocarina
    add t4, t3, t1
    sw t4, 4(a5)        
    
    # Avançar Ocarina
    addi s6, s6, 8
    addi s10, s10, 1
    
    j FIM_MUSICA 

REINICIAR_MELODIA:
    mv s6, s8        # Reseta ponteiro Melodia
    li s10, 0        # Reseta contador Melodia
    
    j REINICIAR_MELODIA_FIM

REINICIAR_HARPA:
    mv s7, s9        # Reseta ponteiro Harpa
    li s11, 0        # Reseta contador Harpa
    j REINICIAR_HARPA_FIM
    
FIM_MUSICA:
    ret
