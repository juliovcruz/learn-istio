up:
	k3d cluster create -p "8080:30000@loadbalancer" --agents 2 \
	&& kubectl label namespace default istio-injection=enabled
	&& istioctl install \
	&& add istio label \
	&& kubectl apply -f deployment.yaml \
	&& kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/prometheus.yaml \
	&& kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/kiali.yaml \
	&& kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/jaeger.yaml \
	&& kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/grafana.yaml \
	&& kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/httpbin/sample-client/fortio-deploy.yaml \
	&& export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')