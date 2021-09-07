
start: cluster rbac crds whoami traefik route

cluster:
	@echo "Starting stack"
	-k3d cluster delete mycluster
	k3d cluster create mycluster --api-port 6550 -p 8080:8080@loadbalancer -p 443:443@loadbalancer -p 443:443/UDP@loadbalancer --k3s-server-arg '--no-deploy=traefik'\
 	-i rancher/k3s:v1.20.2-k3s1
	k3d image import traefik/traefik:latest -c mycluster

rbac:
	@echo "RBAC"
	-kubectl delete -f rbac.yml
	kubectl apply -f rbac.yml

crds:
	@echo "CRDs v1"
	-kubectl delete -f crds.yml
	kubectl apply -f crds.yml

whoami:
	@echo "whoami"
	-kubectl delete -f whoami.yml
	kubectl apply -f whoami.yml

traefik:
	@echo "Traefik"
	-kubectl delete -f traefik.yml
	kubectl apply -f traefik.yml

route:
	@echo "Resources"
	-kubectl delete -f route.yml
	kubectl apply -f route.yml

stop:
	@echo "Stopping stack"
	k3d cluster delete mycluster
