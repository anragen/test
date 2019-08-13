kubectl create ns monitoring
helm install stable/prometheus \
    --namespace monitoring \
    --name prometheus
sleep 10

kubectl apply -f config.yml
helm install stable/grafana \
-f values.yml \
--namespace monitoring \
--name grafana
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
