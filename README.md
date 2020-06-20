# Udagram Image Filtering Application

Udagram is a simple cloud application developed alongside the Udacity Cloud Engineering Nanodegree. It allows users to register and log into a web client, post photos to the feed, and process photos using an image filtering microservice.

The project is split into four parts:

1. The Simple Frontend A basic Ionic client web application which consumes the RestAPI Backend.
   Frontend: port 8100.
   port-forward 8100:8100
   frontend use port 80 but forward to port 8100 of the localhost.
   Command: npm run start or ionic serve

2. The RestAPI Feed Backend, a Node-Express feed microservice.
   Feed Backend: port 8080
   Command: npm run dev or npm run prod

3. The RestAPI User Backend, a Node-Express user microservice.
   User Backend: port 8080.
   don't need to portforward port 8080 to localhost due to passs reverseproxy port
   Command: npm run dev or npm run prod

4. Revers Proxy port 8080
   port-forward 8080:8080
   Reverseproxy runs at port 8080, same as backend-feed and backend-user server.

### Prerequisite

Create account and login to Docker Hub and create the following repositories:
1. udagram-feed
2. udagram-user
3. udagram-frontend
4. reverseproxy

Afterwards, we can prevent the file from being included in your solution by adding the file to our `.gitignore` file.

### For Docker:
First, install Docker in your system.
Create the docker images for the frontend, udagram-feed, and udagram-user folders.
E.g. the command is docker build -t [name]/udagram-frontend .
For Reverseproxy, you need to create another docker image in the Deployment folder using the same command.

Once all images are pushed, you can build using sudo -E docker-compose up whilst in the docker deployment folder.
Go to Localhost:8080 to test.
Docker deployment complete.

### For Kubernetes:
Install Kubernetes using the Kubeone instructions given here: https://github.com/kubermatic/kubeone/blob/master/docs/quickstart-aws.md
Follow the tutorial videos closely, and export the KubeConfig.
Check for the proper setup by using 'kubectl get pods' cmd.
Set up the secret keys and configmaps for the project. There are the .yaml files in the k8s folder.
Run the config.sh command (run chmod a+x.. first)
Bascially the script will run the following command:
kubectl apply -f [file-name] on the secret key, config map files.
kubectl apply -f [file-name]' again for the remaining .yaml files.

If all is set up correctly, you will see all pods running. Test using kubectl get rs, kubectl get deployment, and kubectl get pods`.
Forward the deployment port to localhost:8100 and localhost:8080 using (if not load balance type in yaml file)
kubectl port-forward [name]/reverseproxy-[id] 8080:8080.
kubectl port-forward [name]/frontend-[id] 8100:80
Go to Localhost:8100 to test
Kubernetes deployment completed.

### For Travis:
Ensure your Github account is linked to Travis. This is done via signing up for a Travis account, then from within linking the two together.
Push your folders to Github repository.
Ensure the .travis.yml file is in the root folder of the Github repo.
Go to Travis, then search for the repository, and then set up new build.
Travis deployment completed.

### Screenshots
screenshots folder

Docker images in repository in DockerHub
TravisCI build pipeline showing successful build jobs
Kubernetes kubectl get pods output
Kubernetes kubectl describe services output
Kubernetes kubectl describe hpa output
Kubernetes kubectl logs <pod name> output
