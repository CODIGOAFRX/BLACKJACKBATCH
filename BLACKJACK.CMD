@echo off
cls
color 1F

echo **********************************************************************
echo **************           BIENVENIDO    AL JUEGO         **************
echo **************                    DEL 21                **************
echo **************                 MADE BY PEDRO            **************
echo **********************************************************************
echo 	PARA EMPEZAR PULSA CUALQUIER TECLA :))

echo             ________$$$$..________
echo             ______$$$$$$$$$_______			P
echo             ______$$$$$$$_$_______
echo             _____$$$$$$$$$$_______			E
echo             ______$$$$$$$$$$______
echo             _____$$$$$$_$$$$$_____			D
echo             ____$$$$$$$_____$$$___
echo             ____$$$$$$$$_____$____			R
echo             ____$$$$$$$$$$________
echo             _____$$$$$$$$$$_______			O
echo             _____$$$$$$$$$$$______			
echo             ______$$$$$$$$$$$_____			'$
echo             _$$$$___$$$$$$$$$_____
echo             __$$$$$$$$$$$$$$$_____			C
echo             _$$$$$$$$$$$$$$$______
echo             __$$$$$$$$$$$$$_______			A
echo             $$$$$$$$$$$$$_________
echo             __$__$$$$$$___________			S
echo             ____$$$$$$____________
echo             ____$$$$$_____________			I
echo             ___$$$$$$_____$_______			
echo             ___$$$$$$___$$_$$_____			N
echo             ____$$$$$___$__$$_____
echo             ____$$$$$______$$_____			O
echo             _____$$$$$____$$$_____	
echo             _______$$$$$$$$$______			
echo             __________$$$$________			
pause
:inicio
cls
set /a jugador_puntos=0
set /a maquina_puntos=0

:turno_jugador

set /a carta=%random% %% 10 + 1
set /a jugador_puntos+=carta
echo **********************************************************************
echo **********************************************************************
echo TU CARTA ES: %carta%
echo TUS PUNTOS TOTALES SON: %jugador_puntos%
if %jugador_puntos% gtr 21 ( 
    echo Has superado 21. Has perdido.
    goto fin
)
choice /c sn /m "QUIERES OTRA CARTA?"
if errorlevel 2 goto turno_maquina




goto turno_jugador

:turno_maquina
set /a carta=%random% %% 10 + 1
set /a maquina_puntos+=carta
echo LA MAQUINA OBTUVO %carta% PUNTOS.
if %maquina_puntos% lss 17 goto turno_maquina rem he decidido que si saca 17 no saque más cartas la maquina ya que es el umbral habitual en el blackjack para la banca.

:determinar_ganador
echo Tienes %jugador_puntos% puntos.
echo La maquina tiene %maquina_puntos% puntos.

if %jugador_puntos% gtr 21 (
    echo La maquina gana. Tu has perdido
) else if %maquina_puntos% gtr 21 (
    echo Tu ganas. La maquina ha perdido
) else if %jugador_puntos% gtr %maquina_puntos% (
    echo Tu ganas. Felicidades
) else if %jugador_puntos% lss %maquina_puntos% (
    echo La maquina gana. Tu has perdido
) else (
    echo Es un empate.
)

:fin
echo Quieres jugar otra partida? (s/n):
set /p nueva_partida=
if /i "%nueva_partida%" neq "s" (
echo **********************************************************************
echo **********************************************************************
echo ************GRACIAS POR JUGAR. HASTA LA PROXIMA!!
echo             ________$$$$..________
echo             ______$$$$$$$$$_______			P
echo             ______$$$$$$$_$_______
echo             _____$$$$$$$$$$_______			E
echo             ______$$$$$$$$$$______
echo             _____$$$$$$_$$$$$_____			D
echo             ____$$$$$$$_____$$$___
echo             ____$$$$$$$$_____$____			R
echo             ____$$$$$$$$$$________
echo             _____$$$$$$$$$$_______			O
echo             _____$$$$$$$$$$$______			
echo             ______$$$$$$$$$$$_____			'$
echo             _$$$$___$$$$$$$$$_____
echo             __$$$$$$$$$$$$$$$_____			C
echo             _$$$$$$$$$$$$$$$______
echo             __$$$$$$$$$$$$$_______			A
echo             $$$$$$$$$$$$$_________
echo             __$__$$$$$$___________			S
echo             ____$$$$$$____________
echo             ____$$$$$_____________			I
echo             ___$$$$$$_____$_______			
echo             ___$$$$$$___$$_$$_____			N
echo             ____$$$$$___$__$$_____
echo             ____$$$$$______$$_____			O
echo             _____$$$$$____$$$_____	
echo             _______$$$$$$$$$______			
echo             __________$$$$________			
    exit /b
)

goto :inicio


