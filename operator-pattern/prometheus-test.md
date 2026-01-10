# Create a ServiceMonitor (Operator discovers & scrapes your app)

This is the simplest and most convincing demonstration.

### **Step 1 — Deploy a tiny app that exposes metrics**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-app
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo-app
  template:
    metadata:
      labels:
        app: demo-app
    spec:
      containers:
      - name: demo
        image: prom/statsd-exporter
        ports:
        - name: metrics
          containerPort: 9102
---
apiVersion: v1
kind: Service
metadata:
  name: demo-app
  namespace: monitoring
  labels:
    app: demo-app
spec:
  selector:
    app: demo-app
  ports:
  - name: metrics
    port: 9102
    targetPort: metrics
```

### **Step 2 — Create a ServiceMonitor**
```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: demo-app
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: demo-app
  endpoints:
  - port: metrics
    interval: 15s
```

### **Step 3 — Show the Operator reacting**
Run:

```bash
kubectl get servicemonitors -n monitoring
kubectl get servicemonitors --all-namespaces
```

Then show that Prometheus has picked it up:

```bash
kubectl port-forward -n monitoring svc/prometheus-k8s 9090
```

Open:

```
http://localhost:9090/targets
```

When i visit it I see:

![1766860326683](image/prometheus-test/1766860326683.png)
