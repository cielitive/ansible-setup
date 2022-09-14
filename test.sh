if [[ "$1" == "--email" ]]; then
  if [[ "$3" == "--password" ]]; then
    email=$2
    password=$4
  else
    echo "./create_user.sh --email <email> --password <password>"
    exit 1
  fi
elif [[ "$1" == "--password" ]]; then
  if [[ "$3" == "--email" ]]; then
    password=$2
    email=$4
  else
    echo "./create_user.sh --email <email> --password <password>"
    exit 1
  fi
else
  echo "./create_user.sh --email <email> --password <password>"
  exit 1
fi

if [[ "$email" == "" || $password == "" ]]; then
  echo "./create_user.sh --email <email> --password <password>"
  exit 1
fi
