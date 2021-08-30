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
  cd /src/stns-config

  CURRENT_HASH=$(git rev-parse HEAD)
  if [ "$NOTE_HASH" == "$CURRENT_HASH" ]
  then
    date +"%Y-%m-%d %H:%M:%S" | tr -d '\n'
    echo " NO UPDATE "

  else
    date +"%Y-%m-%d %H:%M:%S" | tr -d '\n'
    echo " UPDATE "
    NOTE_HASH="$CURRENT_HASH"
    python gen.py
    mv cdsl.toml /config/.
  fi

  sleep 1
done
