.data

# ==============================================================================
# 1. MUSICA E SONS
# ==============================================================================
NUM_MELODIA: 	.word 29
NUM_HARPA:   	.word 96

# Relogios separados para cada instrumento
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

# ==============================================================================
# 2. SPRITES (Imagens)
# ==============================================================================
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
    .align 2
    .include "sprites/pedra.s"

# ==============================================================================
# 3. VARIÁVEIS DE JOGO (Link, Hud, Loja)
# ==============================================================================

# MOVIMENTACAO
CHAR_POS:	    .half 64, 64			# x, y
OLD_CHAR_POS:	.half 64, 64			# x, y

# ESPADA
SWORD_POS:	    .half 80, 80 	# posicao espada mapa
HAS_SWORD:	    .byte 0		    # 0 = No mapa, 1 = Já foi pega

# HUD
VIDAS:    	    .byte 3		    # Quantidade de vidas
RUPY:		    .half 50	    # Quantidade de moedas

# NUMEROS (Ponteiros para os sprites numéricos)
    .align 2
VETOR_NUMEROS:
	.word num0, num1, num2, num3, num4, num5, num6, num7, num8, num9

# ATAQUE
LINK_DIR:       .byte 0     # 0=Baixo, 1=Cima, 2=Esq, 3=Dir
TIMER_ATAQUE:   .byte 0     # Timer do golpe
POS_ATAQUE:     .half 0, 0  # X, Y do desenho da espada
CLEANUP_FRAMES: .byte 0

# LOJA (Estado dos itens)
SOLD_HEART:     .byte 0
SOLD_SHIELD:    .byte 0
SOLD_KEY:       .byte 0

# INVENTARIO
HAS_KEY:        .byte 0
HAS_SHIELD:     .byte 0

# ==============================================================================
# 4. MAPAS E COLISÃO
# ==============================================================================

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
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
.byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 7, 7, 1, 1, 1, 1, 1, 1, 1, 1

# GERENCIAMENTO DE MAPAS
CURR_MAP_IMG:   .word mapa1
CURR_MAP_COL:   .word mapa1_colisao
CURR_MAP_TILE:  .word tile

# PORTAL TABLE
    .align 2
PORTAL_TABLE:
    .word 2, mapa2, mapa2_colisao, 16, 128, tile  # Saída do Mapa 1 p/ Mapa 2
    .word 3, mapa3, mapa3_colisao, 144, 192, tile2 #Saída do mapa 2 p/ Mapa 3
    .word 4, mapa1, mapa1_colisao, 288, 128, tile  # Saída do Mapa 2 p/ Mapa 1
    .word 5, dungeon, dungeon_colisao, 160, 208, preto #Saída do Mapa 1 p/ Dungeon
    .word 6, mapa2, mapa2_colisao, 144, 64, tile #Saída do Mapa 3 p/ Mapa 2
    .word 7, mapa1, mapa1_colisao, 144, 48, tile #  Saída da Dungeon p/ Mapa 1
    .word 0     # Fim da tabela

# ==============================================================================
# 5. DADOS DO INIMIGO E PROJÉTIL (Alinhados)
# ==============================================================================

# INIMIGO
INIMIGO_POS:    .half 160,144   # X, Y inicial (perto do Link na dungeon)
OLD_INI_POS:    .half 160,144  
INIMIGO_VIVO:   .byte 1         # 1 = Vivo, 0 = Morto
TIMER_MOV_INI:  .byte 0         # Delay para ele andar mais devagar
TIMER_MUDAR_DIR:.byte 0         # Tempo para ele decidir mudar de direção

# Words alinhadas
    .align 2
INI_VEL_X:      .word 16    # Velocidade Horizontal (+16 ou -16)
INI_VEL_Y:      .word 16    # Velocidade Vertical (+16 ou -16)

# PROJETIL (PEDRA) - Tudo .word para evitar desalinhamento nos loads/stores
    .align 2
ROCK_POS:       .word 0, 0      # X, Y da pedra
OLD_ROCK_POS:   .word 0, 0      # X, Y antigo
ROCK_ACTIVE:    .word 0         # 0 = inativa, 1 = voando
ROCK_TIMER:     .word 0         # Cooldown
ROCK_VEL_X:     .word 0
ROCK_VEL_Y:     .word 0

# DANO
TIMER_INVUL:    .byte 0         # Tempo que o Link fica piscando/invulnerável
.text


MAIN:   # Mapa ---------

	lw a0, CURR_MAP_IMG #carrega a imagem do mapa atual
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
	la a0, preto    # Sprite preto
	li a2, 0            # Y = 0 (Linha 1)
	    
	# Loop para preencher a linha X=0 ate X=304
	    
	li s10, 0    
            
LOOP_HUD_LINHA1:

	li t1, 320
	bge s10, t1, FIM_HUD_LINHA1
	    
	mv a1, s10           # X atual
	    
	li a3, 0            # Frame 0
	call PRINT
	li a3, 1            # Frame 1
	call PRINT
	    
	addi s10, s10, 16     # Proximo tile
	j LOOP_HUD_LINHA1
FIM_HUD_LINHA1:

	li a2, 16           # Y = 16 (Linha 2)
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

       call    KEY_SELECT
        
        # Alternar Frame (Agora s0 é o frame oculto onde vamos desenhar)
        xori    s0, s0, 1               
        
        # LIMPEZA DO RASTRO 
        # Apaga o Link da posição antiga desenhando o tile do mapa atual
        la      t0, OLD_CHAR_POS
        lw      a0, CURR_MAP_TILE       # Carrega tile do mapa atual
        lh      a1, 0(t0)
        lh      a2, 2(t0)
        mv      a3, s0                  # Desenha no frame oculto
        call    PRINT


	call CHECAR_PEGOU_ESPADA
	call TOCAR_MUSICA
	
        call    CHECAR_LOJA             
        # Renderização do FUNDO (Itens da Loja)
        call    DESENHAR_LOJA           
       	call DESENHAR_ATAQUE    #verificar o ataque 	
	# --- INIMIGOS E COMBATE ---
	call ATUALIZAR_INIMIGO  # Move Inimigo
	call CHECAR_DANO        # Dano: Inimigo -> Link
	call CHECAR_HIT_INIMIGO # <--- NOVO: Dano: Espada -> Inimigo
	    # --------------------------
	
        # Desenha o Link
        la      t0, CHAR_POS
        mv      a0, s2                  # Sprite do Link
        lh      a1, 0(t0)
        lh      a2, 2(t0)
        mv      a3, s0                  # Frame atual
        call    PRINT
        
        # Interface (HUD) 
        call    ATUALIZAR_HUD 
        
	# Atualiza o Display 
        li      t2, 0xFF200604
        sw      s0, 0(t2)
        
        j       GAME_LOOP
	

	
# =============================
# Procedimentos de Movimentacao

KEY_SELECT: 

	li t1,0xFF200000		# carrega o endere o de controle do KDMMIO
	
	# VERIFICAR SE JA ESTA ATACANDO (Bloqueio)
	la t0, TIMER_ATAQUE
	lb t3, 0(t0)            # Carrega timer
	beq t3, zero, LER_TECLADO # Se 0, pode ler teclas
    
	# Se > 0, apenas decrementa e sai (Link travado) -- Vulgo atacando
	addi t3, t3, -1
	sb t3, 0(t0)
	ret                     # Sai da funcao (nao le WASD)
	 
	  
	   
	     
LER_TECLADO:

	lw t0,0(t1)			# Le bit de Controle Teclado # endereco da flag tecla apertada 
   	andi t0,t0,0x0001		# mascara o bit menos significativo
   					# (l? do endereco controle de teclado uma flag(0 = tecla apertada | 1 = tecla apertada)			
   	beq t0,zero,FIM_LOOP		# n o tem tecla pressionada ent o volta ao loop
   	
   	lw t2,4(t1)			# le o valor da tecla (no endereco 0xFF200004) #endereco dos valores ASCII
  	sw t2,12(t1)  			# escreve a tecla pressionada no display (no endereco 0xFF200012) #enderco do display
  	
  	
  	#Procedimento pra interpretar as teclas( mudar as posicoes respectivas quando w, a, s ou d forem clicadas)

	# --- DETECTAR ATAQUE  ---
	li t0, 'j'              # Tecla J para atacar
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
	beq t0, zero, FIM_LOOP  # Se nao tem espada, nao ataca (ou ataca sem espada)
    
	# Configura Timer
	la t0, TIMER_ATAQUE
	li t1, 15              # Duracao do ataque (10 frames)
	sb t1, 0(t0)
	ret

CHAR_DIR: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 3            # 3 = Direita
	sb t1, 0(t0)        # Salva direcao
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS  #carrega o endereco da posicao 
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega o valor y posicao 
	
	
	#Procedimento pra checar colis?o
	
	addi t3, t1, 16	#t3 vai guardar o valor x do endere?o previsto depois da movimenta??o t1(x) + 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t4, t2, 4 #divide o y previsto por 16 
	
	jal CHECAR_COLISAO #a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	beq t5, zero, MOV_DIR
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
    	# Salva o numero do portal em a0 e chama a troca
    	mv a0, t5 
    	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_DIR:
	
		la t0, CHAR_POS #carrega o endereco da posicao
		la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
		lw t2, 0(t0) #pega a posicao atual
		sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
		addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
		sh t1, 0(t0) #faz o store do valor x novo
		
		beq s3, zero, p1d #s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,direita2 
		ret
		p1d:	la s2, direita
			ret

CHAR_ESQ: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 2            # 2 = esquerda
	sb t1, 0(t0)        # Salva direcao
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p?)	
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	
	#Procedimento pra checar colis?o
	
	addi t3, t1, -16 #t3 vai guardar o valor x do endere?o previsto depois da movimenta??o t1(x) - 16
	
	srai t3, t3, 4 #divide o x previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t4, t2, 4 #divide o y previsto por 16
	
	
	
	jal CHECAR_COLISAO #a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	beq t5, zero, MOV_ESQ
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
    	# Salva o numero do portal em a0 e chama a troca
    	mv a0, t5 
    	j MUDAR_MAPA
	
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_ESQ:
	
		la t0, CHAR_POS #carrega o endereco da posicao
		la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
		lw t2, 0(t0) #pega a posicao atual
		sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 0(t0) #carrega o valor x posicao (COMPLETA, ou seja, X e Y)
		addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
		sh t1, 0(t0) #faz o store do valor x novo
		
		beq s3, zero, p1e #s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,esquerda2
		ret
		p1e:	la s2, esquerda
			ret
		
		
CHAR_CIMA:
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 1            # 1 = Direita
	sb t1, 0(t0)        # Salva direcao
	
	xori s3, s3, 1	#inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, -16 #t4 vai guardar o valor x do endere?o previsto depois da movimenta??o t2(y) - 16	
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colis?o
	
	jal CHECAR_COLISAO #a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	beq t5, zero, MOV_CIMA
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
    	# Salva o numero do portal em a0 e chama a troca
    	mv a0, t5 
    	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_CIMA:
		la t0, CHAR_POS #carrega o endereco da posicao
		la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
		lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
		sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 2(t0) #carrega o valor x posicao
		addi t1, t1, -16 #aumenta o valor x (para indicar o movimento)
		sh t1, 2(t0) #faz o store do valor x novo
		
		beq s3, zero, p1c #s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,cima2
		ret
		p1c:	la s2, cima
			ret
	
CHAR_BAIXO: 
	addi sp, sp, -4 #usa sp(stack pointer) pra guardar o valor de ra na pilha temporariamente
	sw ra,0(sp) #precisa fazer isso pq o jal muda o endere?o de retorno(ra), ent?o ele n?o retorna pro loop se n?o salvar
	
	la t0, LINK_DIR
	li t1, 0            # 0 = Direita
	sb t1, 0(t0)        # Salva direcao	
				
	xori s3, s3, 1 #inverte o s3, que decide qual sprite do link vai usar (muda o p?)		
	la t0, CHAR_POS  #carrega o endereco da posicao 	
	lh t1, 0(t0) #carrega o valor x posicao 
	lh t2, 2(t0) #pega a posicao atual
	
	addi t4, t2, 16	 #t4 vai guardar o valor x do endere?o previsto depois da movimenta??o t2(y) + 16
	
	srai t4, t4, 4 #divide o y previsto por 16, pra ficar compat?vel com o mapa de colis?o
	srai t3, t1, 4 #divide o x previsto por 16
	
	
	#Procedimento pra checar colis?o
	
	jal CHECAR_COLISAO #a fun??o vai retornar t5 = 1 se tiver obst?culo no endere?o previsto e t5 = 0 sen?o
	
	lw ra, 0(sp) #volta o ra pro valor antigo, assim o endere?o de retorno volta a ser o loop
	addi sp, sp, 4 #reseta o sp
	
	beq t5, zero, MOV_BAIXO
	
	li t6, 1 
	beq t5, t6, COLISAO #se t6 = 1 teve colis?o
	
	# Se chegou aqui, t5 > 1, ou seja, tem que mudar o mapa
    	# Salva o numero do portal em a0 e chama a troca
    	mv a0, t5 
    	j MUDAR_MAPA
	
	#N?o teve colis?o, ent?o carrega as coisas pra printar o personagem
	
	MOV_BAIXO:
		la t0, CHAR_POS #carrega o endereco da posicao
		la t1, OLD_CHAR_POS #carrega o endereco da posicao passada
		lw t2, 0(t0) #pega a posicao atual (COMPLETA, ou seja, X e Y)
		sw t2, 0(t1) #carrega como posicao passada (ja que iremos atualizar a posicao atual para a nova)
		lh t1, 2(t0) #carrega o valor x posicao
		addi t1, t1, 16 #aumenta o valor x (para indicar o movimento)
		sh t1, 2(t0) #faz o store do valor x novo
		
		beq s3, zero, p1b #s3 decide qual sprite do link vai ser printado (muda a posi??o dos p?s)
		la s2,baixo2
		ret
		p1b:	la s2, baixo
			ret

MUDAR_MAPA:
    # a0 contém o ID do mapa novo
    la t0, PORTAL_TABLE # Carrega a tabela dos mapas em t0
    
LOOP_PORTAL:
    lw t1, 0(t0)        # Lê o ID na tabela
    beq t1, zero, FIM_MUDANCA # Se 0, fim da tabela
    beq t1, a0, ACHOU_PORTAL
    
    addi t0, t0, 24     # Pula para próxima linha da tabela (6 words * 4 bytes = 24)
    j LOOP_PORTAL

ACHOU_PORTAL:
    # t0 aponta para a linha correta da tabela
    
    # 1. Atualizar Endereço da Imagem
    lw t1, 4(t0)        # Carrega endereço da imagem do mapa
    la t2, CURR_MAP_IMG
    sw t1, 0(t2)        # Salva na variavel global
    
    # 2. Atualizar Endereço da Colisão
    lw t1, 8(t0)        # Carrega endereço da colisão
    la t2, CURR_MAP_COL
    sw t1, 0(t2)	# Salva na variavel global
    
    # 3. Atualizar Posição do Link
    lw t1, 12(t0)       # Novo X
    lw t2, 16(t0)       # Novo Y
    la t3, CHAR_POS
    sh t1, 0(t3)	# Salva X na variavel global
    sh t2, 2(t3)	# Salva Y na variavel global
    
    # 4. Carrega OLD_POS também 
    la t3, OLD_CHAR_POS
    sh t1, 0(t3) 	# Salva na variavel global
    sh t2, 2(t3) 	# Salva na variavel global

    # 5. Carrega o tile usado nesse mapa
    
    lw t1, 20(t0)
    la t2, CURR_MAP_TILE
    sw t1, 0(t2)	# Salva na variavel global
    
    # 6. Forçar Pintura do Novo Mapa (Frames 0 e 1)
    # Isso apaga o mapa velho da tela imediatamente
    
    addi sp, sp, -4
    sw ra, 0(sp)         # Salva RA pois vamos chamar PRINT
    
    lw a0, CURR_MAP_IMG  # Imagem nova
    li a1, 0
    li a2, 0
    
    li a3, 0             # Frame 0
    call PRINT
    li a3, 1             # Frame 1
    call PRINT
    
    lw ra, 0(sp)
    addi sp, sp, 4
    
FIM_MUDANCA:
    # Retorna para o GAME_LOOP indiretamente (pois viemos de um Jump na movimentação)
    # Como usamos 'j MUDAR_MAPA' dentro de CHAR_DIR, o stack pointer já foi limpo lá.
    j GAME_LOOP
    
    
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
	
	
# --- COLISAO NORMAL ----	

CHECAR_COLISAO:
	li t0, 20 #carrega t1=20, sendo 20 a largura do mapa de colis?o (largura do mapa em tiles) 	
	mul t0, t0, t4 #multiplica t4(y do endere?o previsto) por 20 pra achar a linha em que o personagem est?
	add t0, t0, t3 #soma t3(x do endere?o previsto) pelo valor da multiplica??o pra achar a coordenada na linha
	
	lw t1, CURR_MAP_COL #carrega o mapa de colis?o em t1
	add t1, t1, t0 #guarda t1 as coordenadas previstas do personagem no mapa de colis?o
	
	lbu t5, 0(t1) #carrega em t5 o valor que est? nas coordenadas previstas do personagem no mapa de calor
	#t5 = 1 se tem obst?culo
	#t5 = 0 se n?o tem obst?culo
	ret
	
	
# --- COLISAO DE COMPRA -----

CHECAR_LOJA:
        #Salvar RA
        addi    sp, sp, -4
        sw      ra, 0(sp)


        # 1. Verificar Mapa
        lw      t0, CURR_MAP_IMG
        la      t1, dungeon
        bne     t0, t1, RET_LOJA

        # Carrega posicao do Link
        la      t0, CHAR_POS
        lh      t1, 0(t0)               # Link X
        lh      t2, 2(t0)               # Link Y

        # === ESCUDO ===
        li      t3, 100                 # Item X
        li      t4, 120                 # Item Y
        li      t5, 50                  # Preco

        la      t6, SOLD_SHIELD
        lb      s11, 0(t6)
        bne     s11, zero, CHECK_KEY_BUY

        #colisao x
        sub     t0, t1, t3
        bgez    t0, SHIELD_X_OK
        sub     t0, zero, t0
SHIELD_X_OK:
        li      s11, 16
        bgt     t0, s11, CHECK_KEY_BUY

        #colisao y
        sub     t0, t2, t4
        bgez    t0, SHIELD_Y_OK
        sub     t0, zero, t0
SHIELD_Y_OK:
        bgt     t0, s11, CHECK_KEY_BUY

        # Check Dinheiro
        la      t0, RUPY
        lh      t6, 0(t0)
        blt     t6, t5, CHECK_KEY_BUY

        # COMPRA!
        sub     t6, t6, t5
        sh      t6, 0(t0)

        li      t6, 1
        la      t0, SOLD_SHIELD
        sb      t6, 0(t0)
        la      t0, HAS_SHIELD
        sb      t6, 0(t0)

        call    TOCAR_KACHING
        j       RET_LOJA

CHECK_KEY_BUY:
        # === CHAVE ===
        li      t3, 160
        li      t4, 120
        li      t5, 80

        la      t6, SOLD_KEY
        lb      s11, 0(t6)
        bne     s11, zero, CHECK_HEART_BUY

        sub     t0, t1, t3
        bgez    t0, KEY_X_OK
        sub     t0, zero, t0
KEY_X_OK:
        li      s11, 16
        bgt     t0, s11, CHECK_HEART_BUY

        sub     t0, t2, t4
        bgez    t0, KEY_Y_OK
        sub     t0, zero, t0
KEY_Y_OK:
        bgt     t0, s11, CHECK_HEART_BUY

        la      t0, RUPY
        lh      t6, 0(t0)
        blt     t6, t5, CHECK_HEART_BUY

        sub     t6, t6, t5
        sh      t6, 0(t0)

        li      t6, 1
        la      t0, SOLD_KEY
        sb      t6, 0(t0)
        la      t0, HAS_KEY
        sb      t6, 0(t0)

        call    TOCAR_KACHING
        j       RET_LOJA

CHECK_HEART_BUY:
        # === CORAÇÃO ===
        li      t3, 220
        li      t4, 120
        li      t5, 10

        la      t6, SOLD_HEART
        lb      s11, 0(t6)
        bne     s11, zero, RET_LOJA

        sub     t0, t1, t3
        bgez    t0, HEART_X_OK
        sub     t0, zero, t0
HEART_X_OK:
        li      s11, 16
        bgt     t0, s11, RET_LOJA

        sub     t0, t2, t4
        bgez    t0, HEART_Y_OK
        sub     t0, zero, t0
HEART_Y_OK:
        bgt     t0, s11, RET_LOJA

        la      t0, RUPY
        lh      t6, 0(t0)
        blt     t6, t5, RET_LOJA

        sub     t6, t6, t5
        sh      t6, 0(t0)

        li      t6, 1
        la      t0, SOLD_HEART
        sb      t6, 0(t0)

        la      t0, VIDAS
        li      t6, 3
        sb      t6, 0(t0)

        call    TOCAR_KACHING

RET_LOJA:
        # --- RECUPERA O RA ANTES DE SAIR ---
        lw      ra, 0(sp)
        addi    sp, sp, 4
        ret

# ==================================
#  Procedimentos de desenho (print)

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

# garantir que o hud esteja em dia

ATUALIZAR_HUD:
        addi    sp, sp, -4
        sw      ra, 0(sp)
        
        # CORACAO
        la      t0, VIDAS
        lb      t1, 0(t0)
        la      a0, coracao
        li      a1, 48
        li      a2, 0
        mv      a3, s0

LOOP_CORACOES:
        beq     t1, zero, FIM_CORACOES
        
        addi    sp, sp, -16
        sw      a0, 0(sp)
        sw      a1, 4(sp)
        sw      a2, 8(sp)
        sw      t1, 12(sp)
        
        call    PRINT
        
        lw      t1, 12(sp)
        lw      a2, 8(sp)
        lw      a1, 4(sp)
        lw      a0, 0(sp)
        addi    sp, sp, 16
        
        addi    a1, a1, 16
        addi    t1, t1, -1
        j       LOOP_CORACOES

FIM_CORACOES:

        #RUPIAS -- MOEDA
        la      a0, rupy
        li      a1, 48
        li      a2, 16
        mv      a3, s0
        
        addi    sp, sp, -4
        sw      a1, 0(sp)
        call    PRINT
        lw      a1, 0(sp)
        addi    sp, sp, 4
        
        # Numeros
        la      t0, RUPY
        lh      t0, 0(t0)
        li      t1, 10
        li      a1, 96
        li      a2, 16
        li      t4, 3

LOOP_RUPIAS:
        rem     t2, t0, t1
        div     t0, t0, t1
        
        la      t3, VETOR_NUMEROS
        slli    t2, t2, 2
        add     t3, t3, t2
        lw      a0, 0(t3)
        
        addi    sp, sp, -20
        sw      a0, 0(sp)
        sw      a1, 4(sp)
        sw      a2, 8(sp)
        sw      t0, 12(sp)
        sw      t4, 16(sp)
        
        call    PRINT
        
        lw      t4, 16(sp)
        lw      t0, 12(sp)
        lw      a2, 8(sp)
        lw      a1, 4(sp)
        lw      a0, 0(sp)
        addi    sp, sp, 20
        
        addi    a1, a1, -16
        addi    t4, t4, -1
        bne     t4, zero, LOOP_RUPIAS

        #INVENTARIO
        
        #ESCUDO
        la      a0, moldura
        li      a1, 240         
        li      a2, 8           
        mv      a3, s0
        call    PRINT
        
        la      t0, HAS_SHIELD
        lb      t0, 0(t0)
        beq     t0, zero, DRAW_SLOT_2
        
        la      a0, escudo
        li      a1, 240
        li      a2, 8
        call    PRINT

DRAW_SLOT_2:
        #CHAVE
        la      a0, moldura
        li      a1, 264         
        li      a2, 8
        mv      a3, s0
        call    PRINT
        
        la      t0, HAS_KEY
        lb      t0, 0(t0)
        beq     t0, zero, DRAW_SLOT_3   # Alterado para pular para Slot 3
        
        la      a0, chave
        li      a1, 264
        li      a2, 8
        call    PRINT

DRAW_SLOT_3:
        #ESPADA
        
        #--> DESENHAR MOLDURA
        la      a0, moldura
        li      a1, 288         
        li      a2, 8
        mv      a3, s0
        call    PRINT
        
        #VERIFICAR ESPADA
        la      t0, HAS_SWORD
        lb      t0, 0(t0)
        beq     t0, zero, FIM_HUD
        
        # print espada
        la      a0, espada
        li      a1, 292         # 288 + 4 para centralizar
        li      a2, 8
        call    PRINT

FIM_HUD:
        lw      ra, 0(sp)
        addi    sp, sp, 4
        ret
        
# Desenhar LOJA

DESENHAR_LOJA:
        # Verificar se estamos na Dungeon
        lw      t0, CURR_MAP_IMG     
        la      t1, dungeon          
        bne     t0, t1, FIM_DESENHO_LOJA 

        addi    sp, sp, -4
        sw      ra, 0(sp)

        #ESCUDO
        
        la      t0, SOLD_SHIELD
        lb      t0, 0(t0)
        bne     t0, zero, ERASE_SHIELD  # Se vendido, VAI PARA O APAGAMENTO
        
        # Desenhar Normal
        la      a0, escudo
        li      a1, 100
        li      a2, 120
        mv      a3, s0
        call    PRINT
        
        # Preço "50"
        la      a0, num5
        li      a1, 92
        li      a2, 104
        call    PRINT
        la      a0, num0
        li      a1, 108
        call    PRINT
        j       CHECK_KEY_DRAW

ERASE_SHIELD:
        # Apagar 
        la      a0, preto       # Carrega o sprite do chão
        mv      a3, s0
        
        li      a1, 100         # Apaga Item
        li      a2, 120
        call    PRINT
        
        li      a1, 92          # Apaga Preço Esq
        li      a2, 104
        call    PRINT
        
        li      a1, 108         # Apaga Preço Dir
        call    PRINT

        #CHAVE
        
CHECK_KEY_DRAW:
        la      t0, SOLD_KEY
        lb      t0, 0(t0)
        bne     t0, zero, ERASE_KEY
        
        # Desenhar
        la      a0, chave
        li      a1, 160
        li      a2, 120
        mv      a3, s0
        call    PRINT
        
        # Preço "80"
        la      a0, num8
        li      a1, 152
        li      a2, 104
        call    PRINT
        la      a0, num0
        li      a1, 168
        call    PRINT
        j       CHECK_HEART_DRAW

ERASE_KEY:
        # Apagar
        la      a0, preto
        mv      a3, s0
        
        li      a1, 160
        li      a2, 120
        call    PRINT
        
        li      a1, 152
        li      a2, 104
        call    PRINT
        
        li      a1, 168
        call    PRINT

        #CORACAO
CHECK_HEART_DRAW:
        la      t0, SOLD_HEART
        lb      t0, 0(t0)
        bne     t0, zero, ERASE_HEART
        
        # Desenhar
        la      a0, coracao
        li      a1, 220
        li      a2, 120
        mv      a3, s0
        call    PRINT
        
        # Preço "10"
        la      a0, num1
        li      a1, 212
        li      a2, 104
        call    PRINT
        la      a0, num0
        li      a1, 228
        call    PRINT
        j       FIM_DESENHO_LOJA_RET

ERASE_HEART:
        # Apagar
        la      a0, preto
        mv      a3, s0
        
        li      a1, 220
        li      a2, 120
        call    PRINT
        
        li      a1, 212
        li      a2, 104
        call    PRINT
        
        li      a1, 228
        call    PRINT

FIM_DESENHO_LOJA_RET:
        lw      ra, 0(sp)
        addi    sp, sp, 4
FIM_DESENHO_LOJA:
        ret
        
      
# ========================= #
#   Procedimento de ataque  #

DESENHAR_ATAQUE:
    addi sp, sp, -4
    sw ra, 0(sp)

    # 1. Limpeza do ataque anterior
    la t0, POS_ATAQUE
    lh a1, 0(t0)        # Carrega X antigo
    lh a2, 2(t0)        # Carrega Y antigo
    
    # Se X=0, não tem nada para apagar, pula
    beq a1, zero, VERIFICAR_ESTADO 
    
    lw a0, CURR_MAP_TILE    
    # ----------------------------------------

    mv a3, s0           # Frame atual
    
    addi sp, sp, -4     # Salva t0
    sw t0, 0(sp)
    call PRINT
    lw t0, 0(sp)
    addi sp, sp, 4

VERIFICAR_ESTADO:
    
    #definir se vai limpar, parar ou atacar
    la t1, TIMER_ATAQUE
    lb t2, 0(t1)        # t2 = Timer Atual
    
    # Se Timer > 0, vamos desenhar a espada --> ataque
    bne t2, zero, DESENHAR_NOVA_ESPADA
    
    # Se Timer == 0, verificamos se precisamos continuar limpando (Ressaca) -- para evitar espada sobrando
    la t3, CLEANUP_FRAMES
    lb t4, 0(t3)
    
    beq t4, zero, ZERAR_MEMORIA # Se Cleanup também é 0, acabou tudo.
    
    # Se Cleanup > 0, apenas decrementamos e saimos (limpamnos no passo 1)
    addi t4, t4, -1
    sb t4, 0(t3)
    j FIM_ATQ

ZERAR_MEMORIA:
    
    # Zera o POS_ATAQUE para parar de tentar limpar no futuro
    sh zero, 0(t0)
    sh zero, 2(t0)
    j FIM_ATQ
    
DESENHAR_NOVA_ESPADA:
    
    # Recarrega o Cleanup para 2 (Garante limpeza dos 2 frames quando acabar)
    la t3, CLEANUP_FRAMES
    li t4, 2
    sb t4, 0(t3)

    # Carrega Posição do Link
    la t0, CHAR_POS
    lh t1, 0(t0)        # Link X
    lh t2, 2(t0)        # Link Y
    
    la t0, LINK_DIR
    lb t3, 0(t0)        # Direção
    
    # Escolhe a direção (0=Baixo, 1=Cima, 2=Esq, 3=Dir)
    li t4, 0
    beq t3, t4, ATQ_BAIXO
    li t4, 1
    beq t3, t4, ATQ_CIMA
    li t4, 2
    beq t3, t4, ATQ_ESQ
    # Se for 3 cai direto

ATQ_DIR:
    la a0, espada2      # Horizontal
    addi a1, t1, 16     # X = Link + 16
    addi a2, t2, 4      # Y Ajustado
    j DO_PRINT_ATQ

ATQ_ESQ:
    la a0, espada_esq     # Horizontal
    addi a1, t1, -16    # X = Link - 16
    addi a2, t2, 4      
    j DO_PRINT_ATQ

ATQ_BAIXO:
    la a0, espada_baixo      # Vertical
    addi a1, t1, 4      
    addi a2, t2, 14     # Y = Link + 14
    j DO_PRINT_ATQ

ATQ_CIMA:
    la a0, espada       # Vertical
    addi a1, t1, 4      
    addi a2, t2, -14    # Y = Link - 14 --> LEMBRAR QUE OS HORIZONTAIS NAO PODEM NAO SER MULT DE 4
    # j DO_PRINT_ATQ

DO_PRINT_ATQ:
    mv a3, s0           # Frame atual
    
    # Salva a nova posição na memória (para limpar no próximo frame)
    la t0, POS_ATAQUE
    sh a1, 0(t0)
    sh a2, 2(t0)
    
    call PRINT

FIM_ATQ:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    
# ========================= #
#  Procedimentos da Musica  #
	
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
 
TOCAR_KACHING:
        li      a7, 31          # Midi Out
        li      a2, 11          # Instrumento
        li      a3, 127         # Volume

        li      a0, 84
        li      a1, 100
        ecall

        li      a0, 90
        li      a1, 300
        ecall
        ret 
	    
ATUALIZAR_INIMIGO:
    addi sp, sp, -4
    sw ra, 0(sp)

    # 1. CHECK DE MAPA (Inimigo só existe na Dungeon)
    lw t0, CURR_MAP_IMG
    la t1, mapa1          # Endereço da imagem da dungeon
    bne t0, t1, FIM_UPDATE_INI # Se não for dungeon, sai

    # 2. Verifica se está vivo
    la t0, INIMIGO_VIVO
    lb t1, 0(t0)
    beq t1, zero, FIM_UPDATE_INI

    # 3. SALVAR POSIÇÃO ANTIGA (Para limpar o rastro)
    la t0, INIMIGO_POS
    lh t1, 0(t0)        # X atual
    lh t2, 2(t0)        # Y atual
    la t3, OLD_INI_POS
    sh t1, 0(t3)        # Salva em Old X
    sh t2, 2(t3)        # Salva em Old Y

    # 4. CONTROLE DE VELOCIDADE (Timer)
    la t0, TIMER_MOV_INI
    lb t1, 0(t0)
    bne t1, zero, DEC_TIMER_MOV
    
    # Reseta timer (ajuste esse valor para mudar a velocidade do inimigo)
    li t1, 7
    sb t1, 0(t0)

    # 5. ALEATORIEDADE (Mudar direção ocasionalmente)
    la t0, TIMER_MUDAR_DIR    
    lb t1, 0(t0)
    beq t1, zero, RANDOM_FLIP
    addi t1, t1, -1
    sb t1, 0(t0)    
    j CALCULAR_MOVIMENTO

RANDOM_FLIP:
    # Reseta timer aleatório (ex: 40 movimentos)
    li t1, 40
    sb t1, 0(t0)
    
    # Inverte X ou Y aleatoriamente para dar imprevisibilidade
    li a7, 30
    ecall
    andi t2, a0, 1      # 0 ou 1
    beq t2, zero, FLIP_X
    j FLIP_Y

FLIP_X:
    la t0, INI_VEL_X
    lw t1, 0(t0)
    neg t1, t1
    sw t1, 0(t0)
    j CALCULAR_MOVIMENTO
FLIP_Y:
    la t0, INI_VEL_Y
    lw t1, 0(t0)
    neg t1, t1
    sw t1, 0(t0)

CALCULAR_MOVIMENTO:
    # --- EIXO X ---
    la t0, INIMIGO_POS
    lh t1, 0(t0)        # X
    la t3, INI_VEL_X
    lw t4, 0(t3)        # Vel X
    add a1, t1, t4      # Futuro X
    
    # Checa Colisão X
    lh a2, 2(t0)        # Y atual (para verificar colisão no eixo X mantendo Y)
    
    # Salva contexto
    addi sp, sp, -12
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw t4, 8(sp) # Salva Vel X
    
    # Prepara argumentos para CHECAR_COLISAO (Grid)
    srai t3, a1, 4      # Grid X
    srai t4, a2, 4      # Grid Y
    jal CHECAR_COLISAO
    
    # Recupera
    lw t4, 8(sp)
    lw t1, 4(sp)
    lw t0, 0(sp)
    addi sp, sp, 12
    
    bne t5, zero, COLISAO_X
    
    # Sem colisão X: Atualiza X
    sh a1, 0(t0)
    j EIXO_Y

COLISAO_X:
    # Bateu no X: Inverte Velocidade X e não move
    neg t4, t4
    la t3, INI_VEL_X
    sw t4, 0(t3)
    # (Não atualiza posição X, espera próximo frame)

EIXO_Y:
    # --- EIXO Y ---
    la t0, INIMIGO_POS
    lh t2, 2(t0)        # Y (recarrega, caso X tenha mudado o t0)
    lh t1, 0(t0)        # X atualizado
    la t3, INI_VEL_Y
    lw t6, 0(t3)        # Vel Y
    add a2, t2, t6      # Futuro Y
    
    # Checa Colisão Y
    mv a1, t1           # X atual
    
    addi sp, sp, -12
    sw t0, 0(sp)
    sw t2, 4(sp)
    sw t6, 8(sp) # Salva Vel Y
    
    srai t3, a1, 4
    srai t4, a2, 4
    jal CHECAR_COLISAO
    
    lw t6, 8(sp)
    lw t2, 4(sp)
    lw t0, 0(sp)
    addi sp, sp, 12
    
    bne t5, zero, COLISAO_Y
    
    # Sem colisão Y: Atualiza Y
    sh a2, 2(t0)
    j DESENHAR_INI

COLISAO_Y:
    # Bateu no Y: Inverte Velocidade Y
    neg t6, t6
    la t3, INI_VEL_Y
    sw t6, 0(t3)
    j DESENHAR_INI

DEC_TIMER_MOV:
    addi t1, t1, -1
    sb t1, 0(t0)
    # Fallthrough para desenhar (para não piscar se estiver parado esperando timer)

DESENHAR_INI:
    # 1. Apaga rastro no Frame 0
    la t0, OLD_INI_POS      
    lw a0, CURR_MAP_TILE    
    lh a1, 0(t0)            
    lh a2, 2(t0)            
    li a3, 0                # Frame 0
    
    addi sp, sp, -4
    sw ra, 0(sp)
    call PRINT
    lw ra, 0(sp)
    addi sp, sp, 4

    # 2. Apaga rastro no Frame 1
    la t0, OLD_INI_POS
    lw a0, CURR_MAP_TILE
    lh a1, 0(t0)
    lh a2, 2(t0)
    li a3, 1                # Frame 1
    
    addi sp, sp, -4
    sw ra, 0(sp)
    call PRINT
    lw ra, 0(sp)
    addi sp, sp, 4

    # 3. Desenha o inimigo na nova posição (Frame Atual)
    la a0, octorok         
    la t0, INIMIGO_POS     
    lh a1, 0(t0)
    lh a2, 2(t0)
    li a3, 0              # Frame atual global
    
    addi sp, sp, -4
    sw ra, 0(sp)
    call PRINT
    lw ra, 0(sp)
    addi sp, sp, 4
   
    la a0, octorok         
    la t0, INIMIGO_POS     
    lh a1, 0(t0)
    lh a2, 2(t0)
    li a3, 1              
    
    addi sp, sp, -4
    sw ra, 0(sp)
    call PRINT
    lw ra, 0(sp)
    addi sp, sp, 4
    
    
FIM_UPDATE_INI:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
	    
CHECAR_DANO:
    addi sp, sp, -4
    sw ra, 0(sp)

    # 1. Verifica Invencibilidade
    la t0, TIMER_INVUL
    lb t1, 0(t0)
    beq t1, zero, CHECK_HITBOX
    
    # Se timer > 0, decrementa e sai (Link está piscando)
    addi t1, t1, -1
    sb t1, 0(t0)
    j FIM_DANO

CHECK_HITBOX:
    # Carrega Pos Link
    la t0, CHAR_POS
    lh t1, 0(t0)    # Link X
    lh t2, 2(t0)    # Link Y
    
    # Carrega Pos Inimigo
    la t0, INIMIGO_POS
    lh t3, 0(t0)    # Ini X
    lh t4, 2(t0)    # Ini Y
    
    # Colisão simples (Se estiverem no mesmo tile de 16x16)
    # abs(LinkX - IniX) < 16
    sub t5, t1, t3
    bgez t5, POS_X
    neg t5, t5      # t5 = abs(diff X)
POS_X:
    li t6, 12       # Margem de colisão (um pouco menos que 16 pra não ser injusto)
    bge t5, t6, FIM_DANO

    # abs(LinkY - IniY) < 16
    sub t5, t2, t4
    bgez t5, POS_Y
    neg t5, t5
POS_Y:
    li t6, 12
    bge t5, t6, FIM_DANO
    
    # --- COLIDIU! TIRA VIDA ---
    
    la t0, VIDAS
    lb t1, 0(t0)
    beq t1, zero, GAME_OVER # Se já for 0
    
    addi t1, t1, -1
    sb t1, 0(t0)
    
    # Ativa Invencibilidade (ex: 60 frames = 2 segs se rodar a 30fps)
    la t0, TIMER_INVUL
    li t1, 30
    sb t1, 0(t0)
    
    # Opcional: Empurrar Link pra trás (Knockback) simples
    # (Pode deixar pra depois se quiser simplificar)

    # Atualiza HUD imediatamente para sumir o coração
    call ATUALIZAR_HUD

FIM_DANO:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

GAME_OVER:
    # Por enquanto, apenas reseta a posição ou trava
    # Voce pode criar uma tela de game over depois
    ret
    

CHECAR_HIT_INIMIGO:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    # Verifica se espada está ativa (desenhada)
    # Usamos o TIMER_ATAQUE para saber se está atacando
    la t0, TIMER_ATAQUE
    lb t1, 0(t0)
    beq t1, zero, FIM_HIT_INI
    
    # Verifica se inimigo vivo
    la t0, INIMIGO_VIVO
    lb t1, 0(t0)
    beq t1, zero, FIM_HIT_INI
    
    # Colisão: POS_ATAQUE vs INIMIGO_POS
    la t0, POS_ATAQUE
    lh t1, 0(t0)    # Espada X
    lh t2, 2(t0)    # Espada Y
    
    la t0, INIMIGO_POS
    lh t3, 0(t0)    # Inimigo X
    lh t4, 2(t0)    # Inimigo Y
    
    # Abs(X)
    sub t5, t1, t3
    bgez t5, H_DX
    neg t5, t5
H_DX:
    li t6, 16       # Hitbox da espada
    bge t5, t6, FIM_HIT_INI
    
    # Abs(Y)
    sub t5, t2, t4
    bgez t5, H_DY
    neg t5, t5
H_DY:
    li t6, 16
    bge t5, t6, FIM_HIT_INI
    
    # --- MATAR INIMIGO ---
    la t0, INIMIGO_VIVO
    sb zero, 0(t0)
    
    # Apagar o inimigo da tela (Limpeza Dupla)
    la t0, INIMIGO_POS
    lw a0, CURR_MAP_TILE
    lh a1, 0(t0)
    lh a2, 2(t0)
    
    addi sp, sp, -12
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)
    
    li a3, 0
    call PRINT      # Apaga Frame 0
    
    lw a0, 0(sp)
    lw a1, 4(sp)
    lw a2, 8(sp)
    addi sp, sp, 12
    
    li a3, 1
    call PRINT      # Apaga Frame 1
    
    # (Opcional) Som de morte ou drop de item aqui
    
FIM_HIT_INI:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
