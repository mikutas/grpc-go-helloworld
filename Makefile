# https://k3d.io/v5.4.6/usage/exposing_services/#2-via-nodeport
cluster:
	k3d cluster create mycluster -p "8082:30080@agent:0" --agents 2

clean:
	k3d cluster delete mycluster

deploy:
	kubectl apply -f manifest/greeter.yaml

undeploy:
	kubectl delete -f manifest/greeter.yaml

list:
	grpcurl -plaintext localhost:8082 list

hello:
	grpcurl -plaintext -d '{"name": "mikutas"}' \
	localhost:8082 helloworld.Greeter/SayHello
