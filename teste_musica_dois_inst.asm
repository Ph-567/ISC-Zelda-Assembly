.data
# Tamanhos das listas
NUM_MELODIA: .word 29
NUM_HARPA:   .word 96  # 16 acordes * 6 notas de arpejo cada

# MELODIA (Ocarina) - TAMANHO: 29
# (Uma oitava acima)
NOTAS_OCARINA: 
.word 64,1132,67,566,62,1132,60,283,62,283,64,1132,67,566,62,1698
.word 64,1132,67,566,74,1132,72,566,67,1132,65,283,64,283,62,1698
.word 64,1132,67,566,62,1132,60,283,62,283,64,1132,67,566,62,1698
.word 64,1132,67,566,74,1132,72,566,79,3396

# HARPA (Base/Arpejo) - TAMANHO: 96
NOTAS_HARPA:
# Acorde 1 (F - 53): 72,283, 77,283, 81,283, 77,283, 72,283, 77,283
.word 72,283, 77,283, 81,283, 77,283, 72,283, 77,283
# Acorde 2 (G - 55): 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 3 (F - 53):
.word 72,283, 77,283, 81,283, 77,283, 72,283, 77,283
# Acorde 4 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 5 (C - 48): 72,283, 76,283, 79,283, 76,283, 72,283, 76,283
.word 72,283, 76,283, 79,283, 76,283, 72,283, 76,283
# Acorde 6 (D - 50): 74,283, 77,283, 81,283, 77,283, 74,283, 77,283
.word 74,283, 77,283, 81,283, 77,283, 74,283, 77,283
# Acorde 7 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 8 (F - 53):
.word 72,283, 77,283, 81,283, 77,283, 72,283, 77,283
# Acorde 9 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 10 (F - 53):
.word 72,283, 77,283, 81,283, 77,283, 72,283, 77,283
# Acorde 11 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 12 (C - 48):
.word 72,283, 76,283, 79,283, 76,283, 72,283, 76,283
# Acorde 13 (D - 50):
.word 74,283, 77,283, 81,283, 77,283, 74,283, 77,283
# Acorde 14 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 15 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283
# Acorde 16 (G - 55):
.word 71,283, 74,283, 79,283, 74,283, 71,283, 74,283

.text

	lw s0, NUM_MELODIA	# s0 = Total Melodia (29)
	lw s1, NUM_HARPA	# s1 = Total Harpa (96)
	
	la s2, NOTAS_OCARINA	# s2 = Ponteiro para Melodia
	la s3, NOTAS_HARPA	# s3 = Ponteiro para Harpa
	la s4, NOTAS_OCARINA	# s4 = Backup Ponteiro Melodia
	la s5, NOTAS_HARPA	# s5 = Backup Ponteiro Harpa
	
	li t0, 0		# t0 = Contador da Melodia (i)
	li t1, 0		# t1 = Contador da Harpa (j)
	
	li t5, 0		# t5 = "Relogio" da Ocarina (quanto tempo falta para a proxima nota)

LOOP:	
	# --- 2. VERIFICAR E REINICIAR LOOPS ---
	beq t0, s0, REINICIAR_MELODIA
REINICIAR_MELODIA_FIM:
	beq t1, s1, REINICIAR_HARPA
REINICIAR_HARPA_FIM:
	
CONTINUAR_LOOP:
	# --- 3. LOGICA DA OCARINA (MELODIA) ---
	
	# t5 e o nosso contador de "duracao restante" da Ocarina
	beq t5, zero, CARREGAR_OCARINA # Se t5=0, e hora de carregar a proxima nota
	j TOCAR_HARPA # Se t5 != 0, a Ocarina ainda esta "segurando" a nota

CARREGAR_OCARINA:
	lw a0, 0(s2)		# a0 = Nota Ocarina
	lw a1, 4(s2)		# a1 = Duração Ocarina
	
	# Salvar a duracao em t5 (o nosso "relogio")
	mv t5, a1		
	
	li a2, 79		# Instrumento Ocarina
	li a3, 127		# Volume
	li a7, 31		# Syscall 31 (MidiOut, NAO-BLOQUEANTE)
	ecall
	
	addi s2, s2, 8		# Avança ponteiro Ocarina
	addi t0, t0, 1		# i++ (contador Ocarina)

TOCAR_HARPA:
	# --- 4. LOGICA DA HARPA (ARPEJO) ---
	lw a0, 0(s3)		# a0 = Nota Harpa
	lw a1, 4(s3)		# a1 = Duração Harpa (283ms)
	
	# Salvar a duracao da Harpa em t6 (para o Sleep)
	mv t6, a1
	
	li a2, 46		# Instrumento Harpa (46)
	li a3, 90		# Volume (um pouco mais baixo)
	li a7, 31		# Syscall 31
	ecall			

	# --- 5. PAUSAR (SYSCALL 32) ---
	mv a0, t6
	li a7, 32		# Syscall 32 (Sleep)
	ecall

	# --- 6. AVANÇAR CONTADORES ---
	# Subtrai o tempo que dormimos (283ms) da duracao da Ocarina
	sub t5, t5, t6
	
	addi s3, s3, 8		# Avança ponteiro Harpa
	addi t1, t1, 1		# j++ (contador Harpa)
	j LOOP
	
# --- Rotinas de Reinicio ---
REINICIAR_MELODIA:
	mv s2, s4		# Reseta ponteiro Melodia
	li t0, 0		# Reseta contador Melodia
	j REINICIAR_MELODIA_FIM

REINICIAR_HARPA:
	mv s3, s5		# Reseta ponteiro Harpa
	li t1, 0		# Reseta contador Harpa
	j REINICIAR_HARPA_FIM