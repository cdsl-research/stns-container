NOTE_HASH=""

apk add git
while [ ! -e "/src/stns-config/gen.py" ]
do
  echo "WAITING"
  sleep 1
done
pip install -r /src/stns-config/requirements.txt

while :
do
  date +"%Y-%m-%d %H:%M:%S" | tr -d '\n'
  STNS_PID=$(pgrep stns)
  echo " STNS PID = $STNS_PID"
  cd /src/stns-config

　git config --global --add safe.directory /src/$(ls ../ | head -1)
  CURRENT_HASH=$(git rev-parse HEAD)
  if [ "$NOTE_HASH" == "$CURRENT_HASH" ]
  then
    date +"%Y-%m-%d %H:%M:%S" | tr -d '\n'
    echo " NO UPDATE $CURRENT_HASH"

  else
    date +"%Y-%m-%d %H:%M:%S" | tr -d '\n'
    echo " UPDATE $CURRENT_HASH"
    NOTE_HASH="$CURRENT_HASH"
    python gen.py
    mv cdsl.toml /config/.
    echo "$CURRENT_HASH" > /config/CURRENT_HASH
    pkill stns
  fi

  sleep 1
done
