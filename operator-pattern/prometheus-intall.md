https://prometheus-operator.dev/docs/getting-started/installation/

Install using Kube-Prometheus 
The easiest way of starting with the Prometheus Operator is by deploying it as part of kube-prometheus. kube-prometheus deploys the Prometheus Operator and already schedules a Prometheus called prometheus-k8s with alerts and rules by default.

We are going to deploy a compiled version of the Kubernetes manifests.

You can either clone the kube-prometheus from GitHub:

git clone https://github.com/prometheus-operator/kube-prometheus.git
or download the current main branch as zip file and extract its contents:

github.com/prometheus-operator/kube-prometheus/archive/main.zip

Once you have the files on your machine change into the project’s root directory and run the following commands:

# Create the namespace and CRDs, and then wait for them to be available before creating the remaining resources
kubectl create -f manifests/setup

# Wait until the "servicemonitors" CRD is created. The message "No resources found" means success in this context.
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done

kubectl create -f manifests/
We create the namespace and CustomResourceDefinitions first to avoid race conditions when deploying the monitoring components. Alternatively, the resources in both folders can be applied with a single command:

kubectl create -f manifests/setup -f manifests
But it may be necessary to run the command multiple times for all components to be created successfully.

Note: For versions before Kubernetes v1.20.z refer to the Kubernetes compatibility matrix in order to choose a compatible branch.

Note: If you used Kube-Prometheus as the installation method, we would recommend you to follow this page to learn how to access the resources provided.

