# ToDo App Docker Setup

## 🐳 Docker Hub Repository
https://hub.docker.com/r/chornoknysh/todoapp

## 🔧 Build the Docker Image
```bash
docker build --build-arg PYTHON_VERSION=3.8-slim -t todoapp:1.0.0 .