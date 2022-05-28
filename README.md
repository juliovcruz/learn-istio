Commands usage:

1. k3d cluster create -p "8080:30000@loadbalancer" --agents 2
2. kubectl label namespace default istio-injection=enabled
3. istioctl install -y
-- add istio label
2. kubectl apply -f deployment.yaml
Observability
3. kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/prometheus.yaml
4. kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/kiali.yaml
5. kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/jaeger.yaml
6. kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/grafana.yaml
7. kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/httpbin/sample-client/fortio-deploy.yaml




-- 

export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')
kubectl exec "$FORTIO_POD" -c fortio -- fortio load -c 2 -qps 0 -t 200s -loglevel Warning http://nginx-service:8080

### Consistent Hash Test

1. kubectl exec -it {{pod}} -- bash
2. curl --header "x-user: julio" http://nginx-service:8080