### Docker Learning Notes

#### Beginner Stage (Basics & Foundations)

- **What is Docker?**
  - A containerization platform that allows developers to package applications and their dependencies into isolated environments called **containers**.
  - Facilitates consistent deployment across different environments (development, testing, production).
  
- **Why Use Docker?**
  - Simplifies environment setup and management.
  - Promotes microservices architecture.
  - Enhances scalability and resource efficiency.
  - Enables easy version control and rollbacks.

- **Installing Docker**
  - Follow the official installation guide for your operating system (Windows, macOS, Linux).
  - Verify installation using:
    ```bash
    docker --version
    ```

- **Understanding Images and Containers**
  - **Image**: A read-only template used to create containers; includes application code and libraries.
  - **Container**: A runnable instance of an image; isolated environment for executing applications.

- **Docker CLI Basics**
  - Interface for interacting with Docker through command-line commands.
  
- **Basic Docker Commands**
  - `docker run`: Create and start a container from an image.
  - `docker ps`: List running containers.
  - `docker stop [container_id]`: Stop a running container.
  - `docker rm [container_id]`: Remove a stopped container.
  - `docker images`: List available images on the local machine.
  - `docker rmi [image_id]`: Remove an image.

- **Pulling and Running Images**
  - Use `docker pull [image_name]` to download images from **Docker Hub**.
  - Example to run an Nginx container:
    ```bash
    docker run -d -p 80:80 nginx
    ```

- **Creating a First Containerized App**
  - Example: Running a simple **Node.js** application in a container.
  - Basic steps:
    1. Create a `Dockerfile` with Node.js setup.
    2. Build the image:
      ```bash
      docker build -t my-node-app .
      ```
    3. Run the container:
      ```bash
      docker run -d -p 3000:3000 my-node-app
      ```

#### Intermediate Stage (Practical Usage & Projects)

- **Building Custom Docker Images**
  - Use a **Dockerfile** to define the image.
  - Key Dockerfile instructions:
    - `FROM`: Specify base image.
    - `COPY`: Copy files/directories into the image.
    - `RUN`: Execute commands during image build.
    - `CMD`: Default command to run when the container starts.

- **Understanding Layers and Caching**
  - Each command in a Dockerfile creates a new layer.
  - Docker caches layers to speed up builds; changes in earlier layers invalidate the cache.

- **Using .dockerignore**
  - Similar to `.gitignore`, it specifies files/directories to exclude from the build context.

- **Docker Volumes and Persistent Storage**
  - **Volumes**: Persistent storage for containers, allowing data to persist after container removal.
  - Create a volume:
    ```bash
    docker volume create my-volume
    ```
  - Mount a volume to a container:
    ```bash
    docker run -v my-volume:/data my-image
    ```

- **Docker Networks**
  - Types of networks:
    - **Bridge**: Default network for containers; isolated from the host.
    - **Host**: Containers share the host's networking.
    - **Custom Networks**: Create specific networks for different applications.
  - Create a custom network:
    ```bash
    docker network create my-network
    ```

- **Environment Variables & Configuration Management**
  - Pass environment variables at runtime:
    ```bash
    docker run -e MY_ENV_VAR=value my-image
    ```

- **Multi-Container Apps with Docker Compose**
  - Define services in a `docker-compose.yml` file.
  - Example structure:
    ```yaml
    version: '3'
    services:
      web:
        image: nginx
      db:
        image: mongo
    ```
  - Start all services:
    ```bash
    docker-compose up
    ```

- **Hands-On Project: MERN Stack with Docker Compose**
  - Set up a multi-container app for MongoDB, Express, React, and Node.js.
  - Create a `docker-compose.yml` file to configure services.

#### Advanced Stage (Real-world & DevOps Level)

- **Best Practices for Writing Dockerfiles**
  - Keep images **small** by minimizing installed packages.
  - Make images **secure** by running as a non-root user.
  - Ensure images are **efficient** with proper layer management.

- **Multi-Stage Builds**
  - Use multiple `FROM` statements to build smaller, production-ready images.
  - Example:
    ```Dockerfile
    FROM node:14 AS builder
    WORKDIR /app
    COPY . .
    RUN npm install
    FROM nginx
    COPY --from=builder /app/build /usr/share/nginx/html
    ```

- **Docker Security Essentials**
  - Manage **user permissions** within containers.
  - Implement image **scanning** to identify vulnerabilities.
  - Use **secrets management** tools for sensitive data.

- **Working with Private Registries**
  - Push and pull images from private registries (Docker Hub, GitHub Container Registry, AWS ECR, GCP Artifact Registry).
  - Authenticate using:
    ```bash
    docker login [registry_url]
    ```

- **CI/CD with Docker**
  - Implement Continuous Integration/Continuous Deployment using tools like GitHub Actions or GitLab CI.
  - Example of a GitHub Actions workflow:
    ```yaml
    name: CI
    on:
      push:
        branches:
          - main
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v2
          - name: Build Docker image
            run: docker build -t my-image .
          - name: Push Docker image
            run: docker push my-image
    ```

- **Scaling with Docker Swarm & Intro to Kubernetes**
  - Use **Docker Swarm** for orchestrating multiple containers.
  - Introduction to **Kubernetes** as a container orchestration platform for managing large-scale applications.

- **Monitoring & Logging Docker Containers**
  - Implement monitoring solutions like **Prometheus** or **Grafana**.
  - Use the **ELK stack** (Elasticsearch, Logstash, Kibana) for logging and visualizing container logs.

- **Final Project: Deploy a Full-Stack App with CI/CD Pipeline**
  - Build a complete application with a CI/CD pipeline using Docker and cloud hosting (AWS, GCP, Azure, Render).
  - Ensure deployment automation through Docker containers.

### Summary of Key Docker Commands
- `docker run`: Run a container.
- `docker ps`: List running containers.
- `docker stop`: Stop a container.
- `docker rm`: Remove a container.
- `docker images`: List images.
- `docker rmi`: Remove an image.
- `docker pull`: Download an image from a registry.
- `docker build`: Build an image from a Dockerfile.
- `docker volume create`: Create a volume.
- `docker network create`: Create a custom network.
- `docker-compose up`: Start services defined in `docker-compose.yml`.

These notes provide a structured approach to learning Docker from the basics to advanced concepts, including practical applications and command usage.
