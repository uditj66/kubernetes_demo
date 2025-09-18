set -e
NAME="kubernetes-demo-api"
SERVICE="devops-kubernetes-api-service"
USERNAME="uditj66"
IMAGE="$USERNAME/$NAME:latest"

echo "Building docker image...."
docker build -t $IMAGE .

echo "Pushing image to docker hub.........."
docker push $IMAGE

echo "Applying kubernetes manifests.........."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting Pods ...."
kubectl get pods


echo "Getting services ...."
kubectl get services

echo "Fetching the main service"
kubectl get services $SERVICE 