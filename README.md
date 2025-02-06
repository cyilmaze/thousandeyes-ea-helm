# ThousandEyes Enterprise Agent Kubernetes Helm Chart
### Deploy ThousandEyes Enterprise Agent on Kubernetes Cluster

Disclaimer: This repository contains non-official scripts. Please refer to ThousandEyes Documentation for official deployment models.

<ins> Install Helm <ins>
```
https://helm.sh/docs/intro/install/
```
<ins>Installation</ins>
1. Run the following commands on your host
```
curl -Os https://downloads.thousandeyes.com/bbot/configure_docker.sh
chmod +x configure_docker.sh
sudo ./configure_docker.sh
```
2. Kuberentes requires seccomp profiles files under directory /var/lib/kubelet/seccomp. Crete the seccomp directory.
```
sudo mkdir /var/lib/kubelet/seccomp
```
3. Copy ThousandEyes seccomp files from its original location to new seccomp path.
```
sudo cp /var/docker/configs/te-seccomp.json /var/lib/kubelet/seccomp/
```
4. Clone this repository to your server or management machines
```
helm repo add thousandeyes-ea-helm https://github.com/cyilmaze/thousandeyes-ea-helm
helm repo update
```
5.Create the TEAGENT_ACCOUNT_TOKEN variable in thousandeyes-credentials secret with your ThousandEyes Account Group Token
```
kubectl create secret generic thousandeyes-credentials --from-literal=TEAGENT_ACCOUNT_TOKEN=your-super-te-account-token -n your-namespace
```
6. Apply chart to deploy agent
```
helm install thousandeyes thousandeyes-ea-helm/thousandeyes-ea-helm -n your-namespace
```
7. Verify pod is Running
```
kubectl get pods -n thousandeyes
```
