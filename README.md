# gRPC + Kubernetes + Go Distributed System

## Overview
This project demonstrates a distributed system using **gRPC**, **Kubernetes**, and **Go**. It includes a simple gRPC service, a client, and deployment to Kubernetes for scalability.

## Technologies Used
- **Go (Golang)** - Statically typed, compiled programming language.
- **gRPC** - High-performance Remote Procedure Call (RPC) framework.
- **Protocol Buffers (Protobuf)** - Efficient data serialization format.
- **Docker** - Containerization for microservices.
- **Kubernetes** - Container orchestration platform.

## Prerequisites
Ensure you have the following installed:
- **Go** (≥1.20) - [Download Go](https://go.dev/dl/)
- **Docker** - [Download Docker](https://www.docker.com/)
- **Kubernetes** (Minikube, Kind, or a cloud provider)
- **protoc** (Protocol Buffers compiler) - [Install protoc](https://grpc.io/docs/protoc-installation/)

## Setup & Installation

### 1. Clone the Repository
```bash
git clone https://github.com/RohanCyberOps/grpc-k8s-go-project.git
cd grpc-k8s-go-project
```

### 2. Generate gRPC Code
```bash
protoc --go_out=. --go-grpc_out=. proto/helloworld.proto
```

### 3. Run the gRPC Server Locally
```bash
go run server/server.go
```

### 4. Run the gRPC Client
```bash
go run client/client.go
```

## Running with Docker

### 1. Build Docker Image
```bash
docker build -t greeter-server:latest -f Dockerfile .
```

### 2. Run Container
```bash
docker run -p 50051:50051 greeter-server
```

## Deploy to Kubernetes

### 1. Start Kubernetes Cluster
```bash
minikube start
```

### 2. Deploy gRPC Server to Kubernetes
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 3. Get Service IP
```bash
kubectl get svc greeter-service
```

### 4. Update Client to Use Kubernetes Service IP
Modify `client.go` to use `EXTERNAL-IP:50051`, then run:
```bash
go run client/client.go
```

## Scaling & Monitoring

### 1. Scale Pods
```bash
kubectl scale deployment greeter-server --replicas=5
```

### 2. Monitor Logs
```bash
kubectl logs -l app=greeter-server --tail=50 -f
```

## License
This project is licensed under the MIT License.

