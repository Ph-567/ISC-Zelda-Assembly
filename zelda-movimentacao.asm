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
#s1 = invers?o de frames
#s2 = sprite de dire??o do link (cima/baixo/direita/esquerda)
#s3 = flag de anima??o do link (pra alternar os p?s)

.data

NUM_MELODIA: 		.word 29
NUM_HARPA: 		.word 96

# Relogios separados para cada instrumento (comecam em 0)
PROXIMA_NOTA_HARPA_TEMPO: 	.word 0
PROXIMA_NOTA_OCARINA_TEMPO: 	.word 0

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

	# --- SPRITES ---
	.align 2 		
	.include "sprites/tile.s"
	
	.align 2
	.include "sprites/mapa1.s"
	
	.align 2
	.include "sprites/link.s"
	
	.align 2
	.include "sprites/espada.s"
	
	.align 2 		 
	.include "sprites/espada2.s"
	
	.align 2
	.include "sprites/espada_esq.s"
	
	.align 2
	.include "sprites/espada_baixo.s"
	
	.align 2
	.include "sprites/preto.s"
	
	.align 2
	.include "sprites/coracao.s"
	
	.align 2
	.include "sprites/rupy.s"
	
	.align 2
	.include "sprites/numeros.s"
	
	.align 2
	.include "sprites/mapa2.s"

	.align 2
	.include "sprites/mapa3.s"
	
	.align 2
	.include "sprites/dungeon.s"
	
	.align 2
	.include "sprites/tile2.s"
	
	.align 2
	.include "sprites/escudo.s"
	
	.align 2
	.include "sprites/chave.s"
	
	.align 2
	.include "sprites/moldura.s"
	
	.align 2
	.include "sprites/octorok.s"
 
# ===================== #
# MOVIMENTACAO

CHAR_POS:		.half 64, 64			# x, y
OLD_CHAR_POS: 		.half 64, 64
LAST_POS_FRAME_0: 	.half 64, 64
LAST_POS_FRAME_1: 	.half 64, 64

# ===================== #
# ESPADA
SWORD_POS:		.half 80, 80 	#posica espada mapa
HAS_SWORD:		.byte 0		# Flag de estado: 0 = No mapa, 1 = Já foi pega

# ===================== #
# HUD
VIDAS: 		.byte 3		#flag para vidas
RUPY:		.half 50		#flag para moedas

# ===================== #
# NUMEROS
	.align 2
VETOR_NUMEROS:			#vetor para facilitar o uso dos numeros
	.word num0, num1, num2, num3, num4, num5, num6, num7, num8, num9

# ===================== #
# ATAQUE
LINK_DIR: 		.byte 0 	# 0=Baixo, 1=Cima, 2=Esq, 3=Dir (Inicia olhando pra baixo)
TIMER_ATAQUE: 		.byte 0 	# Contador de frames do ataque (0 = Nao atacando)
POS_ATAQUE: 		.half 0, 0 	# X, Y de onde a espada foi desenhada (para apagar)
CLEANUP_FRAMES: 	.byte 0

# ===================== #
# LOJA
SOLD_HEART: 		.byte 0
SOLD_SHIELD: 		.byte 0
SOLD_KEY: 		.byte 0

# ===================== #
# LOJA -- INVENTARIO
HAS_KEY: 		.byte 0 	# 0 = Nao, 1 = Sim
HAS_SHIELD: 		.byte 0 	# 0 = Nao, 1 = Sim (Vida Extra)

# =========================== #
# DADOS DO INIMIGO E COMBATE

INIMIGO_POS: 		.half 160, 144 	# Posição Inicial X, Y
OLD_INI_POS: 		.half 160, 144 	# Para limpar o rastro
INIMIGO_VIVO: 		.byte 1 	# 1 = Vivo, 0 = Morto

# Timers
TIMER_MOV_INI: 		.byte 0 	# Controla a VELOCIDADE (Delay)
TIMER_MUDAR_DIR: 	.byte 0 	# Controla a mudança de direção aleatória
TIMER_INVUL: 		.byte 0 	# Tempo que o Link fica invulnerável após levar dano

# Velocidades (Usei .word para evitar desalinhamento)
	.align 2
INI_VEL_X: 		.word 16 	# Começa movendo para direita
INI_VEL_Y: 		.word 0 	# Começa parado no Y


#Pra funcionar a colis?o, precisa fazer um mapa de colis?o 20x15. Cada valor desse mapa representa um tile 16x16
#1 - tem obst?culo
#0 - n tem
#  numeros maiores que 1 indicam mudança de mapa, direcionando para um mapa especifico de acordo com o numero

mapa1_colisao:

.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

mapa2_colisao:

.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1
.byte 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1
.byte 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1
.byte 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1
.byte 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

mapa3_colisao:

.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

dungeon_colisao:

.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 7, 7, 1, 1, 1, 1, 1, 1, 1, 1

# --- GERENCIAMENTO DE MAPAS ---

# Ponteiros para o mapa atual (Inicializados com Mapa 1)
CURR_MAP_IMG: 	.word mapa1
CURR_MAP_COL: 	.word mapa1_colisao
CURR_MAP_TILE: 	.word tile

# Tabela de transicao
# Estrutura: [numero no mapa de colisao, endereço mapa, endereço mapa de colsiao, Novo_Link_X, Novo_Link_Y, tile usada]
# Exemplo: Se pisar no Tile 2, vai pro Mapa 2, nas coordenadas (16, 120), usando a imagem 'tile' para cobrir o rastro
	.align 2
PORTAL_TABLE:
	.word 2, mapa2, mapa2_colisao, 16, 128, tile 	# Saída do Mapa 1 p/ Mapa 2
	.word 3, mapa3, mapa3_colisao, 144, 192, tile2 	# Saída do mapa 2 p/ Mapa 3
	.word 4, mapa1, mapa1_colisao, 288, 128, tile 	# Saída do Mapa 2 p/ Mapa 1
	.word 5, dungeon, dungeon_colisao, 160, 208, preto # Saída do Mapa 1 p/ Dungeon
	.word 6, mapa2, mapa2_colisao, 144, 64, tile 	# Saída do Mapa 3 p/ Mapa 2
	.word 7, mapa1, mapa1_colisao, 144, 48, tile 	# Saída da Dungeon p/ Mapa 1
	.word 0 					# Fim da tabela


.text


MAIN:   # Mapa ---------

	lw a0, CURR_MAP_IMG 		#carrega a imagem do mapa atual
	li a1, 0
	li a2, 0
	li a3, 0
	call PRINT			# imprime o sprite
	li a3,1				# frame = 1
	call PRINT			# imprime o sprite
	
	# Espada --------
	
	la t0, SWORD_POS		# Carrega a posicao da espada
	la a0, espada			# Carrega o sprite da espada
	lh a1, 0(t0)			# Carrega x da espada
	
	addi a1, a1, 4			#soma-se 4 para centralizar o sprite da espada de tamanho 8, 16 
	
	lh a2, 2(t0)			# Carrega y da espada
	li a3, 0			# no frame 0
	call PRINT
	li a3, 1			# no frame 1
	call PRINT
	
	# HUD ------
	la a0, preto 			# Sprite preto
	li a2, 0 			# Y = 0 (Linha 1)
 	
	# Loop para preencher a linha X=0 ate X=304
 	
	li s10, 0 
 	 
LOOP_HUD_LINHA1:

	li t1, 320
	bge s10, t1, FIM_HUD_LINHA1
 	
	mv a1, s10 			# X atual
 	
	li a3, 0 			# Frame 0
	call PRINT
	li a3, 1 			# Frame 1
	call PRINT
 	
	addi s10, s10, 16 		# Proximo tile
	j LOOP_HUD_LINHA1
FIM_HUD_LINHA1:

	li a2, 16 			# Y = 16 (Linha 2)
	li s10, 0
 
LOOP_HUD_LINHA2:

	li t1, 320
	bge s10, t1, FIM_HUD_LINHA2
	mv a1, s10
	li a3, 0
	call PRINT
	li a3, 1
	call PRINT
	addi s10, s10, 16
	j LOOP_HUD_LINHA2
 
FIM_HUD_LINHA2:
	
	# MUSICA ------------
	
	lw s4, NUM_MELODIA		# s4 = Total Melodia
	lw s5, NUM_HARPA		# s5 = Total Harpa
	
	la s6, NOTAS_OCARINA		# s6 = Ponteiro para Melodia
	la s7, NOTAS_HARPA		# s7 = Ponteiro para Harpa
	la s8, NOTAS_OCARINA		# s8 = Backup Ponteiro Melodia
	la s9, NOTAS_HARPA		# s9 = Backup Ponteiro Harpa
	
	li s10, 0			# s10 = Contador da Melodia (i)
	li s11, 0			# s11 = Contador da Harpa (j)
	
	# a5 = ponteiro para os relogios (vamos recarregar no loop)
	la t0, PROXIMA_NOTA_HARPA_TEMPO 
	sw zero, 0(t0)			# Garante que o relogio da Harpa comece em 0
	sw zero, 4(t0)			# Garante que o relogio da Ocarina comece em 0
	
	#
	
	li s0, 0			#vai ser usado para verificar o frame
	la s2, baixo2			#sprite incial (link olhando para baixo)
	li s3,0				#flag de animação (pés do link)
	
	#sincronia da musica -- isso serve para evitar que o tempo desalinhe com o start do game e toque muitas notas
	#que nao deveriam ser tocadas ao mesmo tempo
 
	# 1. pega o tempo EXATO 
	
	li a7, 30 			# Syscall time
	ecall 				# a0 = tempo atual em ms
 	
 	# 2. define o inicio da musica para agora -- somente quando ja inicializou tudo
 	
 	la t0, PROXIMA_NOTA_HARPA_TEMPO
 	sw a0, 0(t0) 			# proxima nota da Harpa = Agora
 	sw a0, 4(t0) 			# proxima nota da Ocarina = Agora
	
	#pequeno atraso para o jogo respirar antes da musica
 	addi a0, a0, 500 		# Adiciona 500ms 
 	sw a0, 0(t0)
 	sw a0, 4(t0)
	

GAME_LOOP: 
	call 	KEY_SELECT
 
	# Alternar Frame
	xori 	s0, s0, 1 
 
	#LIMPEZA
	call 	GERENCIAR_RASTRO

	# Logicas do Jogo
	call 	CHECAR_PEGOU_ESPADA
	call 	TOCAR_MUSICA

	# Inimigos
	call 	ATUALIZAR_INIMIGO 
	call 	CHECAR_DANO 
	call 	CHECAR_HIT_INIMIGO 

	# Loja e Cenário
	call 	CHECAR_LOJA 
	call 	DESENHAR_LOJA 
	call 	DESENHAR_ATAQUE 
 
	# Desenha o Link
	la 	t0, CHAR_POS
	mv 	a0, s2 
	lh 	a1, 0(t0)
	lh 	a2, 2(t0)
	mv 	a3, s0 
	call 	PRINT
 
	#Interface
	call 	ATUALIZAR_HUD 
 
	#atualiza frame do display
	li 	t2, 0xFF200604
	sw 	s0, 0(t2)
 
	j 	GAME_LOOP
# =============================
# Procedimentos de Movimentacao

KEY_SELECT: 

	li t1,0xFF200000		# carrega o endere o de controle do KDMMIO
	
	# VERIFICAR SE JA ESTA ATACANDO (Bloqueio)
	la t0, TIMER_ATAQUE
	lb t3, 0(t0) 			# Carrega timer
	beq t3, zero, LER_TECLADO 	# Se 0, pode ler teclas
 
	# Se > 0, apenas decrementa e sai (Link travado) -- Vulgo atacando
	addi t3, t3, -1
	sb t3, 0(t0)
	ret 				# Sai da funcao (nao le WASD)
	
 	
 
 	
LER_TECLADO:

	lw t0,0(t1)			# Le bit de Controle Teclado # endereco da flag tecla apertada 
 	andi t0,t0,0x0001		# mascara o bit menos significativo
 					# (l? do endereco controle de teclado uma flag(0 = tecla apertada | 1 = tecla apertada)			
 	beq t0,zero,FIM_LOOP		# n o tem tecla pressionada ent o volta ao loop
 	
 	lw t2,4(t1)			# le o valor da tecla (no endereco 0xFF200004) #endereco dos valores ASCII
 	sw t2,12(t1) 			# escreve a tecla pressionada no display (no endereco 0xFF200012) #enderco do display
 	
 	
 	#Procedimento pra interpretar as teclas( mudar as posicoes respectivas quando w, a, s ou d forem clicadas)

	# --- DETECTAR ATAQUE  ---
	li t0, 'j' 			# Tecla J para atacar
	beq t2, t0, INICIAR_ATAQUE
	
	# --- DETECTAR MOVIMENTO --- 
	li t0,'w'
	beq t2,t0,CHAR_CIMA		# se tecla pressionada for 'w', chama CHAR_CIMA
	
	li t0,'a'
	beq t2,t0,CHAR_ESQ		# se tecla pressionada for 'a', chama CHAR_ESQ
	
	li t0,'s'
	beq t2,t0,CHAR_BAIXO		# se tecla pressionada for 's', chama CHAR_BAIXO
	
	li t0,'d'
	beq t2,t0,CHAR_DIR		# se tecla pressionada for 'd', chama CHAR_DIR
	

FIM_LOOP:	ret
 	
INICIAR_ATAQUE:
	# Verifica se tem espada
	la t0, HAS_SWORD
	lb t0, 0(t0)
	beq t0, zero, FIM_LOOP 		# Se nao tem espada, nao ataca (ou ataca sem espada)
 
	# Configura Timer
	la t0, TIMER_ATAQUE
	li t1, 15 			# Duracao do ataque (10 frames)
	sb t1, 0(t0)
	ret

CHAR_DIR: 
	addi sp, sp, -4 		#usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) 			#precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 3 			# 3 = Direita
	sb t1, 0(t0) 			# Salva direcao
	
	xori s3, s3, 1			#inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS 		#carrega o endereco da posicao 
	lh t1, 0(t0) 			#carrega o valor x posicao 
	lh t2, 2(t0) 			#pega o valor y posicao 
	
	
	#Procedimento pra checar colis?o
	
	addi t3, t1, 16			#t3 vai guardar o valor x do endere?o previsto depois da movimenta??o t1(x) + 16
	
	srai t3, t3, 4 			#divide o x previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t4, t2, 4 			#divide o y previsto por 16 
	
	jal CHECAR_COLISAO 		#a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) 			#volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 			#reseta o sp
	
	beq t5, zero, MOV_DIR
	
	li t6, 1 
	beq t5, t6, COLISAO 		#se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
 	# Salva o numero do portal em a0 e chama a troca
 	mv a0, t5 
 	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_DIR:
	
		la t0, CHAR_POS 	#carrega o endereco da posicao
		la t1, OLD_CHAR_POS 	#carrega o endereco da posicao passada
		lw t2, 0(t0) 		#pega a posicao atual
		sw t2, 0(t1) 		#carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 0(t0) 		#carrega o valor x posicao (COMPLETA, ou seja, X e Y)
		addi t1, t1, 16 	#aumenta o valor x (para indicar o movimento)
		sh t1, 0(t0) 		#faz o store do valor x novo
		
		beq s3, zero, p1d 	#s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,direita2 
		ret
		p1d:	la s2, direita
			ret

CHAR_ESQ: 
	addi sp, sp, -4 		#usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) 			#precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 2 			# 2 = esquerda
	sb t1, 0(t0) 			# Salva direcao
	
	xori s3, s3, 1			#inverte o s3, que decide qual sprite do link vai usar (muda o p?)	
	la t0, CHAR_POS 		#carrega o endereco da posicao 	
	lh t1, 0(t0) 			#carrega o valor x posicao 
	lh t2, 2(t0) 			#pega a posicao atual
	
	
	#Procedimento pra checar colis?o
	
	addi t3, t1, -16 		#t3 vai guardar o valor x do endere?o previsto depois da movimenta??o t1(x) - 16
	
	srai t3, t3, 4 			#divide o x previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t4, t2, 4 			#divide o y previsto por 16
	
	
	
	jal CHECAR_COLISAO 		#a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) 			#volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 			#reseta o sp
	
	beq t5, zero, MOV_ESQ
	
	li t6, 1 
	beq t5, t6, COLISAO 		#se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
 	# Salva o numero do portal em a0 e chama a troca
 	mv a0, t5 
 	j MUDAR_MAPA
	
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_ESQ:
	
		la t0, CHAR_POS 	#carrega o endereco da posicao
		la t1, OLD_CHAR_POS 	#carrega o endereco da posicao passada
		lw t2, 0(t0) 		#pega a posicao atual
		sw t2, 0(t1) 		#carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 0(t0) 		#carrega o valor x posicao (COMPLETA, ou seja, X e Y)
		addi t1, t1, -16 	#aumenta o valor x (para indicar o movimento)
		sh t1, 0(t0) 		#faz o store do valor x novo
		
		beq s3, zero, p1e 	#s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,esquerda2
		ret
		p1e:	la s2, esquerda
			ret
		
		
CHAR_CIMA:
	addi sp, sp, -4 		#usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) 			#precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 1 			# 1 = Direita
	sb t1, 0(t0) 			# Salva direcao
	
	xori s3, s3, 1			#inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS 		#carrega o endereco da posicao 	
	lh t1, 0(t0) 			#carrega o valor x posicao 
	lh t2, 2(t0) 			#pega a posicao atual
	
	addi t4, t2, -16 		#t4 vai guardar o valor x do endere?o previsto depois da movimenta??o t2(y) - 16	
	
	srai t4, t4, 4 			#divide o y previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t3, t1, 4 			#divide o x previsto por 16
	
	
	#Procedimento pra checar colis?o
	
	jal CHECAR_COLISAO 		#a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) 			#volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 			#reseta o sp
	
	beq t5, zero, MOV_CIMA
	
	li t6, 1 
	beq t5, t6, COLISAO 		#se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
 	# Salva o numero do portal em a0 e chama a troca
 	mv a0, t5 
 	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_CIMA:
		la t0, CHAR_POS 	#carrega o endereco da posicao
		la t1, OLD_CHAR_POS 	#carrega o endereco da posicao passada
		lw t2, 0(t0) 		#pega a posicao atual (COMPLETA, ou seja, X e Y)
		sw t2, 0(t1) 		#carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 2(t0) 		#carrega o valor x posicao
		addi t1, t1, -16 	#aumenta o valor x (para indicar o movimento)
		sh t1, 2(t0) 		#faz o store do valor x novo
		
		beq s3, zero, p1c 	#s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,cima2
		ret
		p1c:	la s2, cima
			ret
	
CHAR_BAIXO: 
	addi sp, sp, -4 		#usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) 			#precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 0 			# 0 = Direita
	sb t1, 0(t0) 			# Salva direcao	
				
	xori s3, s3, 1 			#inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS 		#carrega o endereco da posicao 	
	lh t1, 0(t0) 			#carrega o valor x posicao 
	lh t2, 2(t0) 			#pega a posicao atual
	
	addi t4, t2, 16	 		#t4 vai guardar o valor x do endere?o previsto depois da movimenta??o t2(y) + 16
	
	srai t4, t4, 4 			#divide o y previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t3, t1, 4 			#divide o x previsto por 16
	
	
	#Procedimento pra checar colis?o
	
	jal CHECAR_COLISAO 		#a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) 			#volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 			#reseta o sp
	
	beq t5, zero, MOV_BAIXO
	
	li t6, 1 
	beq t5, t6, COLISAO 		#se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
 	# Salva o numero do portal em a0 e chama a troca
 	mv a0, t5 
 	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_BAIXO:
		la t0, CHAR_POS 	#carrega o endereco da posicao
		la t1, OLD_CHAR_POS 	#carrega o endereco da posicao passada
		lw t2, 0(t0) 		#pega a posicao atual (COMPLETA, ou seja, X e Y)
		sw t2, 0(t1) 		#carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 2(t0) 		#carrega o valor x posicao
		addi t1, t1, 16 	#aumenta o valor x (para indicar o movimento)
		sh t1, 2(t0) 		#faz o store do valor x novo
		
		beq s3, zero, p1b 	#s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,baixo2
		ret
		p1b:	la s2, baixo
			ret
# ================= #
# PROCEDIMENTO para o mapa


MUDAR_MAPA:
 	# a0 contém o ID do mapa novo
 	la t0, PORTAL_TABLE 		# Carrega a tabela dos mapas em t0
 	 
LOOP_PORTAL:
 	lw t1, 0(t0) 			# Lê o ID na tabela
 	beq t1, zero, FIM_MUDANCA 	# Se 0, fim da tabela
 	beq t1, a0, ACHOU_PORTAL
 	 
 	addi t0, t0, 24 		# Pula para próxima linha da tabela (6 words * 4 bytes = 24)
 	j LOOP_PORTAL

ACHOU_PORTAL:
 	# t0 aponta para a linha correta da tabela
 	 
 	# 1. Atualizar Endereço da Imagem
 	lw t1, 4(t0) 			# Carrega endereço da imagem do mapa
 	la t2, CURR_MAP_IMG
 	sw t1, 0(t2) 			# Salva na variavel global
 	 
 	# 2. Atualizar Endereço da Colisão
 	lw t1, 8(t0) 			# Carrega endereço da colisão
 	la t2, CURR_MAP_COL
 	sw t1, 0(t2)			# Salva na variavel global
 	 
 	# 3. Atualizar Posição do Link
 	lw t1, 12(t0) 			# Novo X
 	lw t2, 16(t0) 			# Novo Y
 	la t3, CHAR_POS
 	sh t1, 0(t3)			# Salva X na variavel global
 	sh t2, 2(t3)			# Salva Y na variavel global
 	 
 	# 4. Carrega OLD_POS também 
 	la t3, OLD_CHAR_POS
 	sh t1, 0(t3) 			# Salva na variavel global
 	sh t2, 2(t3) 			# Salva na variavel global

 	# 5. Carrega o tile usado nesse mapa
 	 
 	lw t1, 20(t0)
 	la t2, CURR_MAP_TILE
 	sw t1, 0(t2)			# Salva na variavel global
 	 
 	# 6. Forçar Pintura do Novo Mapa (Frames 0 e 1)
 	# Isso apaga o mapa velho da tela imediatamente
 	 
 	addi sp, sp, -4
 	sw ra, 0(sp) 			# Salva RA pois vamos chamar PRINT
 	 
 	lw a0, CURR_MAP_IMG 		# Imagem nova
 	li a1, 0
 	li a2, 0
 	 
 	li a3, 0 			# Frame 0
 	call PRINT
 	li a3, 1 			# Frame 1
 	call PRINT
 	 
 	lw ra, 0(sp)
 	addi sp, sp, 4
 	 
FIM_MUDANCA:
 	# Retorna para o GAME_LOOP indiretamente (pois viemos de um Jump na movimentação)
 	# Como usamos 'j MUDAR_MAPA' dentro de CHAR_DIR, o stack pointer já foi limpo lá.
 	j GAME_LOOP
 	 
# ========================
#PROCEDIMENTOS DE COLISAO
 	 
COLISAO: ret

# ---- COLISAO COM A ESPADA ---- 

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
	
	addi sp, sp, -4 		#uma vez que chamaremos print e perderemos o endereco de retorno,
	 		 		#salva o endereco de retorn em sp que depois sera restaurado
	sw ra, 0(sp)
	
	
	li t5, 1			#flag HAS_SWORD atualizada
	la t0, HAS_SWORD 
	sb t5, 0(t0)
	
	la t0, SWORD_POS
	la a0, tile			# Carrega o sprite tile
	lh a1, 0(t0)			# x da espada
	lh a2, 2(t0)			# y da espada
	
	li a3, 0			# Seleciona o frame 0
	call PRINT			#apaga do frame 0
	
	li a3, 1			# Seleciona o frame 1
	call PRINT			#apaga do frame 1
	
	#restaura o endereco de retorno para o game_loop
	lw ra, 0(sp)
	addi sp, sp, 4
	
FIM_CHECAR_ESPADA:
	ret
	
	
# --- COLISAO NORMAL ----

CHECAR_COLISAO:
	li t0, 20 			#carrega t1=20, sendo 20 a largura do mapa de colis?o (largura do mapa em tiles) 
	mul t0, t0, t4 			#multiplica t4(y do endere?o previsto) por 20 pra achar a linha em que o personagem est?
	add t0, t0, t3 			#soma t3(x do endere?o previsto) pelo valor da multiplica??o pra achar a coordenada na linha
	
	lw t1, CURR_MAP_COL 		#carrega o mapa de colis?o em t1
	add t1, t1, t0 			#guarda t1 as coordenadas previstas do personagem no mapa de colis?o
	
	lbu t5, 0(t1) 			#carrega em t5 o valor que est? nas coordenadas previstas do personagem no mapa de calor
	#t5 = 1 se tem obst?culo
	#t5 = 0 se n?o tem obst?culo
	ret

# --- COLISAO DE COMPRA -----

CHECAR_LOJA:
 	#Salvar RA
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)


 	# 1. Verificar Mapa
 	lw 	t0, CURR_MAP_IMG
 	la 	t1, dungeon
 	bne 	t0, t1, RET_LOJA

 	# Carrega posicao do Link
 	la 	t0, CHAR_POS
 	lh 	t1, 0(t0) 		# Link X
 	lh 	t2, 2(t0) 		# Link Y

 	# === ESCUDO ===
 	li 	t3, 100 		# Item X
 	li 	t4, 120 		# Item Y
 	li 	t5, 50 			# Preco

 	la 	t6, SOLD_SHIELD
 	lb 	s11, 0(t6)
 	bne 	s11, zero, CHECK_KEY_BUY

 	#colisao x
 	sub 	t0, t1, t3
 	bgez 	t0, SHIELD_X_OK
 	sub 	t0, zero, t0
SHIELD_X_OK:
 	li 	s11, 16
 	bgt 	t0, s11, CHECK_KEY_BUY

 	#colisao y
 	sub 	t0, t2, t4
 	bgez 	t0, SHIELD_Y_OK
 	sub 	t0, zero, t0
SHIELD_Y_OK:
 	bgt 	t0, s11, CHECK_KEY_BUY

 	# Check Dinheiro
 	la 	t0, RUPY
 	lh 	t6, 0(t0)
 	blt 	t6, t5, CHECK_KEY_BUY

 	# COMPRA!
 	sub 	t6, t6, t5
 	sh 	t6, 0(t0)

 	li 	t6, 1
 	la 	t0, SOLD_SHIELD
 	sb 	t6, 0(t0)
 	la 	t0, HAS_SHIELD
 	sb 	t6, 0(t0)

 	call 	TOCAR_KACHING
 	j 	RET_LOJA

CHECK_KEY_BUY:
 	# === CHAVE ===
 	li 	t3, 160
 	li 	t4, 120
 	li 	t5, 80

 	la 	t6, SOLD_KEY
 	lb 	s11, 0(t6)
 	bne 	s11, zero, CHECK_HEART_BUY

 	sub 	t0, t1, t3
 	bgez 	t0, KEY_X_OK
 	sub 	t0, zero, t0
KEY_X_OK:
 	li 	s11, 16
 	bgt 	t0, s11, CHECK_HEART_BUY

 	sub 	t0, t2, t4
 	bgez 	t0, KEY_Y_OK
 	sub 	t0, zero, t0
KEY_Y_OK:
 	bgt 	t0, s11, CHECK_HEART_BUY

 	la 	t0, RUPY
 	lh 	t6, 0(t0)
 	blt 	t6, t5, CHECK_HEART_BUY

 	sub 	t6, t6, t5
 	sh 	t6, 0(t0)

 	li 	t6, 1
 	la 	t0, SOLD_KEY
 	sb 	t6, 0(t0)
 	la 	t0, HAS_KEY
 	sb 	t6, 0(t0)

 	call 	TOCAR_KACHING
 	j 	RET_LOJA

CHECK_HEART_BUY:
 	# === CORAÇÃO ===
 	li 	t3, 220
 	li 	t4, 120
 	li 	t5, 10

 	la 	t6, SOLD_HEART
 	lb 	s11, 0(t6)
 	bne 	s11, zero, RET_LOJA

 	sub 	t0, t1, t3
 	bgez 	t0, HEART_X_OK
 	sub 	t0, zero, t0
HEART_X_OK:
 	li 	s11, 16
 	bgt 	t0, s11, RET_LOJA

 	sub 	t0, t2, t4
 	bgez 	t0, HEART_Y_OK
 	sub 	t0, zero, t0
HEART_Y_OK:
 	bgt 	t0, s11, RET_LOJA

 	la 	t0, RUPY
 	lh 	t6, 0(t0)
 	blt 	t6, t5, RET_LOJA

 	sub 	t6, t6, t5
 	sh 	t6, 0(t0)

 	li 	t6, 1
 	la 	t0, SOLD_HEART
 	sb 	t6, 0(t0)

 	la 	t0, VIDAS
 	li 	t6, 3
 	sb 	t6, 0(t0)

 	call 	TOCAR_KACHING

RET_LOJA:
 	# --- RECUPERA O RA ANTES DE SAIR ---
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret

# ==================================
#  Procedimentos de desenho (print)

PRINT:
	li t0, 0xFF0 			#bitmap
	add t0, t0, a3 			#qual frame esta (o ou 1)
	slli t0, t0, 20 		#desloca 20 bits (4 hexadecimal)
	
	add t0, t0, a1 			#add o x
	li t1, 320 			#t1 = 320 temporario para fazer o calculo do y
	mul t1, t1, a2
	add t0, t0, t1 			#endereco bitmap final
	
	addi t1, a0, 8 			#pula a parte .word 16, 16 da imagem # Endereco da imagem = a0 + 8
	
	mv t2, zero
	mv t3, zero
	
	lw t4, 0(a0) 			#faz o load do tamanho da imagem no arquivo (.word 16, 16 seta ambos pra 16)
	lw t5, 4(a0)
	
	
	
PRINT_LINHA:
	lw t6, 0(t1) 			#pega as cores dos 4 pixels em 0(t1) # cada pixel tem 4 bytes 
	sw t6, 0(t0) 			#'printa' os pixels no bitmap
	
	addi t1, t1, 4
	addi t0, t0, 4 			#incrementa ambos bitmap e imagem para os proximos bytes
	
	addi t3, t3, 4
	
	blt t3, t4, PRINT_LINHA 	#enquanto nao estivermos no t3 = t5 (ou seja, ultimo byte), printa a coluna
	
	addi t0, t0, 320 		#soma para pular de linha
	sub t0, t0, t4 			#subtrai para voltar ao incio da linha
	
	mv t3, zero 			#zero coluna
	addi t2, t2, 1 			#soma a altura
	
	blt t2, t5, PRINT_LINHA 	#enquanto nao estivermos na ultima linha, printe a linha
	
	ret

# garantir que o hud esteja em dia

# ==========================================
# ATUALIZAR HUD (CORRIGIDO E SEM PONTO E VIRGULA)
# ==========================================

ATUALIZAR_HUD:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)
 	 
 	# --- 1. LIMPEZA DOS CORACOES ---
 	# Pinta os 3 slots de preto para apagar coracoes antigos
 	 
 	la 	a0, preto
 	li 	a1, 48
 	li 	a2, 0
 	mv 	a3, s0
 	li 	t0, 3

LOOP_LIMPAR_HUD:
 	beq 	t0, zero, DESENHAR_CORACOES_REAIS
 	 
 	addi 	sp, sp, -16
 	sw 	a0, 0(sp)
 	sw 	a1, 4(sp)
 	sw 	a2, 8(sp)
 	sw 	t0, 12(sp)
 	 
 	call 	PRINT
 	 
 	lw 	t0, 12(sp)
 	lw 	a2, 8(sp)
 	lw 	a1, 4(sp)
 	lw 	a0, 0(sp)
 	addi 	sp, sp, 16
 	 
 	addi 	a1, a1, 16
 	addi 	t0, t0, -1
 	j 	LOOP_LIMPAR_HUD

 	# --- 2. DESENHAR CORACOES ATUAIS ---
DESENHAR_CORACOES_REAIS:
 	la 	t0, VIDAS
 	lb 	t1, 0(t0)
 	 
 	la 	a0, coracao
 	li 	a1, 48
 	li 	a2, 0
 	mv 	a3, s0

LOOP_CORACOES:
 	beq 	t1, zero, FIM_CORACOES
 	 
 	addi 	sp, sp, -16
 	sw 	a0, 0(sp)
 	sw 	a1, 4(sp)
 	sw 	a2, 8(sp)
 	sw 	t1, 12(sp)
 	 
 	call 	PRINT
 	 
 	lw 	t1, 12(sp)
 	lw 	a2, 8(sp)
 	lw 	a1, 4(sp)
 	lw 	a0, 0(sp)
 	addi 	sp, sp, 16
 	 
 	addi 	a1, a1, 16
 	addi 	t1, t1, -1
 	j 	LOOP_CORACOES

FIM_CORACOES:

 	# --- 3. RUPIAS ---
 	la 	a0, rupy
 	li 	a1, 48
 	li 	a2, 16
 	mv 	a3, s0
 	 
 	addi 	sp, sp, -4
 	sw 	a1, 0(sp)
 	call 	PRINT
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 4
 	 
 	# --- 4. NUMEROS ---
 	la 	t0, RUPY
 	lh 	t0, 0(t0)
 	li 	t1, 10
 	li 	a1, 96
 	li 	a2, 16
 	li 	t4, 3

LOOP_RUPIAS:
 	rem 	t2, t0, t1
 	div 	t0, t0, t1
 	 
 	la 	t3, VETOR_NUMEROS
 	slli 	t2, t2, 2
 	add 	t3, t3, t2
 	lw 	a0, 0(t3)
 	 
 	addi 	sp, sp, -20
 	sw 	a0, 0(sp)
 	sw 	a1, 4(sp)
 	sw 	a2, 8(sp)
 	sw 	t0, 12(sp)
 	sw 	t4, 16(sp)
 	 
 	call 	PRINT
 	 
 	lw 	t4, 16(sp)
 	lw 	t0, 12(sp)
 	lw 	a2, 8(sp)
 	lw 	a1, 4(sp)
 	lw 	a0, 0(sp)
 	addi 	sp, sp, 20
 	 
 	addi 	a1, a1, -16
 	addi 	t4, t4, -1
 	bne 	t4, zero, LOOP_RUPIAS

 	# --- 5. INVENTARIO ---
 	 
 	# ESCUDO
 	la 	a0, moldura
 	li 	a1, 240 
 	li 	a2, 8 
 	mv 	a3, s0
 	 
 	addi 	sp, sp, -8
 	sw 	a1, 0(sp)
 	sw 	a2, 4(sp)
 	 
 	call 	PRINT
 	 
 	lw 	a2, 4(sp)
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 8
 	 
 	la 	t0, HAS_SHIELD
 	lb 	t0, 0(t0)
 	beq 	t0, zero, DRAW_SLOT_2
 	 
 	la 	a0, escudo
 	# a1 e a2 ja estao certos
 	 
 	addi 	sp, sp, -8
 	sw 	a1, 0(sp)
 	sw 	a2, 4(sp)
 	 
 	call 	PRINT
 	 
 	lw 	a2, 4(sp)
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 8

DRAW_SLOT_2:
 	# CHAVE
 	la 	a0, moldura
 	li 	a1, 264 
 	li 	a2, 8
 	mv 	a3, s0
 	 
 	addi 	sp, sp, -8
 	sw 	a1, 0(sp)
 	sw 	a2, 4(sp)
 	 
 	call 	PRINT
 	 
 	lw 	a2, 4(sp)
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 8
 	 
 	la 	t0, HAS_KEY
 	lb 	t0, 0(t0)
 	beq 	t0, zero, DRAW_SLOT_3 
 	 
 	la 	a0, chave
 	 
 	addi 	sp, sp, -8
 	sw 	a1, 0(sp)
 	sw 	a2, 4(sp)
 	 
 	call 	PRINT
 	 
 	lw 	a2, 4(sp)
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 8

DRAW_SLOT_3:
 	# ESPADA
 	# Moldura
 	la 	a0, moldura
 	li 	a1, 288 
 	li 	a2, 8
 	mv 	a3, s0
 	 
 	addi 	sp, sp, -8
 	sw 	a1, 0(sp)
 	sw 	a2, 4(sp)
 	 
 	call 	PRINT
 	 
 	lw 	a2, 4(sp)
 	lw 	a1, 0(sp)
 	addi 	sp, sp, 8
 	 
 	# Item
 	la 	t0, HAS_SWORD
 	lb 	t0, 0(t0)
 	beq 	t0, zero, FIM_HUD
 	 
 	la 	a0, espada
 	li 	a1, 292
 	li 	a2, 8
 	call 	PRINT

FIM_HUD:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret

# Desenhar LOJA

DESENHAR_LOJA:
 	# Verificar se estamos na Dungeon
 	lw 	t0, CURR_MAP_IMG 
 	la 	t1, dungeon 
 	bne 	t0, t1, FIM_DESENHO_LOJA 

 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)

 	#ESCUDO
 	 
 	la 	t0, SOLD_SHIELD
 	lb 	t0, 0(t0)
 	bne 	t0, zero, ERASE_SHIELD 	# Se vendido, VAI PARA O APAGAMENTO
 	 
 	# Desenhar Normal
 	la 	a0, escudo
 	li 	a1, 100
 	li 	a2, 120
 	mv 	a3, s0
 	call 	PRINT
 	 
 	# Preço "50"
 	la 	a0, num5
 	li 	a1, 92
 	li 	a2, 104
 	call 	PRINT
 	la 	a0, num0
 	li 	a1, 108
 	call 	PRINT
 	j 	CHECK_KEY_DRAW

ERASE_SHIELD:
 	# Apagar 
 	la 	a0, preto 		# Carrega o sprite do chão
 	mv 	a3, s0
 	 
 	li 	a1, 100 		# Apaga Item
 	li 	a2, 120
 	call 	PRINT
 	 
 	li 	a1, 92 			# Apaga Preço Esq
 	li 	a2, 104
 	call 	PRINT
 	 
 	li 	a1, 108 		# Apaga Preço Dir
 	call 	PRINT

 	#CHAVE
 	 
CHECK_KEY_DRAW:
 	la 	t0, SOLD_KEY
 	lb 	t0, 0(t0)
 	bne 	t0, zero, ERASE_KEY
 	 
 	# Desenhar
 	la 	a0, chave
 	li 	a1, 160
 	li 	a2, 120
 	mv 	a3, s0
 	call 	PRINT
 	 
 	# Preço "80"
 	la 	a0, num8
 	li 	a1, 152
 	li 	a2, 104
 	call 	PRINT
 	la 	a0, num0
 	li 	a1, 168
 	call 	PRINT
 	j 	CHECK_HEART_DRAW

ERASE_KEY:
 	# Apagar
 	la 	a0, preto
 	mv 	a3, s0
 	 
 	li 	a1, 160
 	li 	a2, 120
 	call 	PRINT
 	 
 	li 	a1, 152
 	li 	a2, 104
 	call 	PRINT
 	 
 	li 	a1, 168
 	call 	PRINT

 	#CORACAO
CHECK_HEART_DRAW:
 	la 	t0, SOLD_HEART
 	lb 	t0, 0(t0)
 	bne 	t0, zero, ERASE_HEART
 	 
 	# Desenhar
 	la 	a0, coracao
 	li 	a1, 220
 	li 	a2, 120
 	mv 	a3, s0
 	call 	PRINT
 	 
 	# Preço "10"
 	la 	a0, num1
 	li 	a1, 212
 	li 	a2, 104
 	call 	PRINT
 	la 	a0, num0
 	li 	a1, 228
 	call 	PRINT
 	j 	FIM_DESENHO_LOJA_RET

ERASE_HEART:
 	# Apagar
 	la 	a0, preto
 	mv 	a3, s0
 	 
 	li 	a1, 220
 	li 	a2, 120
 	call 	PRINT
 	 
 	li 	a1, 212
 	li 	a2, 104
 	call 	PRINT
 	 
 	li 	a1, 228
 	call 	PRINT

FIM_DESENHO_LOJA_RET:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
FIM_DESENHO_LOJA:
 	ret

# ========================= #
#   Procedimento de ataque  #

DESENHAR_ATAQUE:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)

 	#limpeza
 	la 	t0, POS_ATAQUE
 	lh 	a1, 0(t0) 		# Carrega X antigo
 	lh 	a2, 2(t0) 		# Carrega Y antigo
 	 
 	# Se X=0, não tem nada para apagar
 	beq 	a1, zero, VERIFICAR_ESTADO 
 	 
 	# Apaga desenhando o chão
 	la 	a0, tile 
 	mv 	a3, s0 			# Frame atual
 	 
 	addi 	sp, sp, -4 		# Salva t0
 	sw 	t0, 0(sp)
 	call 	PRINT
 	lw 	t0, 0(sp)
 	addi 	sp, sp, 4

VERIFICAR_ESTADO:
 	#definir se vai limpar, parar ou atacar
 	la 	t1, TIMER_ATAQUE
 	lb 	t2, 0(t1) 		# t2 = Timer Atual
 	 
 	# Se Timer > 0, vamos desenhar a espada --> ataque
 	bne 	t2, zero, DESENHAR_NOVA_ESPADA
 	 
 	# Se Timer == 0, verificamos se precisamos continuar limpando (Ressaca) -- para evitar espada sobrando
 	la 	t3, CLEANUP_FRAMES
 	lb 	t4, 0(t3)
 	 
 	beq 	t4, zero, ZERAR_MEMORIA # Se Cleanup também é 0, acabou tudo.
 	 
 	# Se Cleanup > 0, apenas decrementamos e saimos (limpamnos no passo 1)
 	addi 	t4, t4, -1
 	sb 	t4, 0(t3)
 	j 	FIM_ATQ

ZERAR_MEMORIA:
 	# Zera o POS_ATAQUE para parar de tentar limpar no futuro
 	sh 	zero, 0(t0)
 	sh 	zero, 2(t0)
 	j 	FIM_ATQ

DESENHAR_NOVA_ESPADA:
 	 
 	# Recarrega o Cleanup para 2 (Garante limpeza dos 2 frames quando acabar)
 	la 	t3, CLEANUP_FRAMES
 	li 	t4, 2
 	sb 	t4, 0(t3)

 	# Carrega Posição do Link
 	la 	t0, CHAR_POS
 	lh 	t1, 0(t0) 		# Link X
 	lh 	t2, 2(t0) 		# Link Y
 	 
 	la 	t0, LINK_DIR
 	lb 	t3, 0(t0) 		# Direção
 	 
 	# Escolhe a direção (0=Baixo, 1=Cima, 2=Esq, 3=Dir)
 	li 	t4, 0
 	beq 	t3, t4, ATQ_BAIXO
 	li 	t4, 1
 	beq 	t3, t4, ATQ_CIMA
 	li 	t4, 2
 	beq 	t3, t4, ATQ_ESQ
 	# Se for 3 cai direto

ATQ_DIR:
 	la 	a0, espada2 		# Horizontal
 	addi 	a1, t1, 16 		# X = Link + 16
 	addi 	a2, t2, 4 		# Y Ajustado
 	j 	DO_PRINT_ATQ

ATQ_ESQ:
 	la 	a0, espada_esq 		# Horizontal
 	addi 	a1, t1, -16 		# X = Link - 16
 	addi 	a2, t2, 4 
 	j 	DO_PRINT_ATQ

ATQ_BAIXO:
 	la 	a0, espada_baixo 	# Vertical
 	addi 	a1, t1, 4 
 	addi 	a2, t2, 14 		# Y = Link + 14
 	j 	DO_PRINT_ATQ

ATQ_CIMA:
 	la 	a0, espada 		# Vertical
 	addi 	a1, t1, 4 
 	addi 	a2, t2, -14 		# Y = Link - 14 --> LEMBRAR QUE OS HORIZONTAIS NAO PODEM NAO SER MULT DE 4
 	# j DO_PRINT_ATQ

DO_PRINT_ATQ:
 	mv 	a3, s0 			# Frame atual
 	 
 	# Salva a nova posição na memória (para limpar no próximo frame)
 	la 	t0, POS_ATAQUE
 	sh 	a1, 0(t0)
 	sh 	a2, 2(t0)
 	 
 	call 	PRINT

FIM_ATQ:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret
 	 
# ========================= #
# PROCEDIMENTO do inimigo

# ==========================================
# MOVIMENTAÇÃO DO INIMIGO (CORRIGIDO: SEM PONTO E VÍRGULA)
# ==========================================

ATUALIZAR_INIMIGO:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)

 	# 1. CHECK DE MAPA
 	lw 	t0, CURR_MAP_IMG
 	la 	t1, mapa1 		# <--- Confirme se é o mapa certo
 	bne 	t0, t1, FIM_UPDATE_INI 

 	# 2. Verifica se está vivo
 	la 	t0, INIMIGO_VIVO
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_UPDATE_INI

 	# --- LIMPEZA DO RASTRO ---
 	la 	t0, OLD_INI_POS 
 	lw 	a0, CURR_MAP_TILE 
 	lh 	a1, 0(t0) 
 	lh 	a2, 2(t0) 
 	mv 	a3, s0 			# Frame oculto
 	 
 	# Expandido:
 	addi 	sp, sp, -4
 	sw 	t0, 0(sp)
 	call 	PRINT
 	lw 	t0, 0(sp)
 	addi 	sp, sp, 4

 	# --- SALVA POSIÇÃO VELHA ---
 	la 	t0, INIMIGO_POS
 	lh 	t1, 0(t0) 		# X atual
 	lh 	t2, 2(t0) 		# Y atual
 	la 	t3, OLD_INI_POS
 	sh 	t1, 0(t3)
 	sh 	t2, 2(t3)

 	# --- CONTROLE DE VELOCIDADE ---
 	la 	t0, TIMER_MOV_INI
 	lb 	t1, 0(t0)
 	bne 	t1, zero, DEC_TIMER_MOV
 	 
 	li 	t1, 25 			# Delay
 	sb 	t1, 0(t0)

 	# --- IA: DECISÃO ---
 	la 	t0, TIMER_MUDAR_DIR 
 	lb 	t1, 0(t0)
 	beq 	t1, zero, SORTEAR_DIRECAO
 	addi 	t1, t1, -1
 	sb 	t1, 0(t0) 
 	j 	CALCULAR_MOVIMENTO

SORTEAR_DIRECAO:
 	# Sorteia passos entre 5 e 20
 	li 	a7, 30
 	ecall
 	andi 	t1, a0, 0x04 		# 0 a 4
 	addi 	t1, t1, 5 		# 5 a 9
 	sb 	t1, 0(t0) 		# Salva no timer
 	 
 	# Sorteia Direção (0-3)
 	andi 	t2, a0, 3 
 	 
 	la 	t3, INI_VEL_X
 	la 	t4, INI_VEL_Y
 	sw 	zero, 0(t3) 		# Zera velocidades
 	sw 	zero, 0(t4)
 	li 	t5, 16 			# Velocidade base

 	beq 	t2, zero, SET_DIR 	# 0 = Dir (+X)
 	li 	t6, 1
 	beq 	t2, t6, SET_ESQ 	# 1 = Esq (-X)
 	li 	t6, 2
 	beq 	t2, t6, SET_BAIXO 	# 2 = Baixo (+Y)
 	j 	SET_CIMA 		# 3 = Cima (-Y)

SET_DIR:
 	sw 	t5, 0(t3)
 	j 	CALCULAR_MOVIMENTO
SET_ESQ:
 	neg 	t5, t5
 	sw 	t5, 0(t3)
 	j 	CALCULAR_MOVIMENTO
SET_BAIXO:
 	sw 	t5, 0(t4)
 	j 	CALCULAR_MOVIMENTO
SET_CIMA:
 	neg 	t5, t5
 	sw 	t5, 0(t4)
 	j 	CALCULAR_MOVIMENTO

CALCULAR_MOVIMENTO:
 	# --- EIXO X ---
 	la 	t0, INIMIGO_POS
 	lh 	t1, 0(t0) 		# X
 	la 	t3, INI_VEL_X
 	lw 	t4, 0(t3) 		# Vel X
 	beq 	t4, zero, EIXO_Y
 	 
 	add 	a1, t1, t4 		# Futuro X
 	lh 	a2, 2(t0) 		# Y atual
 	 
 	# Checa Colisão X
 	addi 	sp, sp, -12
 	sw 	t0, 0(sp)
 	sw 	t1, 4(sp)
 	sw 	t4, 8(sp)
 	 
 	srai 	t3, a1, 4
 	srai 	t4, a2, 4
 	jal 	CHECAR_COLISAO
 	 
 	lw 	t4, 8(sp)
 	lw 	t1, 4(sp)
 	lw 	t0, 0(sp)
 	addi 	sp, sp, 12
 	 
 	bne 	t5, zero, BOUNCE_X 	# Se bater, INVERTE
 	sh 	a1, 0(t0) 		# Se livre, move
 	j 	EIXO_Y

BOUNCE_X:
 	neg 	t4, t4 			# Inverte sinal
 	la 	t3, INI_VEL_X
 	sw 	t4, 0(t3)
 	# Zera timer para mudar direção logo
 	la 	t5, TIMER_MUDAR_DIR
 	sb 	zero, 0(t5)
 	# Não atualiza posição agora

EIXO_Y:
 	# --- EIXO Y ---
 	la 	t0, INIMIGO_POS
 	lh 	t2, 2(t0) 		# Y
 	lh 	t1, 0(t0) 		# X
 	la 	t3, INI_VEL_Y
 	lw 	t6, 0(t3) 		# Vel Y
 	beq 	t6, zero, DESENHAR_INI
 	 
 	add 	a2, t2, t6 		# Futuro Y
 	mv 	a1, t1 			# X atual
 	 
 	# Checa Colisão Y
 	addi 	sp, sp, -12
 	sw 	t0, 0(sp)
 	sw 	t2, 4(sp)
 	sw 	t6, 8(sp)
 	 
 	srai 	t3, a1, 4
 	srai 	t4, a2, 4
 	jal 	CHECAR_COLISAO
 	 
 	lw 	t6, 8(sp)
 	lw 	t2, 4(sp)
 	lw 	t0, 0(sp)
 	addi 	sp, sp, 12
 	 
 	bne 	t5, zero, BOUNCE_Y
 	sh 	a2, 2(t0)
 	j 	DESENHAR_INI

BOUNCE_Y:
 	neg 	t6, t6 			# Inverte sinal
 	la 	t3, INI_VEL_Y
 	sw 	t6, 0(t3)
 	la 	t5, TIMER_MUDAR_DIR
 	sb 	zero, 0(t5)
 	j 	DESENHAR_INI

DEC_TIMER_MOV:
 	addi 	t1, t1, -1
 	sb 	t1, 0(t0)

DESENHAR_INI:
 	# --- DESENHO ---
 	la 	a0, octorok 
 	la 	t0, INIMIGO_POS 
 	lh 	a1, 0(t0)
 	lh 	a2, 2(t0)
 	mv 	a3, s0 			# Frame oculto
 	 
 	# Expandido:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)
 	call 	PRINT
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4

FIM_UPDATE_INI:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret

# ==========================================
# HITBOX: DANO FINAL (SEM PONTO E VIRGULA)
# ==========================================

CHECAR_DANO:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)

 	# 1. Verifica se Inimigo esta Vivo
 	la 	t0, INIMIGO_VIVO
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_DANO

 	# 2. Verifica Invencibilidade
 	la 	t0, TIMER_INVUL
 	lb 	t1, 0(t0)
 	beq 	t1, zero, CHECK_HITBOX_LINK
 	 
 	# Se timer maior que 0 decrementa e sai
 	addi 	t1, t1, -1
 	sb 	t1, 0(t0)
 	j 	FIM_DANO

CHECK_HITBOX_LINK:
 	la 	t0, CHAR_POS
 	lh 	t1, 0(t0)
 	lh 	t2, 2(t0)
 	 
 	la 	t3, INIMIGO_POS
 	lh 	t4, 0(t3)
 	lh 	t5, 2(t3)
 	 
 	# --- CALCULO DE COLISAO X ---
 	sub 	t6, t1, t4
 	bgez 	t6, ABS_X_SAFE
 	sub 	t6, zero, t6
ABS_X_SAFE:
 	li 	a7, 16
 	bge 	t6, a7, FIM_DANO

 	# --- CALCULO DE COLISAO Y ---
 	sub 	t6, t2, t5
 	bgez 	t6, ABS_Y_SAFE
 	sub 	t6, zero, t6
ABS_Y_SAFE:
 	li 	a7, 16 
 	bge 	t6, a7, FIM_DANO
 	 
 	# === COLISAO CONFIRMADA ===
 	 
 	# 3. Tira Vida com SEGURANCA
 	la 	t3, VIDAS
 	lb 	t6, 0(t3)
 	 
 	# Se vida for 0 nao faz nada para nao travar o HUD
 	beq 	t6, zero, FIM_DANO
 	 
 	addi 	t6, t6, -1
 	sb 	t6, 0(t3)
 	 
 	# 4. Ativa Invencibilidade 60 frames
 	la 	t3, TIMER_INVUL
 	li 	t6, 60
 	sb 	t6, 0(t3)
 	 
 	# Som de Dano
 	li 	a7, 31
 	li 	a0, 50
 	li 	a1, 100
 	li 	a2, 11
 	li 	a3, 100
 	ecall

 	# Atualiza HUD
 	call 	ATUALIZAR_HUD

FIM_DANO:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret
# ==========================================
# HITBOX: ESPADA MATA INIMIGO (CORRIGIDO - 1 INSTRUÇÃO POR LINHA)
# ==========================================

CHECAR_HIT_INIMIGO:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)
 	 
 	# Só checa se estiver atacando
 	la 	t0, TIMER_ATAQUE
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_HIT_INI
 	 
 	# Só checa se inimigo vivo
 	la 	t0, INIMIGO_VIVO
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_HIT_INI
 	 
 	# Colisão: POS_ATAQUE vs INIMIGO_POS
 	la 	t0, POS_ATAQUE
 	lh 	t1, 0(t0) 	# Espada X
 	lh 	t2, 2(t0) 	# Espada Y
 	 
 	la 	t0, INIMIGO_POS
 	lh 	t3, 0(t0) 	# Inimigo X
 	lh 	t4, 2(t0) 	# Inimigo Y
 	 
 	# Distância X < 16
 	sub 	t5, t1, t3
 	bgez 	t5, H_DX
 	neg 	t5, t5
H_DX:
 	li 	t6, 16 
 	bge 	t5, t6, FIM_HIT_INI
 	 
 	# Distância Y < 16
 	sub 	t5, t2, t4
 	bgez 	t5, H_DY
 	neg 	t5, t5
H_DY:
 	li 	t6, 16
 	bge 	t5, t6, FIM_HIT_INI
 	 
 	# --- MATOU! ---
 	la 	t0, INIMIGO_VIVO
 	sb 	zero, 0(t0)
 	 
 	# Limpa o inimigo da tela (Frame 0)
 	la 	t0, INIMIGO_POS
 	lw 	a0, CURR_MAP_TILE
 	lh 	a1, 0(t0)
 	lh 	a2, 2(t0)
 	 
 	addi 	sp, sp, -12
 	sw 	a0, 0(sp)
 	sw 	a1, 4(sp)
 	sw 	a2, 8(sp)
 	 
 	li 	a3, 0
 	call 	PRINT 
 	 
 	# Recupera argumentos
 	lw 	a2, 8(sp)
 	lw 	a1, 4(sp)
 	lw 	a0, 0(sp)
 	addi 	sp, sp, 12
 	 
 	# Limpa Frame 1 (necessário salvar novamente na pilha ou re-carregar)
 	# Como PRINT destroi t0-t6 e a0-a3, vamos garantir recarregando ou salvando
 	 
 	addi 	sp, sp, -12
 	sw 	a0, 0(sp)
 	sw 	a1, 4(sp)
 	sw 	a2, 8(sp)
 	 
 	li 	a3, 1
 	call 	PRINT 
 	 
 	lw 	a2, 8(sp)
 	lw 	a1, 4(sp)
 	lw 	a0, 0(sp)
 	addi 	sp, sp, 12

FIM_HIT_INI:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret
 	 
# ========================= #
#  Procedimentos da Musica  #
	
TOCAR_MUSICA:

 	# 1. Pegar o Tempo Atual
 	li 	a7, 30 		# Syscall 30 (Time)
 	ecall
 	mv 	t3, a0 		# t3 = Tempo Atual 

 	# Carrega ponteiro inicial
 	la 	a5, PROXIMA_NOTA_HARPA_TEMPO 

 	lw 	t4, 0(a5) 	# t4 = PROXIMA_NOTA_HARPA_TEMPO
 	 
 	bltu 	t3, t4, CHECAR_OCARINA 

 	# É hora de tocar Harpa
 	beq 	s11, s5, REINICIAR_HARPA #considera quando s5 == limite da musica (tempo final) for igual ao tempo atual (notas decorridas)

REINICIAR_HARPA_FIM:
 	# Carregar e tocar Harpa
 	lw 	a0, 0(s7) 	# Nota
 	lw 	a1, 4(s7) 	# Duração
 	mv 	t1, a1 		# Salva duração em t1
 	li 	a2, 46 		# Instrumento Harpa
 	li 	a3, 90 		# Volume
 	li 	a7, 31 		#Midi nao bloq
 	ecall
 	 
 	la 	a5, PROXIMA_NOTA_HARPA_TEMPO #garantir a nao alteracao apos chamada de ecall
 	 
 	add 	t4, t3, t1 	# ProximaNota = TempoAtual + Duracao
 	sw 	t4, 0(a5) 	# Salva
 	 
 	# Avançar Harpa
 	addi 	s7, s7, 8
 	addi 	s11, s11, 1

CHECAR_OCARINA:
 	 
 	lw 	t4, 4(a5) 	# t4 = PROXIMA_NOTA_OCARINA_TEMPO --- a5 ja foi checado para ver se esta certo (trecho acima)
 	 
 	bltu 	t3, t4, FIM_MUSICA 

 	# É hora de tocar Ocarina
 	beq 	s10, s4, REINICIAR_MELODIA

REINICIAR_MELODIA_FIM:
 	# Carregar e tocar Ocarina
 	lw 	a0, 0(s6)
 	lw 	a1, 4(s6)
 	mv 	t1, a1
 	li 	a2, 79
 	li 	a3, 127
 	li 	a7, 31
 	ecall
 	 
 	la 	a5, PROXIMA_NOTA_HARPA_TEMPO #garantir que o a5 nao tenha sido alterado por ecall
 	 
 	# Atualizar relógio da Ocarina
 	add 	t4, t3, t1
 	sw 	t4, 4(a5) 	
 	 
 	# Avançar Ocarina
 	addi 	s6, s6, 8
 	addi 	s10, s10, 1
 	 
 	j 	FIM_MUSICA 

REINICIAR_MELODIA:
 	mv 	s6, s8 		# Reseta ponteiro Melodia
 	li 	s10, 0 		# Reseta contador Melodia
 	 
 	j 	REINICIAR_MELODIA_FIM

REINICIAR_HARPA:
 	mv 	s7, s9 		# Reseta ponteiro Harpa
 	li 	s11, 0 		# Reseta contador Harpa
 	j 	REINICIAR_HARPA_FIM
 	 
FIM_MUSICA:
 	ret
 	 
TOCAR_KACHING:
 	li 	a7, 31 		# Midi Out
 	li 	a2, 11 		# Instrumento
 	li 	a3, 127 	# Volume

 	li 	a0, 84
 	li 	a1, 100
 	ecall

 	li 	a0, 90
 	li 	a1, 300
 	ecall
 	ret

# ==========================================
# GERENCIAR RASTRO (SISTEMA ANTI-GHOSTING)
# ==========================================
# 1. Limpa o rastro especifico do frame atual
# 2. Salva a posicao atual para limpar no futuro

GERENCIAR_RASTRO:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)

 	# Verifica qual frame estamos (s0) para escolher a variavel certa
 	beq 	s0, zero, CARREGAR_HISTORICO_0
 	 
 	# Se s0 == 1, usa o historico do Frame 1
 	la 	t0, LAST_POS_FRAME_1
 	j 	LIMPAR_RASTRO_HISTORICO

CARREGAR_HISTORICO_0:
 	# Se s0 == 0, usa o historico do Frame 0
 	la 	t0, LAST_POS_FRAME_0

LIMPAR_RASTRO_HISTORICO:
 	# t0 agora tem o endereco da variavel de historico correta
 	# Vamos limpar o que estava desenhado nesse frame
 	 
 	lw 	a0, CURR_MAP_TILE # Carrega tile de fundo
 	lh 	a1, 0(t0) 	# X antigo deste frame
 	lh 	a2, 2(t0) 	# Y antigo deste frame
 	mv 	a3, s0 		# Frame atual
 	 
 	# Salva t0 pois precisaremos dele para guardar a nova posicao
 	addi 	sp, sp, -4
 	sw 	t0, 0(sp)
 	 
 	call 	PRINT
 	 
 	lw 	t0, 0(sp)
 	addi 	sp, sp, 4
 	 
 	# --- SALVAR NOVA POSICAO ---
 	# Agora guardamos onde o Link esta HOJE, para limpar AMANHA
 	 
 	la 	t1, CHAR_POS
 	lh 	t2, 0(t1) 	# X atual
 	lh 	t3, 2(t1) 	# Y atual
 	 
 	sh 	t2, 0(t0) 	# Salva no Historico X
 	sh 	t3, 2(t0) 	# Salva no Historico Y

 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret