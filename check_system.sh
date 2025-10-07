#Вставьте код скрипта
#Вставьте код скрипта
#!/bin/bash

# ===============================================
# Скрипт для базовой проверки состояния системы
# ===============================================

LOG_FILE="system_check.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# 1. Записываем дату и время начала проверки в файл лога
echo "=================================================" >> $LOG_FILE
echo "System Check started at: $DATE" >> $LOG_FILE
echo "-------------------------------------------------" >> $LOG_FILE

# 2. Проверяем использование оперативной памяти (Free Memory)
echo "Memory Usage (free -h):" >> $LOG_FILE
free -h | grep "Mem:" >> $LOG_FILE

# 3. Проверяем статус сервиса Docker
echo -e "\nDocker Status (systemctl):" >> $LOG_FILE
systemctl status docker | grep "Active:" >> $LOG_FILE

# 4. Выводим список запущенных контейнеров
echo -e "\nRunning Docker Containers (docker ps):" >> $LOG_FILE
docker ps >> $LOG_FILE

echo "System Check finished." >> $LOG_FILE
echo "=================================================" >> $LOG_FILE

# Выводим содержимое лога на экран
cat $LOG_FILE
