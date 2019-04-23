#!/bin/bash
# Скрипт синхронизации файлов из папки backup на локальном сервере с помощью \
# утилиты rsync. А затем удаление файлов старше n дней на удаленном сервере.
# для удобства IP-адрес клиента занесен в hosts.
# (c) Leonid Gorshkov 2019 | DevOps LevelUP
HOME_DIR=/home/backuser
i=7 #количество дней для удаления
# Синхронизация файлов
rsync -zavP --progress $HOME_DIR/backup/ backuser@client:$HOME_DIR/backup > $HOME_DIR/rsync_backup.log
# Удаление файлов на удаленном сервера старше $i дней
ssh backuser@client \
  "find $HOME_DIR/backup -maxdepth 1 -type f -mtime +$i -print0 | xargs -0 rm -f"
