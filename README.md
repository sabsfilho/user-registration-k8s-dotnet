# User Registration Service by K8S .NET 8<br/>
This is a Kubernetes (K8S) container having a .NET 8 RESTful API service to register a user record.<br/><br/>
The development environment was built by VS Code Dev Container which I strongly recommend because it really saves us time and avoids a lot of headaches related to installation, configuration and setup.<br/>
I created a __devcontainer.json__ configuration file having all the infrastructure we need to build, test and deploy this project.<br/><br/>
To keep each layer of this application very well defined and to foster maintainability, using the Separation of concerns principle, I also created a .NET Class Library project that is consumed by the .NET RESTFul minimal API project.<br/><br/>
I am using the Kubernetes command-line tool (kubectl) to run commands against K8S clusters.<br/>
https://kubernetes.io/<br/>

I am also using the minikube tool to run and test our created K8S before deploying.<br/>
https://minikube.sigs.k8s.io/docs/<br/>

It's important to mention that we need Docker to build this project container image and also a valid Docker Hub account to register and deliver it.<br/>
https://hub.docker.com/<br/>

I created three bash scripts that have explanations about each installation , configuration, build and test steps.<br/>
__- build-dotnet-webapi-project.sh__: this bash contains commands and instructions to create the .NET solution, projects and artifacts.<br/>
__- build-docker.sh__: this bash contains commands and instructions to build the Docker image and push it to the Docker Hub.<br/>
Please, check the __Dockerfile__.<br/>
__- build-kubernetes.sh__: this bash contains commands and instructions to pull Docker image, run __kubectl__, configure, test and debbug __minikube__.<br/>
Please, check the __user-registration-app-deployment.yaml__.<br/>

This GitHub project is related to an article that I am reviewing and it will be released soon. This article explains better how to put everything working, I'll also detail some concepts and give sources about the solutions I decided to use here.<br/><br/>

__under construction__
