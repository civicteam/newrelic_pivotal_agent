#!/usr/bin/env sh

# Waits for the directory passed as an argument to exist. Exits with status 1 if it fails.

DIR=$1
WAIT_SECONDS=90

#until test $((WAIT_SECONDS--)) -eq 0 -o -d "$DIR" ; do sleep 1; done

while [ ${WAIT_SECONDS} -gt 0 ];
do
  if [ -d "$DIR" ]
  then
    exit 0;
  fi

  WAIT_SECONDS=$((${WAIT_SECONDS}-1))
  sleep 1;
done

echo "[wait-dir] Operation timed out"
exit 1;
