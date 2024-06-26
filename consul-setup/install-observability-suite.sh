helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && \
helm repo add grafana https://grafana.github.io/helm-charts && \
helm repo update && \
helm install --values helm/prometheus.yaml prometheus prometheus-community/prometheus --version "15.5.3" && \
kubectl rollout status deployment prometheus-server --namespace default --timeout=300s && \
# helm install loki --values helm/loki.yaml grafana/loki-stack --version "2.9.9" && \
# kubectl rollout status statefulset loki --namespace default --timeout=300s && \
helm install --values helm/grafana.yaml grafana grafana/grafana --version "6.23.1" && \
kubectl rollout status deployment grafana --namespace default --timeout=300s && \
echo "#######################################" && \
echo "Observability Suite Deployment Complete" && \
echo "#######################################"