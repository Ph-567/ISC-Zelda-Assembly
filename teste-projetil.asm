.data
    # --- Sprites ---
    .include "sprites/octorok.s" 
    .include "sprites/pedra.s"   # Certifique-se que o label 'pedra:' existe neste arquivo
    .include "sprites/preto.s"

    # --- Variáveis do Jogo ---
    rock_x:      .word 0
    rock_y:      .word 0
    rock_active: .word 0         # 0 = desligada, 1 = voando
    timer:       .word 0         # Cronômetro
    
.text
.globl main

main:
    # Configuração Inicial
    li s0, 0        # s0 = Frame atual (0 ou 1)
    
    # Posição do Octorok
    li s1, 144      # X 
    li s2, 112    # Y

GAME_LOOP:
    # 1. Atualizar Lógica (Move a pedra e gerencia o timer)
    # A função UPDATE_GAME já cuida de APAGAR a posição antiga
    jal ra, UPDATE_GAME

    # 2. Desenhar Octorok
    la a0, octorok  # Endereço da imagem
    mv a1, s1       # X
    mv a2, s2       # Y
    mv a3, s0       # Frame
    jal ra, PRINT

    # 3. Desenhar Pedra (Desenha na NOVA posição calculada pelo Update)
    jal ra, DRAW_ROCK
    

    # 4. Trocar Frame
    xori s0, s0, 1  
    
    # 5. Delay (50ms)
    li a0, 50     
    li a7, 32       
    ecall
 
    j GAME_LOOP
# ============================================================
# LOGICA DO JOGO (UPDATE)
# ============================================================
UPDATE_GAME:
    addi sp, sp, -4
    sw ra, 0(sp)

    # Verifica se pedra está ativa
    la t0, rock_active
    lw t1, 0(t0)
    beq t1, zero, LOGICA_TIMER 
    
    # ---------------------------------------------------------
    # CORREÇÃO AQUI: APAGAR ANTES DE MOVER
    # ---------------------------------------------------------
    # Precisamos apagar a pedra enquanto o Y ainda é o "velho".
    jal ra, APAGAR_PEDRA
    
    # ---------------------------------------------------------
    #ATUALIZAMOS A POSIÇÃO (MOVER)
    # ---------------------------------------------------------
    la t2, rock_y
    lw t3, 0(t2)
    addi t3, t3, 4      # Soma 4 na posição Y (desce a pedra)
     
    sw t3, 0(t2)        # Salva o novo Y
    
    
    # --- VERIFICAR LIMITE DA TELA ---
    li t4, 240
    bge t3, t4, KILL_ROCK
    
    
    j LOGICA_TIMER
    

KILL_ROCK:
    sw zero, 0(t0)      # Desativa a pedra (rock_active = 0)
    # 1. APAGAR: Desenha o sprite preto na posição atual (limite da tela)
    jal ra, APAGAR_PEDRA 
    
    # 2. DESATIVAR: Impede que a pedra seja desenhada ou movida novamente
    sw zero, 0(t0)       # Desativa a pedra (rock_active = 0)

LOGICA_TIMER:
    # --- Parte A: Timer ---
    la t0, timer
    lw t1, 0(t0)
    addi t1, t1, 1      # Timer++
    sw t1, 0(t0)
    
    li t2, 40           # COOLDOWN
    blt t1, t2, END_UPDATE # Se timer < 40, sai
    
    # --- Parte B: Disparo ---
    la t3, rock_active
    lw t4, 0(t3)
    bne t4, zero, RESET_TIMER # Se já tem pedra ativa, apenas zera timer
    
    # ATIVAR PEDRA!
    li t4, 1
    sw t4, 0(t3)        # rock_active = 1
    
    # Definir Posição X
    la t5, rock_x
    addi t6, s1, 0      
    sw t6, 0(t5)
    
    # Definir Posição Y
    la t5, rock_y
    addi t6, s2, 16     
    sw t6, 0(t5)
   

RESET_TIMER:

    sw zero, 0(t0)      # Zera timer
	 
END_UPDATE:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# ============================================================
# FUNÇÕES DE DESENHO AUXILIARES
# ============================================================

DRAW_ROCK:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    
    la t0, rock_active  
    lw t1, 0(t0)
    beq t1, zero, FIM_DRAW 
    
    la a0, pedra        # Carrega o sprite
    la t0, rock_x
    lw a1, 0(t0)
    la t0, rock_y
    lw a2, 0(t0)
    mv a3, s0           # Frame atual
    jal ra, PRINT
    

FIM_DRAW:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

APAGAR_PEDRA:
    addi sp, sp, -4     # Aloca espaço apenas para ra (4 bytes)
    sw ra, 0(sp)        # Salva o endereço de retorno

    # 1. Carregar Sprite (preto)
    la a0, preto
    
    # 2. Carregar Posição X (a1)
    la t0, rock_x
    lw a1, 0(t0)        # a1 = rock_x (posição X)
    
    # 3. Carregar Posição Y (a2)
    la t1, rock_y       
    lw a2, 0(t1)        # a2 = rock_y (posição Y)

    # 4. Carregar Frame (a3) <--- CORREÇÃO: Move o VALOR de s0 para a3
  	xori a3, s0, 1           # a3 = s0 (Frame 0 ou 1)

    # 5. Chamar Desenho
    jal ra, PRINT       

    lw ra, 0(sp)        # Restaura ra
    
    ret

# ============================================================
# FUNÇÃO PRINT (Mantida igual)
# ============================================================
PRINT:
    li t0, 0xFF000000        
    li t0, 0xFF0       
    add t0, t0, a3     
    slli t0, t0, 20    # Endereço base calculado
    
    add t0, t0, a1     
    li t1, 320         
    mul t1, t1, a2     
    add t0, t0, t1     
    
    addi t1, a0, 8     
    mv t2, zero        
    mv t3, zero        
    lw t4, 0(a0)       
    lw t5, 4(a0)       

PRINT_LINHA:
    lw t6, 0(t1)       
    sw t6, 0(t0)       
    addi t1, t1, 4     
    addi t0, t0, 4     
    addi t3, t3, 4     
    blt t3, t4, PRINT_LINHA 
    
    addi t0, t0, 320   
    sub t0, t0, t4     
    mv t3, zero        
    addi t2, t2, 1     
    blt t2, t5, PRINT_LINHA 
    
    ret
