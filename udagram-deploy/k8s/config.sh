# echo -n $POSTGRESS_USERNAME | base64
# echo -n $POSTGRESS_PASSWORD | base64
# base64 .aws/credentials
# Many Thanks to Juan and Wallace
# for providing methods to inject env variable to k8s
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

kubectl apply -f backend-feed-deployment.yaml 

kubectl apply -f backend-feed-service.yaml 

kubectl apply -f backend-user-deployment.yaml 

kubectl apply -f backend-user-service.yaml 

kubectl apply -f frontend-deployment.yaml  

kubectl apply -f frontend-service.yaml 

kubectl apply -f reverseproxy-deployment.yaml 

kubectl apply -f reverseproxy-service.yaml 
