# Hentikan script jika error
set -e

#var
LOCAL_IMAGE_NAME="item-app"
TAG="v1"
DOCKERHUB_USERNAME="rakafd"
DOCKERHUB_IMAGE_NAME="$DOCKERHUB_USERNAME/$LOCAL_IMAGE_NAME:$TAG"

echo "Membuat Docker iameg $LOCAL_IMAGE_NAME:$TAG..."
docker build -t $LOCAL_IMAGE_NAME:$TAG . #membuild docker dengan data item-app:v1

echo "cek image"
docker images #mengecek images yang ada didocker

echo "ubah image $DOCKERHUB_IMAGE_NAME..."
docker tag $LOCAL_IMAGE_NAME:$TAG $DOCKERHUB_IMAGE_NAME

#mengecek jika sudah belum login nya docker
if ! docker info > /dev/null 2>&1; then
  echo "Docker belum jalan atau belum login."
  exit 1
fi

echo "login" #docker login
docker login

echo "coba u[pload"
docker push $DOCKERHUB_IMAGE_NAME #docker push image ke docker hub

echo "Selesai. Image tersedia di: https://hub.docker.com/r/$DOCKERHUB_USERNAME/$LOCAL_IMAGE_NAME/tags"  #untuk menampilkan alamat dockerhub yang sudah teruplaod tadi