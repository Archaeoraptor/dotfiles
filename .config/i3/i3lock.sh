#!/bin/bash

blank='#00000000'  # blank
#background='#1A6785FF'
background='#1A5E81AC'
foreground='#D8DEE9FF'  # text

primary='#82b1ff'  # default
alert='#EBCB8BFF'  # wrong
verifying='#A3BE8CFF'  # verifying

i3lock \
--screen 1 \
--indicator \
--keylayout 2 \
--force-clock \
\
--insidever-color=$background    \
--insidewrong-color=$background  \
--inside-color=$background       \
\
--ringver-color=$primary         \
--ringwrong-color=$alert         \
--ring-color=$primary            \
\
--line-color=$primary            \
--line-uses-inside \
\
--keyhl-color=$alert             \
--bshl-color=$alert              \
\
--separator-color=$primary       \
\
--verif-color=$foreground        \
--wrong-color=$foreground        \
--time-color=$foreground \
--date-color=$foreground         \
--layout-color=$foreground       \
\
--time-align=0 \
--date-align=0 \
--layout-align=0 \
--verif-align=0 \
--wrong-align=0 \
--modif-align=0 \
\
--blur 5              \
--indicator           \
--keylayout 2         \
\
--verif-text=""          \
--wrong-text=""          \
--clock               \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
# --modsize=10 \
--time-font=noto-sans    \
--date-font=noto-sans    \
# etc



