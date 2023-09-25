# cicd-helloworld

Basic workflow to create hello-world app infrastructure using Minikube and Terraform in addition to providing a monitoring stack.



## Monitoring Stack
```
sh monitoramento/install.sh
```
Install via helm Grafana and Prometheus.

If you want to uninstall the stack use:
```
sh monitoramento/uninstall.sh
```
The stack will be installed in the monitoramento namespace. It will automatically open the graphical interfaces in your browser.

### APP Build
```
docker build -t <image-name> .
```
The image name hello-world/v1 was used in the example.
Change the index.html file in /app to modify the splash screen.

### APP Install
```
terraform init
terraform plan
terraform apply
```
The application will be installed in the staging namespace with two replicas.

### Pipeline

Create pipeline for code verification only


### Comments

* Terraform could have been used to install monitoring. It was done via script just to diversify automation

* The application uses nginx as a base image
