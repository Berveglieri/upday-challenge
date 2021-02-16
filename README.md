# upday-challenge

The code to build a k8s cluster in GCP was created with all the requested requirements.
To be able to execute the code you need to create a bucket named upday-challenge-tf-state (check terraform.tf).
You need to provide your credentials, the credentials file with the private key and the service account weren't pushed to git for security reasons.

All the tests were execute against my local k8s-cluster running on kvm, you can build the exact same cluster cloning this repo: https://github.com/Berveglieri/k8s-kvm
The tests weren't executed against the GCP k8s cluster because of the costs involved, I only tested the infrastrcuture and destroyed everything.

The jenkins volume backup can be downloaded here: https://drive.google.com/file/d/1cD81vVD5TmkBMq7UG1rcz2Epi9XH9MhD/view?usp=sharing

The idea was to create two environments (production and staging) using terraform workspaces and kustomize to deploy and separate all the configuration of both environments.

jenkins was used to deploy the application hello-world to the cluster.

kubectl get pods -n hello-world 
NAME                           READY   STATUS    RESTARTS   AGE
hello-world-7d7b6c6578-2fcwq   1/1     Running   0          22m
hello-world-7d7b6c6578-7swzx   1/1     Running   0          22m
hello-world-7d7b6c6578-sjfwh   1/1     Running   0          22m

docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                              NAMES
a8e02f357184        jenkins:upday       "/sbin/tini -- /usr/…"   7 hours ago         Up 7 hours          0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   jenkins-upday


everything can be reproduced just building the Dockerfiles and running kustomize following the structure described to simulate the production environment.

