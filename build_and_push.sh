IMAGE_NAME=$(basename "$PWD")

if [ -n "$1" ]; then
    docker build -t tibhome/${IMAGE_NAME}:${1} .
    docker push tibhome/${IMAGE_NAME}:${1}
else
    echo "Le paramètre VERSION n'existe pas"
    exit 1
fi

