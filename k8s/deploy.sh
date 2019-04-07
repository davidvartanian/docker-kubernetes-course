docker build -t davidvartanian/multi-client:latest -t davidvartanian/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t davidvartanian/multi-server:latest -t davidvartanian/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t davidvartanian/multi-worker:latest -t davidvartanian/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push davidvartanian/multi-client:latest
docker push davidvartanian/multi-server:latest
docker push davidvartanian/multi-worker:latest
docker push davidvartanian/multi-client:$SHA
docker push davidvartanian/multi-server:$SHA
docker push davidvartanian/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=davidvartanian/multi-server:$SHA
kubectl set image deployments/client-deployment client=davidvartanian/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=davidvartanian/multi-worker:$SHA