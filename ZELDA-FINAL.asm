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
	.include "sprites/mapafinal.s"
	
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
 
 	.align 2
	.include "sprites/puzzle.s"
	
	.align 2
	.include "sprites/moblin.s"
	
	.align 2
	.include "sprites/pedra.s"
	 
	.align 2
	.include "sprites/inicial.s"
	 
	.align 2
	.include "sprites/gameover.s"
	
	.align 2
	.include "sprites/gate.s"
	
# ===================== #
# MOVIMENTACAO

CHAR_POS:		.half 64, 64			# x, y
OLD_CHAR_POS: 		.half 64, 64
LAST_POS_FRAME_0: 	.half 64, 64
LAST_POS_FRAME_1: 	.half 64, 64

# ===================== #
# ESPADA
SWORD_POS:		.half 80, 80 	#posica espada mapa
HAS_SWORD:		.byte 0		# Flag de estado: 0 = No mapa, 1 = JÃ¡ foi pega

# ===================== #
# HUD
VIDAS: 		.byte 3		#flag para vidas
.align 2
RUPY:		.word 50		#flag para moedas

# ===================== #

# PUZZLE
CRISTAL_POS:		.half 272, 128	# Coordenadas puzzle
FEZ_PUZZLE:		.byte 0		# Flag se concluiu puzzle

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
# DADOS DOS INIMIGOS E COMBATE

# OCTOROK
OCTOROK_POS: 		.half 160, 144 	# PosiÃ§Ã£o Inicial X, Y
OLD_OCT_POS: 		.half 160, 144 	# Para limpar o rastro
OCTOROK_VIVO: 		.byte 1 	# 1 = Vivo, 0 = Morto
.align 2
OCT_VEL_X: 		.word -8 	# Velocidade horizontal
OCT_VEL_Y: 		.word -8 	# Velocidade vertical

# MOBLIN 
MOBLIN_POS:		.half 160, 80 	# Posicao Inicial X, Y 
OLD_MOBLIN_POS: 	.half 160, 80	# Posicao Anterior
MOBLIN_VIVO: 		.byte 1 	# 1 = Vivo, 0 = Morto
TIMER_TIRO_MOBLIN: 	.byte 25 	# Timer para proximo tiro
MOBLIN_DIR: 		.byte 0 	# Direcao do Moblin

# PROJETIL
.align 2
STONE_POS: 		.word 0 	# Posicao da pedra
.align 2
OLD_STONE_POS:		.word 0, 0	# Posicao Anterior da pedra
.align 2
STONE_VEL_X: 		.word 0 	# Velocidade horizontal da pedra
STONE_VEL_Y: 		.word 0 	# Velocidade vertical da pedra
STONE_ACTIVE: 		.byte 0 	# Verifica se a pedra ainda existe	
.align 2
LAST_STONE_FRAME_0: 	.word 0 	
.align 2
LAST_STONE_FRAME_1: 	.word 0 	
STONE_SPRITE: .word pedra

# Drops (inimigos dropam rupys quando morrem)
DROP_POS:       .word 0, 0      # X, Y da rupy
DROP_ACTIVE:    .word 0         # 0 = nada, 1 = tem rupy no chÃ£o

# Timers
TIMER_MOV_OCT: 		.byte 0 	# Controla a VELOCIDADE (Delay)
TIMER_MUDAR_DIR: 	.byte 0 	# Controla a mudanÃ§a de direÃ§Ã£o aleatÃ³ria
TIMER_INVUL: 		.byte 0 	# Tempo que o Link fica invulnerÃ¡vel apÃ³s levar dano


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
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1
.byte 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1
.byte 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1
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
.byte 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 8, 1, 0, 0, 1, 1, 0, 0, 0, 1
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


mapafinal_colisao:


.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

# --- GERENCIAMENTO DE MAPAS ---

# Ponteiros para o mapa atual (Inicializados com Mapa 1)
CURR_MAP_IMG: 	.word mapa1
CURR_MAP_COL: 	.word mapa1_colisao
CURR_MAP_TILE: 	.word tile

# Tabela de transicao
# Estrutura: [numero no mapa de colisao, endereÃ§o mapa, endereÃ§o mapa de colsiao, Novo_Link_X, Novo_Link_Y, tile usada]
# Exemplo: Se pisar no Tile 2, vai pro Mapa 2, nas coordenadas (16, 120), usando a imagem 'tile' para cobrir o rastro
	.align 2
PORTAL_TABLE:
	.word 2, mapa2, mapa2_colisao, 16, 128, tile 	# SaÃ­da do Mapa 1 p/ Mapa 2
	.word 3, mapa3, mapa3_colisao, 144, 192, tile2 	# SaÃ­da do mapa 2 p/ Mapa 3
	.word 4, mapa1, mapa1_colisao, 288, 128, tile 	# SaÃ­da do Mapa 2 p/ Mapa 1
	.word 5, dungeon, dungeon_colisao, 160, 208, preto # SaÃ­da do Mapa 1 p/ Dungeon
	.word 6, mapa2, mapa2_colisao, 144, 64, tile 	# SaÃ­da do Mapa 3 p/ Mapa 2
	.word 7, mapa1, mapa1_colisao, 144, 48, tile 	# SaÃ­da da Dungeon p/ Mapa 1
	.word 8, mapafinal, mapafinal_colisao, 160, 128, tile
	.word 0 					# Fim da tabela


.text


MAIN:   # Mapa ---------

	
	la a0, inicial			# imprime a tela inicial
	li a1, 0
	li a2, 0
	li a3, 0
	call PRINT			
	li a3,1				
	call PRINT			
	
	LOOP_INICIAL:
	
	li t1,0xFF200000		# carrega o endere o de controle do KDMMIO
	lw t0,0(t1)			# Le bit de Controle Teclado # endereco da flag tecla apertada 
 	andi t0,t0,0x0001		# mascara o bit menos significativo
 					# (l? do endereco controle de teclado uma flag (0 = tecla apertada | 1 = tecla apertada)			
 	beq t0,zero,LOOP_INICIAL	# se nao aperta nenhuma tecla segue na tela inicial, mas se apertar comeÃ§a o jogo
 	
	 
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
	li s3,0				#flag de animaÃ§Ã£o (pÃ©s do link)
	
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

 
  	lw t0, CURR_MAP_IMG	# Verifica se estÃ¡ na tela final
    	la t1, mapafinal
    	bne t0,t1, NAO_EH_FIM	# Caso esteja acaba
    	j SAIR_DO_JOGO
 
 	NAO_EH_FIM:	
    	la t2, mapa2		# Verifica se estÃ¡ no mapa 2	
    	bne t0, t2, NAO_PUZZLE
    	la t3, FEZ_PUZZLE	# Caso esteja, quer dizer que e o mapa onde tem o puzzle
    	lb t3, 0(t3)		
    	bne t3, zero, NAO_PUZZLE
    	
    	call PRINT_GRADE 	# Se o puzzle nÃ£o tiver sido completo, bloqueia a passagem pro mapa 3
    	
    	NAO_PUZZLE: 
    	
	call 	KEY_SELECT 
 	
 	
	# Alternar Frame
	xori 	s0, s0, 1 
 
	#LIMPEZA
	call 	GERENCIAR_RASTRO
	call    CHECAR_FEZ_PUZZLE
	# Logicas do Jogo
	call 	CHECAR_PEGOU_ESPADA
	call 	TOCAR_MUSICA
	call CHECAR_PEGOU_DROP
	
	# Inimigos
	call 	ATUALIZAR_OCTOROK 
	call 	CHECAR_DANO 
	call 	CHECAR_HIT_OCTOROK 
	call 	ATUALIZAR_MOBLIN        
    	call 	ATUALIZAR_PEDRA         
    	call 	CHECAR_DANO_PEDRA
	call 	CHECAR_HIT_MOBLIN
    	call 	DESENHAR_DROP
    	
	# Puzzle
	call	CHECAR_HIT_PUZZLE
	  	
	# Loja e CenÃ¡rio
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

	li t1,0xFF200000		# carrega o endereco de controle do KDMMIO
	
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
 	
	# ===========================
       # AREA DE CHEATS 
    	# ===========================
    
    # Cheat 1: Tecla 'p'
    li t0, 'p'
    bne t2, t0, TRY_CHEAT_H     # Se NÃO for 'p', tenta o próximo
    j CHEAT_RICAO               # Se for 'p', usa JUMP (alcança longe)

	TRY_CHEAT_H:
    # Cheat 2: Tecla 'h'
    li t0, 'h'
    bne t2, t0, TRY_CHEAT_K     # Se NÃO for 'h', tenta o próximo
    j CHEAT_VIDA                # Se for 'h', usa JUMP

	TRY_CHEAT_K:
    # Cheat 3: Tecla 'k'
    li t0, 'k'
    bne t2, t0, FIM_CHEATS      # Se NÃO for 'k', segue a vida
    j CHEAT_CHAVE               # Se for 'k', usa JUMP

	FIM_CHEATS:
    # ===========================
 	
 	
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
 	# a0 contÃ©m o ID do mapa novo
 	la t0, PORTAL_TABLE 		# Carrega a tabela dos mapas em t0
 	 
LOOP_PORTAL:
 	lw t1, 0(t0) 			# LÃª o ID na tabela
 	beq t1, zero, FIM_MUDANCA 	# Se 0, fim da tabela
 	beq t1, a0, ACHOU_PORTAL
 	 
 	addi t0, t0, 24 		# Pula para prÃ³xima linha da tabela (6 words * 4 bytes = 24)
 	j LOOP_PORTAL

ACHOU_PORTAL:
    # t0 aponta para a linha correta da tabela
    
    # --- VERIFICAÃ‡ÃƒO DE CHAVE PARA O MAPA 8 ---
    lw t1, 0(t0)            # Carrega o ID do portal
    li t2, 8                # ID do Mapa Final
    bne t1, t2, CARREGAR_MAPA_NORMAL # Se nÃ£o for o 8, segue normal
    
    # Se for o 8, verifica a chave
    la t2, HAS_KEY
    lb t2, 0(t2)            # Carrega o VALOR (0 ou 1) de HAS_KEY
    beq t2, zero, FIM_MUDANCA # Se for 0 (sem chave), CANCELA (volta pro game loop)

CARREGAR_MAPA_NORMAL:
  
    lw t1, 4(t0)            # Carrega endereÃ§o da imagem do mapa
    la t2, CURR_MAP_IMG
    sw t1, 0(t2)            # Salva na variavel global
    lw t1, 8(t0)            # Carrega endereÃ§o da colisÃ£o
    la t2, CURR_MAP_COL
    sw t1, 0(t2)            
    
    lw t1, 12(t0)           # Novo X do link
    lw t2, 16(t0)           # Novo Y do link
    la t3, CHAR_POS
    sh t1, 0(t3)         
    sh t2, 2(t3)          
    
    la t3, OLD_CHAR_POS
    sh t1, 0(t3)            # Inicializa com a nova coordenada do link pois trocou de mapa
    sh t2, 2(t3)            

    lw t1, 20(t0)           
    la t2, CURR_MAP_TILE	# Atualiza a tile para a correspondente ao mapa
    sw t1, 0(t2)           
    
    
    # Printa o mapa novo em ambos os frames
    addi sp, sp, -4
    sw ra, 0(sp)            
    
    lw a0, CURR_MAP_IMG     
    li a1, 0
    li a2, 0
    
    li a3, 0             
    call PRINT
    li a3, 1                
    call PRINT
    
    lw ra, 0(sp)
    addi sp, sp, 4
    
FIM_MUDANCA:
    j GAME_LOOP


CHECK_MAPAFINAL:
	li t1, 1
	la t2, HAS_KEY		# Verifica se o jogador tem a chave, ou seja, se pode acessar a tela final (acabar o jogo)
	bne t1,t2, GAME_LOOP
	ret
	
PRINT_GRADE:
	addi sp, sp, -4 		#uma vez que chamaremos print e perderemos o endereco de retorno,
	 		 		#salva o endereco de retorn em sp que depois sera restaurado
	sw ra, 0(sp)
	la a0, gate			
	li a1, 144			# Printa uma grade na posiÃ§Ã£o exata da passagem para o mapa 3
	li a2, 48
	li a3, 0			
	call PRINT
	li a3, 1			
	call PRINT
	
	# Printa o cristal do puzzle
	la t0, CRISTAL_POS		
	la a0, puzzle			
	lh a1, 0(t0)				
	lh a2, 2(t0)			
	li a3, 0			
	call PRINT
	li a3, 1			
	call PRINT
	
	# Recupera o endereÃ§o de retorno (gameloop)
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
	
CHECAR_FEZ_PUZZLE:
	la t0, FEZ_PUZZLE
	lbu t0, 0(t0)
	beq t0, zero, FIM_CHECAR_PUZZLE  #Se nÃ£o fez o puzzle sai
 	
 	lw t0, CURR_MAP_IMG
	la t2, mapa2
    	bne t0, t2, FIM_CHECAR_PUZZLE	# Se fez o puzzle mas nÃ£o esta no mapa 2 sai 	
    	

	
	addi sp, sp, -4 		#uma vez que chamaremos print e perderemos o endereco de retorno,
	 		 		#salva o endereco de retorn em sp que depois sera restaurado
	sw ra, 0(sp)
	
	la a0, tile			# Carrega o sprite tile	
	li a1, 144			# x da grade
	li a2, 48			# y da grade

	# Apaga as grades da passagem
	li a3, 0			
	call PRINT			
	
	li a3, 1			
	call PRINT			
	
	# Libera a passagem no mapa de colisÃ£o
	la t0, mapa2_colisao    # Carrega o endereÃ§o base do mapa
	li t1, 69               # Localiza o tile da passagem no mapa (Linha 3 * 20) + Coluna 9
	add t0, t0, t1          # Soma para achar o endereÃ§o exato do byte
	sb zero, 0(t0)		# Seta o tile pra 0 (tile livre)
	
	# Tira a colisÃ£o do cristal do puzzle no mapa de colisÃ£o
	la t0, mapa2_colisao    # Carrega o endereÃ§o base do mapa
	li t1, 177               # Localiza o cristal no mapa de colisÃ£o
	add t0, t0, t1          # Soma para achar o endereÃ§o exato do byte
	sb zero, 0(t0)		# Seta o tile pra 0 (tile livre)
	
	#restaura o endereco de retorno para o game_loop
	lw ra, 0(sp)
	addi sp, sp, 4
	
FIM_CHECAR_PUZZLE: ret
   	 
CHECAR_HIT_PUZZLE:
	
	# Salva endereco de retorno
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)
 	 
 	# SÃ³ checa se estiver atacando
 	la 	t0, TIMER_ATAQUE
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_HIT_PUZZLE
 	 
 	# SÃ³ checa se o puzzle nao tiver sido completado ainda
 	la 	t0, FEZ_PUZZLE
 	lb 	t1, 0(t0)
 	bne	t1, zero, FIM_HIT_PUZZLE
 	 
 	# ColisÃ£o: POS_ATAQUE vs CRISTAL_POS
 	la 	t0, POS_ATAQUE
 	lh 	t1, 0(t0) 	# Espada X
 	lh 	t2, 2(t0) 	# Espada Y
 	 
 	la 	t0, CRISTAL_POS
 	lh 	t3, 0(t0) 	# Cristal X
 	lh 	t4, 2(t0) 	# Cristal Y
 	 
 	# DistÃ¢ncia X < 16
 	sub 	t5, t1, t3
 	bgez 	t5, P_X
 	neg 	t5, t5
P_X:
 	li 	t6, 16 
 	bge 	t5, t6, FIM_HIT_PUZZLE
 	 
 	# DistÃ¢ncia Y < 16
 	sub 	t5, t2, t4
 	bgez 	t5, P_Y
 	neg 	t5, t5
P_Y:
 	li 	t6, 16
 	bge 	t5, t6, FIM_HIT_PUZZLE
 	 
 	# Destruiu o cristal
 	la 	t0, FEZ_PUZZLE
 	li	t1, 1
 	sb 	t1, 0(t0)
 	 
	# Apaga o cristal  
	la t0, CRISTAL_POS
	lw a0, CURR_MAP_TILE
	lh a1, 0(t0)
	lh a2, 2(t0)
    
	addi sp, sp, -12
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
    
	li a3, 0
	call PRINT          
    
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw a2, 8(sp)
	addi sp, sp, 12
    
	li a3, 1
	call PRINT          

FIM_HIT_PUZZLE:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret   	
       	 
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
 	lb 	t6, 0(t6)
 	bne 	t6, zero, CHECK_KEY_BUY

 	#colisao x
 	sub 	t0, t1, t3
 	bgez 	t0, SHIELD_X_OK
 	sub 	t0, zero, t0
SHIELD_X_OK:
 	li 	t6, 16
 	bgt 	t0, t6, CHECK_KEY_BUY

 	#colisao y
 	sub 	t0, t2, t4
 	bgez 	t0, SHIELD_Y_OK
 	sub 	t0, zero, t0
SHIELD_Y_OK:
 	bgt 	t0, t6, CHECK_KEY_BUY

 	# Check Dinheiro
 	la 	t0, RUPY
 	lw 	t6, 0(t0)
 	blt 	t6, t5, CHECK_KEY_BUY

 	# COMPRA!
 	sub 	t6, t6, t5
 	sw 	t6, 0(t0)

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
 	lb 	t6, 0(t6)
 	bne 	t6, zero, CHECK_HEART_BUY

 	sub 	t0, t1, t3
 	bgez 	t0, KEY_X_OK
 	sub 	t0, zero, t0
KEY_X_OK:
 	li 	t6, 16
 	bgt 	t0, t6, CHECK_HEART_BUY

 	sub 	t0, t2, t4
 	bgez 	t0, KEY_Y_OK
 	sub 	t0, zero, t0
KEY_Y_OK:
 	bgt 	t0, t6, CHECK_HEART_BUY

 	la 	t0, RUPY
 	lw 	t6, 0(t0)
 	blt 	t6, t5, CHECK_HEART_BUY

 	sub 	t6, t6, t5
 	sw 	t6, 0(t0)

 	li 	t6, 1
 	la 	t0, SOLD_KEY
 	sb 	t6, 0(t0)
 	la 	t0, HAS_KEY
 	sb 	t6, 0(t0)

 	call 	TOCAR_KACHING
 	j 	RET_LOJA

CHECK_HEART_BUY:
 	# === CORAÃ‡ÃƒO ===
 	li 	t3, 220
 	li 	t4, 120
 	li 	t5, 10

 	la 	t6, SOLD_HEART
 	lb 	t6, 0(t6)
 	bne 	t6, zero, RET_LOJA

 	sub 	t0, t1, t3
 	bgez 	t0, HEART_X_OK
 	sub 	t0, zero, t0
HEART_X_OK:
 	li 	t6, 16
 	bgt 	t0, t6, RET_LOJA

 	sub 	t0, t2, t4
 	bgez 	t0, HEART_Y_OK
 	sub 	t0, zero, t0
HEART_Y_OK:
 	bgt 	t0, t6, RET_LOJA

 	la 	t0, RUPY
 	lw 	t6, 0(t0)
 	blt 	t6, t5, RET_LOJA

 	sub 	t6, t6, t5
 	sw 	t6, 0(t0)

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
# ATUALIZAR HUD 
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
 	li 	a1, 96
 	li 	a2, 16
 	li 	t4, 3

LOOP_RUPIAS:
	li 	t1, 10
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
 	 
 	# PreÃ§o "50"
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
 	la 	a0, preto 		# Carrega o sprite do chÃ£o
 	mv 	a3, s0
 	 
 	li 	a1, 100 		# Apaga Item
 	li 	a2, 120
 	call 	PRINT
 	 
 	li 	a1, 92 			# Apaga PreÃ§o Esq
 	li 	a2, 104
 	call 	PRINT
 	 
 	li 	a1, 108 		# Apaga PreÃ§o Dir
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
 	 
 	# PreÃ§o "80"
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
 	 
 	# PreÃ§o "10"
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
 	 
 	# Se X=0, nÃ£o tem nada para apagar
 	beq 	a1, zero, VERIFICAR_ESTADO 
 	 
 	# Apaga desenhando o chÃ£o
 	lw 	a0, CURR_MAP_TILE 
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
 	 
 	beq 	t4, zero, ZERAR_MEMORIA # Se Cleanup tambÃ©m Ã© 0, acabou tudo.
 	 
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

 	# Carrega PosiÃ§Ã£o do Link
 	la 	t0, CHAR_POS
 	lh 	t1, 0(t0) 		# Link X
 	lh 	t2, 2(t0) 		# Link Y
 	 
 	la 	t0, LINK_DIR
 	lb 	t3, 0(t0) 		# DireÃ§Ã£o
 	 
 	# Escolhe a direÃ§Ã£o (0=Baixo, 1=Cima, 2=Esq, 3=Dir)
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
 	 
 	# Salva a nova posiÃ§Ã£o na memÃ³ria (para limpar no prÃ³ximo frame)
 	la 	t0, POS_ATAQUE
 	sh 	a1, 0(t0)
 	sh 	a2, 2(t0)
 	 
 	call 	PRINT

FIM_ATQ:
 	lw 	ra, 0(sp)
 	addi 	sp, sp, 4
 	ret
 	 
# ========================= #
# 	  INIMIGO	    #
# ========================= #

ATUALIZAR_OCTOROK:
	addi 	sp, sp, -4
	sw 	ra, 0(sp)

	# Checa se esta no mapa certo (o octorok so spawna no mapa 1)
	lw 	t0, CURR_MAP_IMG
	la 	t1, mapa1 		
	bne 	t0, t1, FIM_UPDATE_OCT

	# Verifica se o Octorok ainda ta vivo
	la 	t0, OCTOROK_VIVO
	lb 	t1, 0(t0)
	beq 	t1, zero, FIM_UPDATE_OCT

	# Limpeza do rastro
	la 	t0, OLD_OCT_POS 
	lw 	a0, CURR_MAP_TILE 
	lh 	a1, 0(t0) 
	lh 	a2, 2(t0) 
	mv 	a3, s0 			
	
	addi 	sp, sp, -4
	sw 	t0, 0(sp)
	call 	PRINT
	lw 	t0, 0(sp)
	addi 	sp, sp, 4

	# Atualiza posicao antiga
	la 	t0, OCTOROK_POS
	lh 	t1, 0(t0) 		
	lh 	t2, 2(t0) 		
	la 	t3, OLD_OCT_POS
	sh 	t1, 0(t3)
	sh 	t2, 2(t3)

	# Controle de velocidade
	la 	t0, TIMER_MOV_OCT
	lb 	t1, 0(t0)
	bne 	t1, zero, DEC_TIMER_MOV
	
	li 	t1, 2 			
	sb 	t1, 0(t0)


# ==================================== #
#  Procedimento pra calcular movimento #
# ==================================== #
CALCULAR_MOVIMENTO:
	
	# Calcula nova posiÃ§Ã£o x (pos atual + velocidade)
	la 	t0, OCTOROK_POS
	lh 	t1, 0(t0) 		
	la 	t3, OCT_VEL_X
	lw 	t4, 0(t3) 		
	add 	a1, t1, t4 		
	
	# Checa ColisÃ£o X
	lh 	a2, 2(t0) 		
	
	
	# Se Vel > 0 (Direita), checamos o pixel X+15 
	# Se Vel < 0 (Esquerda), checamos o pixel X 
	
	mv 	t5, a1 			# t5 recebe a coordenada X original
	bltz 	t4, CHECK_GRID_X 	# Se velocidade negativa, t5 jÃ¡ Ã© o ponto certo
	addi 	t5, a1, 15 		# Se positiva, t5 = X + 15 (lado direito do sprite)
	
CHECK_GRID_X:
	# Salva contexto
	addi 	sp, sp, -12
	sw 	t0, 0(sp)
	sw 	t1, 4(sp)
	sw 	t4, 8(sp) 		# Salva Vel X
	
	# Converte coordenada de teste (t5) para Grid
	srai 	t3, t5, 4 		# Grid X (Usando o ponto corrigido t5)
	srai 	t4, a2, 4 		# Grid Y (Y atual)
	jal 	CHECAR_COLISAO
	
	# Recupera contexto
	lw 	t4, 8(sp)
	lw 	t1, 4(sp)
	lw 	t0, 0(sp)
	addi 	sp, sp, 12
	
	# t5 agora contem o retorno da colisao (0 ou 1)
	bne 	t5, zero, COLISAO_X
	
	# Sem colisÃ£o X: Atualiza X na memÃ³ria
	sh 	a1, 0(t0)
	j 	EIXO_Y

COLISAO_X:
	neg 	t4, t4 			# Inverte X
	la 	t3, OCT_VEL_X
	sw 	t4, 0(t3)
	# NÃ£o atualiza posiÃ§Ã£o X neste frame

	
EIXO_Y:
	# Calcula nova posiÃ§Ã£o y (pos atual + velocidade)
	la 	t0, OCTOROK_POS
	lh 	t2, 2(t0) 		# Y Atual (Recarrega)
	lh 	t1, 0(t0) 		# X Atual (Pode ter mudado acima)
	la 	t3, OCT_VEL_Y
	lw 	t6, 0(t3) 		
	add 	a2, t2, t6 		
	
	# Checa ColisÃ£o Y
	mv 	a1, t1 			
	

	# Se Vel > 0 (Baixo), checamos Y+15 (PÃ©s)
	# Se Vel < 0 (Cima), checamos Y (CabeÃ§a)
	mv 	t5, a2 			# t5 recebe a coordenada Y original
	bltz 	t6, CHECK_GRID_Y
	addi 	t5, a2, 15 		# Se positivo, t5 = Y + 15 (PÃ©s)
	
CHECK_GRID_Y:
	addi 	sp, sp, -12
	sw 	t0, 0(sp)
	sw 	t2, 4(sp)
	sw 	t6, 8(sp) 		# Salva Vel Y
	
	srai 	t3, a1, 4 		# Grid X (X atual)
	srai 	t4, t5, 4 		# Grid Y (Usando Y corrigido t5)
	jal 	CHECAR_COLISAO
	
	lw 	t6, 8(sp)
	lw 	t2, 4(sp)
	lw 	t0, 0(sp)
	addi 	sp, sp, 12
	
	bne 	t5, zero, COLISAO_Y
	
	# Sem colisÃ£o Y: Atualiza Y na memÃ³ria
	sh 	a2, 2(t0)
	j 	DESENHAR_OCT

COLISAO_Y:
	neg 	t6, t6 			# Inverte Y
	la 	t3, OCT_VEL_Y
	sw 	t6, 0(t3)
	j 	DESENHAR_OCT

# Timer--
DEC_TIMER_MOV:
	addi 	t1, t1, -1
	sb 	t1, 0(t0)

# =================================== #
#  Procedimento para desenhar octorok #
# =================================== #
DESENHAR_OCT:
	la 	a0, octorok 
	la 	t0, OCTOROK_POS 
	lh 	a1, 0(t0)
	lh 	a2, 2(t0)
	mv 	a3, s0 			
	
	addi 	sp, sp, -4
	sw 	ra, 0(sp)
	call 	PRINT
	lw 	ra, 0(sp)
	addi 	sp, sp, 4

FIM_UPDATE_OCT:
	lw 	ra, 0(sp)
	addi 	sp, sp, 4
	ret
	

# =============================== #
#  Procedimento ataque do octorok #
# =============================== #
CHECAR_DANO:
   	addi sp, sp, -4
	sw ra, 0(sp)
	
	# Checa se o link esta invulneravel
	la t0, TIMER_INVUL
	lb t1, 0(t0)
	beq t1, zero, VERIFICAR_OCTOROK_VIVO  
    
    	# Se timer > 0, decrementa e SAI (Link estÃ¡ invulnerÃ¡vel a tudo)
	addi t1, t1, -1
	sb t1, 0(t0)
	j FIM_DANO

# Verifica se octorok ainda ta vivo
VERIFICAR_OCTOROK_VIVO:
	la t0, OCTOROK_VIVO
	lb t1, 0(t0)
	beq t1, zero, FIM_DANO

# Verifica se octorok colidiu (atacou) com o link
CHECK_HITBOX_LINK:
	la t0, CHAR_POS
	lh t1, 0(t0)
	lh t2, 2(t0)
    
	la t3, OCTOROK_POS
	lh t4, 0(t3)
	lh t5, 2(t3)
    
    # Calculo de colisao x
    	sub t6, t1, t4
   	bgez t6, ABS_X_SAFE
    	neg t6, t6 # (sub t6, zero, t6)
    	
ABS_X_SAFE:
    	li a7, 16
   	bge t6, a7, FIM_DANO

    # Calculo de colisao y
    	sub t6, t2, t5
    	bgez t6, ABS_Y_SAFE
    	neg t6, t6 # (sub t6, zero, t6)
ABS_Y_SAFE:
    	li a7, 16 
    	bge t6, a7, FIM_DANO
    
    # Colisao confirmada
    
    # Tira Vida do link
   	la t3, VIDAS
    	lb t6, 0(t3)
    
    # Se vida for 0 gameover
        li t5,1
    	beq t6, t5, GAME_OVER
    	sb t6,0(t3)
    
    # Logica do escudo
	la t2, HAS_SHIELD
	lb t5, 0(t2)
	li t4 , 1
	beq t5, t4, SHIELD    
	addi t6, t6, -1
	sb t6, 0(t3)
    
    # Ativa Invencibilidade 60 frames
    	la t3, TIMER_INVUL
    	li t6, 60
    	sb t6, 0(t3)
    
    # Som de Dano
    	li a7, 31
    	li a0, 50
    	li a1, 100
    	li a2, 11
    	li a3, 100
    	ecall

    # Atualiza HUD
    	call ATUALIZAR_HUD
    
FIM_DANO:
    	lw ra, 0(sp)
    	addi sp, sp, 4
    	ret

SHIELD: 
    	li t4, 0
    	sb t4, 0(t2) # Perde o escudo
    	#Ativa invulnerabilidade
    	la t3, TIMER_INVUL
    	li t6, 60
    	sb t6, 0(t3)
    	j FIM_DANO
	

# =================== #
#  Ataque ao octorok  #
# =================== #

CHECAR_HIT_OCTOROK:
 	addi 	sp, sp, -4
 	sw 	ra, 0(sp)
 	 
 	# SÃ³ checa se estiver atacando
 	la 	t0, TIMER_ATAQUE
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_HIT_OCT
 	 
 	# SÃ³ checa se octorok vivo
 	la 	t0, OCTOROK_VIVO
 	lb 	t1, 0(t0)
 	beq 	t1, zero, FIM_HIT_OCT
 	 
 	# ColisÃ£o: POS_ATAQUE vs OCTOROK_POS
 	la 	t0, POS_ATAQUE
 	lh 	t1, 0(t0) 	# Espada X
 	lh 	t2, 2(t0) 	# Espada Y
 	 
 	la 	t0, OCTOROK_POS
 	lh 	t3, 0(t0) 	# Inimigo X
 	lh 	t4, 2(t0) 	# Inimigo Y
 	 
 	# DistÃ¢ncia X < 16
 	sub 	t5, t1, t3
 	bgez 	t5, H_DX
 	neg 	t5, t5
H_DX:
 	li 	t6, 16 
 	bge 	t5, t6, FIM_HIT_OCT
 	 
 	# DistÃ¢ncia Y < 16
 	sub 	t5, t2, t4
 	bgez 	t5, H_DY
 	neg 	t5, t5
H_DY:
 	li 	t6, 16
 	bge 	t5, t6, FIM_HIT_OCT
 	 
 	# Mata o octorok
 	la 	t0, OCTOROK_VIVO
 	sb 	zero, 0(t0)
 	 
 	 
 	# Drop da rupy
	la t0, DROP_ACTIVE
	li t1, 1
	sw t1, 0(t0)
	    
 	# Limpa o inimigo da tela 
 	la t0, OCTOROK_POS
	lh t1, 0(t0)        
	lh t2, 2(t0)        
	    
	la t0, DROP_POS
	sw t1, 0(t0)        # Salva em DROP X
	sw t2, 4(t0)        # Salva em DROP Y
	    
 	la t0, OCTOROK_POS
    	lw a0, CURR_MAP_TILE
    	lh a1, 0(t0)
    	lh a2, 2(t0)
    
    	addi sp, sp, -12
    	sw a0, 0(sp)
    	sw a1, 4(sp)
    	sw a2, 8(sp)
    
    	li a3, 0
    	call PRINT          
    
    	lw a0, 0(sp)
    	lw a1, 4(sp)
    	lw a2, 8(sp)
    	addi sp, sp, 12
    
    	li a3, 1
    	call PRINT         

FIM_HIT_OCT:
    	lw ra, 0(sp)
    	addi sp, sp, 4
    	ret
  
# Desenha a rupy no chao  
DESENHAR_DROP:
    	addi sp, sp, -4
    	sw ra, 0(sp)
    
    # Verifica se drop estÃ¡ ativo
    	la t0, DROP_ACTIVE
   	 lw t1, 0(t0)
    	beq t1, zero, FIM_DESENHO_DROP
    
    # Verifica se tem inimigo no mapa (so tem no 1 e 3)
    	lw t0, CURR_MAP_IMG
    	la t1, mapa1
    	la t2, mapa3
    	beq t0, t2, P
    	bne t0, t1, FIM_DESENHO_DROP
    
    
    	P:
    # Desenha Rupy
    	la a0, rupy
   	la t0, DROP_POS
    	lw a1, 0(t0)        
    	lw a2, 4(t0)        
    	mv a3, s0           # Frame atual
    
   	call PRINT

FIM_DESENHO_DROP:
    	lw ra, 0(sp)
    	addi sp, sp, 4
    	ret

# LÃ³gica pra pegar a rupy do chao
CHECAR_PEGOU_DROP:
    	addi sp, sp, -4
    	sw ra, 0(sp)
    
    # Verifica se ativo
    	la t0, DROP_ACTIVE
    	lw t1, 0(t0)
    	beq t1, zero, FIM_PEGOU_DROP
    
    # Verifica Mapa
    	lw t0, CURR_MAP_IMG
    	la t1, mapa1
    	la t2, mapa3
    	beq t0, t2, PA
    	bne t0, t1, FIM_PEGOU_DROP

    	PA:
    # Carrega PosiÃ§Ãµes
    	la t0, CHAR_POS
    	lh t1, 0(t0)        # Link X
    	lh t2, 2(t0)        # Link Y
    
    	la t0, DROP_POS
    	lw t3, 0(t0)        # Drop X
    	lw t4, 4(t0)        # Drop Y
    
    # DistÃ¢ncia (ColisÃ£o Link x Drop)
    	sub t5, t1, t3
    	bgez t5, D_DX
    	neg t5, t5
D_DX:
    	li t6, 14           # Margem de coleta
    	bge t5, t6, FIM_PEGOU_DROP
    
    	sub t5, t2, t4
    	bgez t5, D_DY
    	neg t5, t5
D_DY:
    	li t6, 14
    	bge t5, t6, FIM_PEGOU_DROP
    
    # Pegou o drop
    
    # Soma o Dinheiro
    	la t0, RUPY
    	lw t1, 0(t0)
     	lw t4, CURR_MAP_IMG
    	la t2, mapa3
    	beq t4, t2, mob
    	addi t1, t1, 20      # +20 Rupys
   	 sw t1, 0(t0)
    	j octo
    	mob:
    	addi t1,t1,70
    	sw t1, 0(t0)
    	octo:
    # Som (Kaching)
    	call TOCAR_KACHING
    
    # Desativar Drop
    	la t0, DROP_ACTIVE
    	sw zero, 0(t0)
    
    # Apaga a rupy    
    	la t0, DROP_POS
    	lw a1, 0(t0)
    	lw a2, 4(t0)
    	lw a0, CURR_MAP_TILE
    
    	addi sp, sp, -12
    	sw a0, 0(sp)
    	sw a1, 4(sp)
    	sw a2, 8(sp)
    
    	li a3, 0
    	call PRINT          
    
    	lw a0, 0(sp)
    	lw a1, 4(sp)
    	lw a2, 8(sp)
    	addi sp, sp, 12
    
    	li a3, 1
    	call PRINT          
    
    #Atualiza a HUD
    	call ATUALIZAR_HUD

FIM_PEGOU_DROP:
    	lw ra, 0(sp)
    	addi sp, sp, 4
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

 	# Ã‰ hora de tocar Harpa
 	beq 	s11, s5, REINICIAR_HARPA #considera quando s5 == limite da musica (tempo final) for igual ao tempo atual (notas decorridas)



REINICIAR_HARPA_FIM:
 	# Carregar e tocar Harpa
 	lw 	a0, 0(s7) 	# Nota
 	lw 	a1, 4(s7) 	# DuraÃ§Ã£o
 	mv 	t1, a1 		# Salva duraÃ§Ã£o em t1
 	li 	a2, 46 		# Instrumento Harpa
 	li 	a3, 90 		# Volume
 	li 	a7, 31 		#Midi nao bloq
 	ecall
 	 
 	la 	a5, PROXIMA_NOTA_HARPA_TEMPO #garantir a nao alteracao apos chamada de ecall
 	 
 	add 	t4, t3, t1 	# ProximaNota = TempoAtual + Duracao
 	sw 	t4, 0(a5) 	# Salva
 	 
 	# AvanÃ§ar Harpa
 	addi 	s7, s7, 8
 	addi 	s11, s11, 1

CHECAR_OCARINA:
 	 
 	lw 	t4, 4(a5) 	# t4 = PROXIMA_NOTA_OCARINA_TEMPO --- a5 ja foi checado para ver se esta certo (trecho acima)
 	 
 	bltu 	t3, t4, FIM_MUSICA 

 	# Ã‰ hora de tocar Ocarina
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
 	 
 	# Atualizar relÃ³gio da Ocarina
 	add 	t4, t3, t1
 	sw 	t4, 4(a5) 	
 	 
 	# AvanÃ§ar Ocarina
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
 	
 	
 	
# ========================================== #
# MOVIMENTACAO DO MOBLIN E LOGICA DE TIRO    #
# (Moblin Parado - Apenas Atira)      	     #
# ========================================== #

ATUALIZAR_MOBLIN:
	addi 	sp, sp, -4
	sw 	ra, 0(sp)
	
	# CHECK DE MAPA (Apenas no mapa 3)
	lw 	t0, CURR_MAP_IMG
	la 	t1, mapa3
	bne 	t0, t1, FIM_UPDATE_MOBLIN

	#  Verifica se esta vivo
	la 	t0, MOBLIN_VIVO
	lb 	t1, 0(t0)
	beq 	t1, zero, FIM_UPDATE_MOBLIN
	
	# Limpa o rastro
	la 	t0, OLD_MOBLIN_POS 
	lw 	a0, CURR_MAP_TILE 
	lh 	a1, 0(t0) 
	lh 	a2, 2(t0) 
	mv 	a3, s0 			
	
	addi 	sp, sp, -4
	sw 	t0, 0(sp)
	call 	PRINT
	lw 	t0, 0(sp)
	addi 	sp, sp, 4
    
    	# Salva posicao velha
    	la 	t0, MOBLIN_POS
	lh 	t1, 0(t0) 		# X atual
	lh 	t2, 2(t0) 		# Y atual
	la 	t3, OLD_MOBLIN_POS
	sh 	t1, 0(t3)
	sh 	t2, 2(t3)
	
	# Timer do tiro
	la 	t0, TIMER_TIRO_MOBLIN
	lb 	t1, 0(t0)
	
	bne 	t1, zero, DEC_TIMER_TIRO # se nao for hora decrementa
	
	li 	t1, 100 		# Delay de tiro (100 frames)
	sb 	t1, 0(t0) 		# Reinicia o timer
	
	# --- INICIA TIRO ---
	call 	INICIAR_TIRO_PEDRA
	j 	DESENHAR_MOBLIN

DEC_TIMER_TIRO:
	addi 	t1, t1, -1
	sb 	t1, 0(t0)

# ================================== #
# Procedimento para desenhar moblin  #
# ================================== #
DESENHAR_MOBLIN:

	la 	a0, moblin		
	la 	t0, MOBLIN_POS
	lh 	a1, 0(t0)
	lh 	a2, 2(t0)
	mv 	a3, s0
	call 	PRINT

FIM_UPDATE_MOBLIN:
	lw 	ra, 0(sp)
	addi 	sp, sp, 4
	ret
	
# ============= #
# INICIAR TIRO  #
# ============= #
INICIAR_TIRO_PEDRA:
	# Salva ra
	addi 	sp, sp, -4
	sw 	ra, 0(sp)

	# Checa se ja tem uma pedra atirada
	la 	t0, STONE_ACTIVE
	lb 	t1, 0(t0)
	bne 	t1, zero, FIM_INICIAR_TIRO # Sai se a pedra ja foi atirada

	# Carrega Posicao
	la 	t2, MOBLIN_POS
	lh 	t3, 0(t2) 		# Moblin X
	lh 	t4, 2(t2) 		# Moblin Y
	
	la 	t5, CHAR_POS
	lh 	t6, 0(t5) 		# Link X
	lh 	t4, 2(t5) 		# Link Y

	# Define Posicao Inicial da Pedra
	la 	t0, STONE_POS
	sh 	t3, 0(t0) 		# Stone X = Moblin X
	sh 	t4, 2(t0) 		# Stone Y = Moblin Y

	# 4. Calcula Vetor de Direcao 
	# Subtrai (Link - Moblin) para obter o vetor direcional
	sub 	t1, t6, t3 		# t1 = dX
	sub 	t2, t4, t4 		# t2 = dY
	
	# Normaliza o vetor 
	mv 	t5, t1 			# |dX|
	bgez 	t1, SKIP_NEG_X
	neg 	t5, t5
SKIP_NEG_X:
	mv 	t6, t2 			# |dY|
	bgez 	t2, SKIP_NEG_Y
	neg 	t6, t6
SKIP_NEG_Y:
	
	# Encontra o maior componente
	mv 	t4, t5 			
	bge 	t5, t6, SKIP_SWAP
	mv 	t4, t6
SKIP_SWAP:
	
	# Para evitar divisao por zero (se Link estiver exatamente no Moblin)
	beq 	t4, zero, FIM_INICIAR_TIRO
	
	# Define a velocidade de tiro (4 pixels por frame)
	li 	t5, 4 			# Velocidade base
	
	# Multiplica dX e dY pela velocidade base e divide pelo maior componente
	mul 	t1, t1, t5 		# dX * 4
	div 	t1, t1, t4 		# (dX * 4) / Max(dX, dY)
	mul 	t2, t2, t5 		# dY * 4
	div 	t2, t2, t4 		# (dY * 4) / Max(dX, dY)

	# Salva Velocidades 
	la 	t0, STONE_VEL_X
	sw 	t1, 0(t0) 		
	la 	t0, STONE_VEL_Y
	sw 	t2, 0(t0) 		

	# Ativa a Pedra
	la 	t0, STONE_ACTIVE
	li 	t1, 1
	sb 	t1, 0(t0)

	# LÃª a posiÃ§Ã£o inicial (onde o Moblin estÃ¡) e salva no histÃ³rico
	la 	t0, STONE_POS
	lw 	t1, 0(t0) 		# LÃª X e Y de uma vez
	
	la 	t2, LAST_STONE_FRAME_0
	sw 	t1, 0(t2)
	la 	t2, LAST_STONE_FRAME_1
	sw 	t1, 0(t2)

FIM_INICIAR_TIRO:
	lw 	ra, 0(sp)
	addi 	sp, sp, 4
	ret
	
# =========================== #
# ATUALIZAR PEDRA (MOVIMENTO) #
# =========================== #

ATUALIZAR_PEDRA:
	addi 	sp, sp, -4
	sw 	ra, 0(sp)

	# CHECK DE MAPA
	lw 	t0, CURR_MAP_IMG
	la 	t1, mapa3
	bne 	t0, t1, FIM_UPDATE_PEDRA

	# Verifica se estÃ¡ ativa
	la 	t0, STONE_ACTIVE
	lb 	t1, 0(t0)
	beq 	t1, zero, FIM_UPDATE_PEDRA

	# Verifica qual frame estamos desenhando (s0)
	beq 	s0, zero, LIMPAR_FRAME_0
	
	# Se s0 == 1, usamos o histÃ³rico do Frame 1
	la 	t0, LAST_STONE_FRAME_1
	j 	DO_STONE_CLEAN

LIMPAR_FRAME_0:
	# Se s0 == 0, usamos o histÃ³rico do Frame 0
	la 	t0, LAST_STONE_FRAME_0

DO_STONE_CLEAN:
	# t0 tem o endereÃ§o da coordenada antiga DESTE frame
	lw 	a0, CURR_MAP_TILE 	# Tile de fundo
	lh 	a1, 0(t0) 		# X antigo
	lh 	a2, 2(t0) 		# Y antigo
	mv 	a3, s0 			# Frame atual
	
	addi 	sp, sp, -4
	sw 	t0, 0(sp)
	call 	PRINT       # Limpa o rastro
	lw 	t0, 0(sp)
	addi 	sp, sp, 4

	# Salva posicao atual
	la 	t1, STONE_POS
	lh 	t2, 0(t1) 		# X Atual
	lh 	t3, 2(t1) 		# Y Atual
	
	sh 	t2, 0(t0) 		
	sh 	t3, 2(t0) 		

	# Calcula movimento
	la 	t4, STONE_VEL_X
	lw 	t5, 0(t4)
	la 	t4, STONE_VEL_Y
	lw 	t6, 0(t4)
	
	add 	t2, t2, t5 		# Novo X
	add 	t3, t3, t6 		# Novo Y
	
	# Checa os limites do mapa
	li 	t4, 16
	blt 	t2, t4, PEDRA_FALHOU 	# Colidiu na esquerda
	li 	t4, 288
	bgt 	t2, t4, PEDRA_FALHOU 	# Coliidiu na direita
	li 	t4, 48
	blt 	t3, t4, PEDRA_FALHOU 	# Colidiu em cima 
	li 	t4, 208
	bgt 	t3, t4, PEDRA_FALHOU 	# Colidiu em baixo

	# SÃ³ chega aqui se estiver DENTRO da tela
	mv 	a1, t2 			# X teste
	mv 	a2, t3 			# Y teste
	srai 	t5, a1, 4       # Grid X
	srai 	t6, a2, 4       # Grid Y
	
	addi 	sp, sp, -12
	sw 	t1, 0(sp) 		# EndereÃ§o STONE_POS
	sw 	t2, 4(sp) 		# Novo X
	sw 	t3, 8(sp) 		# Novo Y
	
	jal 	CHECAR_COLISAO
	
	lw 	t3, 8(sp)
	lw 	t2, 4(sp)
	lw 	t1, 0(sp)
	addi 	sp, sp, 12
	
	bne 	t5, zero, PEDRA_FALHOU 	# Bateu na parede -> DestrÃ³i
	
	# Atualiza posicao
	sh 	t2, 0(t1) 		# Grava Novo X
	sh 	t3, 2(t1) 		# Grava Novo Y

	# Desenha a pedra
	la 	a0, pedra
	mv 	a1, t2
	mv 	a2, t3
	mv 	a3, s0
	call 	PRINT

	j 	FIM_UPDATE_PEDRA
	
PEDRA_FALHOU:
    # Desativa a pedra
    la  t0, STONE_ACTIVE
    sb  zero, 0(t0)

    # Apaga a pedra
    la  t0, STONE_POS
    lh  a1, 0(t0)       
    lh  a2, 2(t0)       
    lw  a0, CURR_MAP_TILE

    addi sp, sp, -12
    sw  a0, 0(sp)
    sw  a1, 4(sp)
    sw  a2, 8(sp)

    li  a3, 0           
    call PRINT

    lw  a2, 8(sp)
    lw  a1, 4(sp)
    lw  a0, 0(sp)
    addi sp, sp, 12

    li  a3, 1           
    call PRINT

    j   FIM_UPDATE_PEDRA
    
FIM_UPDATE_PEDRA:
	lw 	ra, 0(sp)
	addi 	sp, sp, 4
	ret
	
# ============================== #
#   DANO DA PEDRA NO LINK        #
# ============================== #
CHECAR_DANO_PEDRA:
	addi 	sp, sp, -4
	sw 	ra, 0(sp)
	
	# Verifica se a pedra esta ativa
	la 	t0, STONE_ACTIVE
	lb 	t1, 0(t0)
	beq 	t1, zero, FIM_DANO_PEDRA
	
	# Verifica Invencibilidade do Link (omite se invencÃ­vel)
	la 	t0, TIMER_INVUL
	lb 	t1, 0(t0)
	bne 	t1, zero, FIM_DANO_PEDRA
	
	# Carrega PosiÃ§Ãµes (Link t1/t2, Pedra t4/t5)
	la 	t0, CHAR_POS
	lh 	t1, 0(t0) 		# Link X
	lh 	t2, 2(t0) 		# Link Y
	
	la 	t3, STONE_POS
	lh 	t4, 0(t3) 		# Pedra X
	lh 	t5, 2(t3) 		# Pedra Y
	
	# Checagem de ColisÃ£o (DistÃ¢ncia < 16)
	
	# X
	sub 	t6, t1, t4
	bgez 	t6, C_DX
	neg 	t6, t6
C_DX:
	li 	a7, 16
	bge 	t6, a7, FIM_DANO_PEDRA
	
	# Y
	sub 	t6, t2, t5
	bgez 	t6, C_DY
	neg 	t6, t6
C_DY:
	li  a7, 16
	bge t6, a7, FIM_DANO_PEDRA
    
    # Se teve colisao
    
    # Desativa Pedra
	la  t0, STONE_ACTIVE
	sb  zero, 0(t0)
    
    # Apaga a pedra
	la  t0, STONE_POS
	lh  a1, 0(t0)
	lh  a2, 2(t0)
   	lw  a0, CURR_MAP_TILE
    
	addi sp, sp, -12
	sw  a0, 0(sp)
	sw  a1, 4(sp)
	sw  a2, 8(sp)
    
	li  a3, 0         
	call PRINT
    
	lw  a2, 8(sp)
	lw  a1, 4(sp)
	lw  a0, 0(sp)
	addi sp, sp, 12
    
	li  a3, 1        
	call PRINT

    # Logica de escudo
	la t2, HAS_SHIELD
	lb t5, 0(t2)
	li t4, 1
	beq t5, t4, SHIELD
    
    # Tira Vida
	la  t3, VIDAS
	lb  t6, 0(t3)
	beq t6, zero, GAME_OVER
	sb t6,(t3)
    
   
	addi t6, t6, -1
	sb  t6, 0(t3)
	beq t6,zero,GAME_OVER
    
    # Invencibilidade e Som
	la  t3, TIMER_INVUL
	li  t6, 60
	sb  t6, 0(t3)
    
	li  a7, 31      # Som de Dano
	li  a0, 50
	li  a1, 100
	li  a2, 11
	li  a3, 100
	ecall   
	call ATUALIZAR_HUD

FIM_DANO_PEDRA:
	lw  ra, 0(sp)
	addi sp, sp, 4
	ret
	
# ======================== #
# Ataque espada no moblin  #
# ======================== #
CHECAR_HIT_MOBLIN: 

    addi sp, sp, -4
    sw ra, 0(sp)

    # Verifica se estÃ¡ atacando

    la t0, TIMER_ATAQUE
    lb t1, 0(t0)
    beq t1, zero, FIM_HIT_MOBLIN

   
    # Carrega Mapa Atual

    lw t6, CURR_MAP_IMG  # Usa t6 temporariamente (salve se precisar)

    # VERIFICAR OCTOROK (MAPA 1)

    la t1, mapa1
    bne t6, t1, CHECK_MOBLIN_LOGIC # Se nÃ£o for mapa1, pula pro Moblin
    la t0, OCTOROK_VIVO
    lb t1, 0(t0)
    beq t1, zero, FIM_HIT_MOBLIN # Se Octorok morto, sai   

    # ColisÃ£o Espada x Octorok
    la t0, POS_ATAQUE
    lh t1, 0(t0)
    lh t2, 2(t0)
    la t0, OCTOROK_POS
    lh t3, 0(t0)
    lh t4, 2(t0)

    # Dist X
    sub t5, t1, t3
    bgez t5, ABS_DX_OCT
    neg t5, t5

ABS_DX_OCT:
    li t6, 16
    bge t5, t6, FIM_HIT_MOBLIN

    # Dist Y
    sub t5, t2, t4
    bgez t5, ABS_DY_OCT
    neg t5, t5

ABS_DY_OCT:
    li t6, 16
    bge t5, t6, FIM_HIT_MOBLIN

    # MATOU OCTOROK
    la t0, OCTOROK_VIVO
    sb zero, 0(t0)

    # Spawn Drop Octorok
    la t0, DROP_ACTIVE
    li t1, 1
    sw t1, 0(t0)
    la t0, OCTOROK_POS
    lh t1, 0(t0)
    lh t2, 2(t0)
    la t0, DROP_POS
    sw t1, 0(t0)
    sw t2, 4(t0)

    

    j FIM_HIT_MOBLIN # Terminou
CHECK_MOBLIN_LOGIC:
	la t1, mapa3
	bne t6, t1, FIM_HIT_MOBLIN # Se nÃ£o for mapa3, sai
    
	la t0, MOBLIN_VIVO
	lb t1, 0(t0)
	beq t1, zero, FIM_HIT_MOBLIN
    
    # ColisÃ£o Espada x Moblin
	la t0, POS_ATAQUE
	lh t1, 0(t0)
	lh t2, 2(t0)
	la t0, MOBLIN_POS
	lh t3, 0(t0)
	lh t4, 2(t0)
    
	sub t5, t1, t3
	bgez t5, ABS_DX_MOB
	neg t5, t5
ABS_DX_MOB:
	li t6, 16
	bge t5, t6, FIM_HIT_MOBLIN
    
	sub t5, t2, t4
	bgez t5, ABS_DY_MOB
	neg t5, t5
ABS_DY_MOB:
	li t6, 16
	bge t5, t6, FIM_HIT_MOBLIN
    
    # MATOU MOBLIN
	la t0, MOBLIN_VIVO
	sb zero, 0(t0)
    
    # Desativa pedra
	la t0, STONE_ACTIVE
	sb zero, 0(t0)
   
	la t0, DROP_ACTIVE
	li t1, 1
	sw t1, 0(t0)
  
   	la t0, MOBLIN_POS
    	lh t1, 0(t0)
    	lh t2, 2(t0)
    	la t0, DROP_POS
    	sw t1, 0(t0)
    	sw t2, 4(t0)

    # Apaga o Moblin
    	la t0, MOBLIN_POS
    	lw a0, CURR_MAP_TILE
    	lh a1, 0(t0)
    	lh a2, 2(t0)
    
    	addi sp, sp, -12
    	sw a0, 0(sp)
    	sw a1, 4(sp)
    	sw a2, 8(sp)
    	li a3, 0
    	call PRINT
    	lw a2, 8(sp)
    	lw a1, 4(sp)
    	lw a0, 0(sp)
    	addi sp, sp, 12
    	li a3, 1
    	call PRINT

FIM_HIT_MOBLIN:
    	lw ra, 0(sp)
    	addi sp, sp, 4
    	ret
    
# Logica de morte
GAME_OVER:
	# Printa tela de game over
    	la a0, gameover
	li a1, 0
	li a2, 0
	li a3, 0
	call PRINT			# imprime o sprite
	li a3,1				# frame = 1
	call PRINT			# imprime o sprite
	LOOP_GAMEOVER:
	
	   li t1,0xFF200000		# carrega o endere o de controle do KDMMIO
	   lw t0,0(t1)			# Le bit de Controle Teclado # endereco da flag tecla apertada 
	   andi t0,t0,0x0001		# mascara o bit menos significativo
	 					# (l? do endereco controle de teclado uma flag (0 = tecla apertada | 1 = tecla apertada)			
	   beq t0,zero,LOOP_GAMEOVER
 	   lw t2,4(t1)			# le o valor da tecla (no endereco 0xFF200004) #endereco dos valores ASCII
 	
	li t3, 27               # 27 Ã© o cÃ³digo ASCII do ESC
	beq t2, t3, SAIR_DO_JOGO

	li t3, 10               # 10 Ã© o cÃ³digo ASCII do ENTER (\n)
	beq t2, t3, REINICIAR_JOGO
	    
	    # Se nÃ£o for nenhum dos dois, continua esperando
	j LOOP_GAMEOVER	
	
# Encerra o jogo
SAIR_DO_JOGO:
	li a7, 10
	ecall
	
REINICIAR_JOGO:
    # Resetar Link (Vida e PosiÃ§Ã£o)
    la t0, VIDAS
    li t1, 3
    sb t1, 0(t0)
    
    la t0, CHAR_POS
    li t1, 64           # X inicial
    li t2, 64           # Y inicial
    sh t1, 0(t0)
    sh t2, 2(t0)
    
    # Resetar OLD_POS tambÃ©m para nÃ£o dar risco no rastro
    la t0, OLD_CHAR_POS
    sh t1, 0(t0)
    sh t2, 2(t0)
    
    # Resetar Mapa (Volta pro Mapa 1)
    la t0, CURR_MAP_IMG
    la t1, mapa1
    sw t1, 0(t0)
    
    la t0, CURR_MAP_COL
    la t1, mapa1_colisao
    sw t1, 0(t0)
    
    la t0, CURR_MAP_TILE
    la t1, tile
    sw t1, 0(t0)
    
    # Resetar InventÃ¡rio e Loja
   
    la t0, HAS_SWORD
    sb zero, 0(t0)
    
    la t0, HAS_KEY
    sb zero, 0(t0)

    la t0, HAS_SHIELD
    sb zero, 0(t0)
    
    # Resetar Loja (Itens voltam a estar a venda)
    la t0, SOLD_HEART
    sb zero, 0(t0)
    la t0, SOLD_SHIELD
    sb zero, 0(t0)
    la t0, SOLD_KEY
    sb zero, 0(t0)
    
    # Resetar Inimigos
    la t0, OCTOROK_VIVO
    li t1, 1
    sb t1, 0(t0)
    
    la t0, MOBLIN_VIVO
    li t1, 1
    sb t1, 0(t0)
    
    # Resetar posiÃ§Ã£o do inimigo
    la t0, OCTOROK_POS
    li t1, 160
    li t2, 144
    sh t1, 0(t0)
    sh t2, 2(t0)
    
    # Resetar Rupys
    la t0, RUPY
    li t1, 50          
    sh t1, 0(t0)

    j MAIN
# ==========================================
# IMPLEMENTAÇÃO DOS CHEATS (COM CORREÇÃO DE CRASH)
# ==========================================

CHEAT_RICAO:
    addi sp, sp, -4        # 1. Abre espaço na pilha
    sw ra, 0(sp)           # 2. Salva o endereço de retorno

    # Dá muito dinheiro
    la t0, RUPY
    li t1, 999
    sw t1, 0(t0)
    
    call TOCAR_KACHING
    call ATUALIZAR_HUD
    
    lw ra, 0(sp)           # 3. Recupera o endereço de retorno
    addi sp, sp, 4         # 4. Fecha o espaço na pilha
    ret

CHEAT_VIDA:
    addi sp, sp, -4        # Salva RA
    sw ra, 0(sp)

    # Enche os corações
    la t0, VIDAS
    li t1, 3
    sb t1, 0(t0)
    
    # Som
    li a7, 31
    li a0, 72
    li a1, 100
    li a2, 11
    li a3, 100
    ecall
    
    call ATUALIZAR_HUD
    
    lw ra, 0(sp)           # Recupera RA
    addi sp, sp, 4
    ret

CHEAT_CHAVE:
    addi sp, sp, -4        # Salva RA
    sw ra, 0(sp)

    # Dá a chave
    la t0, HAS_KEY
    li t1, 1
    sb t1, 0(t0)
    
    # Marca vendida
    la t0, SOLD_KEY
    li t1, 1
    sb t1, 0(t0)
    
    call TOCAR_KACHING
    call ATUALIZAR_HUD
    
    lw ra, 0(sp)           # Recupera RA
    addi sp, sp, 4
    ret
