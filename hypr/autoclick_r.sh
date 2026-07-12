#!/bin/bash
PIDFILE="/tmp/autoclick_r.pid"

if [ -f "$PIDFILE" ]; then
  PID=$(cat "$PIDFILE")
  kill "$PID" 2>/dev/null
  rm "$PIDFILE"
  exit 0
fi

# Автоматически находим первое доступное устройство-клавиатуру в системе
KBD_DEVICE=$(ls /dev/input/by-path/*-kbd 2>/dev/null | head -n 1)

# Если по какому-то пути *-kbd не найдено, ищем в стандартных event-файлах
if [ -z "$KBD_DEVICE" ]; then
  KBD_DEVICE=$(grep -E 'Handlers|EV=' /proc/bus/input/devices |
    grep -B1 'EV=120013' | grep -oE 'event[0-60]' |
    head -n 1 | awk '{print "/dev/input/"$1}')
fi

# Если устройство всё равно не найдено, пишем ошибку в лог и выходим
if [ -z "$KBD_DEVICE" ] || [ ! -e "$KBD_DEVICE" ]; then
  echo "Ошибка: Клавиатура не найдена в /dev/input/" >/tmp/autoclick_error.log
  exit 1
fi

(
  while true; do
    # Отправляем чистые аппаратные сигналы в найденное устройство клавиатуры
    # 19 — это код клавиши R, 1 — нажать, 0 — отпустить
    evemu-event "$KBD_DEVICE" --type EV_KEY --code 19 --value 1 --sync
    sleep 0.04
    evemu-event "$KBD_DEVICE" --type EV_KEY --code 19 --value 0 --sync

    sleep 0.1
  done
) &

echo $! >"$PIDFILE"
