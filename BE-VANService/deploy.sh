# DOCKER ENV

export VAN_SERVICE_NAME="be-van"
export VAN_SERVICE_IMAGE_NAME="van-service"
export VAN_SERVICE_IMAGE_VERSION="0.0.1"
export NETWORK_NAME="bridge-signature"

# DOCKER IMAGE UPDATE

if docker image inspect $VAN_SERVICE_IMAGE_NAME:$VAN_SERVICE_IMAGE_VERSION &> /dev/null; then
    docker image rm -f $VAN_SERVICE_IMAGE_NAME:$VAN_SERVICE_IMAGE_VERSION
fi

docker build -t $VAN_SERVICE_IMAGE_NAME:$VAN_SERVICE_IMAGE_VERSION .

# DOCKER SERVICE RUN

if [ "$(docker ps -aq -f name=$VAN_SERVICE_NAME)" ]; then
    docker rm -f $VAN_SERVICE_NAME
fi

docker run -d \
--network $NETWORK_NAME \
--name $VAN_SERVICE_NAME \
-p $VAN_SERVICE_PORT:$VAN_SERVICE_PORT \
$VAN_SERVICE_IMAGE_NAME:$VAN_SERVICE_IMAGE_VERSION