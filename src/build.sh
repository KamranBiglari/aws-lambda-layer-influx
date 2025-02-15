#!/bin/bash
set -euo pipefail

cd $(dirname $0)

echo ">> Building AWS Lambda layer inside a docker image...."

TAG='aws-lambda-layer-influx'

docker build -t ${TAG} --progress=plain  .

echo ">> Extrating layer.zip from the build container..."
CONTAINER=$(docker run -d ${TAG} false)
docker cp ${CONTAINER}:/layer.zip layer.zip

echo ">> Stopping container..."
docker rm -f ${CONTAINER}
echo ">> lib/layer.zip is ready"