kubectl apply -f prometheus-cluster-role.yaml
kubectl apply -f prometheus-config-map.yam
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f prometheus-node-exporter.yaml
kubectl apply -f prometheus-svc.yaml

