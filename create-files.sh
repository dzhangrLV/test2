#!/bin/bash
# hourly create-files.sh
# Каждый час создается файл с генерированными данными из /dev/urandom, заполненный последовательностью
# из букв и цифр (50 строк в каждой по 20 символов)
# (c) Leonid Gorshkov 2019 | DevOps LevelUP
HOME_DIR="/home/backuser/"
cat /dev/urandom | tr -d -c 'a-zA-Z0-9' | fold -w 20 | head -50 > $HOME_DIR/backup/file-`date "+%Y-%m-%d-%H-%M"`.txt
