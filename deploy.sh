docker build -t gnosis5bit/odc-chat-beanstalk:latest -t gnosis5bit/odc-chat-beanstalk:$SHA .

docker push gnosis5bit/odc-chat-beanstalk:latest

docker push gnosis5bit/odc-chat-beanstalk:$SHA

kubectl apply -f k8s
kubectl set image deployments/chat-deployment server=gnosis5bit/odc-chat-beanstalk:$SHA