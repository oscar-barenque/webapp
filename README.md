# Spring Boot Web App

This is a simple Spring Boot web application. The application displays a "Welcome to Web App!" message and a button that, when clicked, shows a "Hello, World!" message.

## Prerequisites

- Java 17
- Maven
- Docker (optional)
- Azure CLI (for deployment)
- Existing Azure Web App (for deployment) 

## Build and Run

1. Navigate to the project root directory (the same directory as the `pom.xml` file).
2. Run the following command to build the application:

```bash
mvn clean package
```

3. Run the following command to start the application:

```bash
mvn spring-boot:run
```

4. Open a web browser and navigate to http://localhost:8080 to access the web application.

## Running with Docker (optional)

1. Build a Docker image of the application by executing the following command in the project root directory:

```bash
docker build --tag webapp .
```

2. Run a Docker container with the built image:

```bash
docker run --name webapp --rm --port 8080:8080 webapp
```

3. Access the web application at http://localhost:8080 in a web browser.

To stop the running container, find the container ID using `docker ps`, and then execute the command `docker stop <container_id>`.

## Deploying to Azure App Services

1. Log in to your Azure account using the following command:

```bash
az login
```

2. Deploy the JAR file to the Web App:

```bash
az webapp deploy \
    --name <webapp-name> \
    --resource-group <resource-group-name> \
    --src-path target/webapp-0.0.1-SNAPSHOT.jar
```

Replace `<WebAppName>` with the name of your existing Azure Web App and `<ResourceGroupName>` with the name of the resource group associated with the web app.

3. Open a web browser and navigate to `https://<WebAppName>.azurewebsites.net` to access the web application, where `<WebAppName>` is the name of the existing web app.

