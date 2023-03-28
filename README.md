# vueapp using Docker and nginx

## Install and create vuejs project
```
1. yarn global add @vue/cli
2. vue create vueapp

```

### create a Dockerfile inside vueapp and write a code. This Dockerfile uses a two-stage build process, where the first stage installs the app dependencies and builds the app, and the second stage uses the nginx image to serve the compiled app.

first stage :
# a. Use a node image
# b. Copy all our Vue files into a working directory
# c. Install the project dependencies with yarn
# d. Build the app with yarn

second stage:
a. Use an nginx image
b. Remove any default static assets from the nginx image
c. Copy our static assets from the builder image we created in the first stage
d. Specify the entrypoint for our container to run nginx


### Build a image 
```
docker build -t vueapp .
```
### Now that our image is built, we can start a container with the following command, which will serve our app on port 8080
```
docker run --rm -it -p 8080:80 vueapp
```
### Navigate to http://localhost:8080, and you should now see the Vue app. ThankYou.


### Summary:
```
NGINX can be used as a web server or reverse proxy to serve the static content.
Docker is used as the container runtime.
Docker image can be built with docker build -t vueapp .
Run the container with this command docker run -d --name vueui -p 80:80 vueapp.
```
