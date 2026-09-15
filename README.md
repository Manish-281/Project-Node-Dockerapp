# Node.js Dockerized App 🐳

A simple Node.js application Dockerized using Docker. This project demonstrates how to containerize a Node.js app from scratch.

---

## Features

- Simple Node.js HTTP server
- Dockerized with lightweight Alpine image
- `.dockerignore` for optimized builds
- Port binding (`3000:3000`)
- Easy to run with a single command

---

## Tech Stack

| Technology | Version |
|-----------|---------|
| Node.js | 18 (Alpine) |
| Docker | Latest |

---

## Project Structure

node-app/
├── app.js              # Node.js application
├── package.json        # Project metadata
├── Dockerfile          # Docker instructions
├── .dockerignore       # Files to exclude from build
├── .gitignore          # Files to exclude from git
└── README.md           # This file

---

## How to Run

### Prerequisites

Make sure you have the following installed:

- Docker (https://docs.docker.com/get-docker/)
- Git (https://git-scm.com/downloads)

Verify installation:

docker --version
git --version

---

### Step 1: Clone the Repository

git clone https://github.com/yourusername/node-docker-app.git
cd node-docker-app

---

### Step 2: Build the Docker Image

docker build -t node-app:v1 .

What this does:
- Reads the Dockerfile
- Creates a Docker image named node-app with tag v1
- Uses node:18-alpine as base image

Verify the image:

docker images

---

### Step 3: Run the Container

docker run -d --name my-node-app -p 3000:3000 node-app:v1

Flags explained:

| Flag | Description |
|------|-------------|
| -d | Run in detached (background) mode |
| --name my-node-app | Name the container |
| -p 3000:3000 | Map host port 3000 to container port 3000 |
| node-app:v1 | Image to use |

Verify the container is running:

docker ps

You should see:

CONTAINER ID   IMAGE        PORTS                    NAMES
a3b8f8d4e5c2   node-app:v1  0.0.0.0:3000->3000/tcp   my-node-app

---

### Step 4: Access the Application

Open your browser and go to:

http://localhost:3000

You should see:

Hello from Node.js Docker! 🚀 

Or test with curl:

curl http://localhost:3000

---

### Step 5: View Logs

docker logs my-node-app

Live logs:

docker logs -f my-node-app

---

### Step 6: Access Container Shell

docker exec -it my-node-app sh

Inside the container:

ls
cat app.js
exit

---

### Step 7: Stop and Remove

# Stop the container
docker stop my-node-app

# Remove the container
docker rm my-node-app

# Remove the image
docker rmi node-app:v1

---

## Updating the App

If you make changes to app.js:

# 1. Remove old container
docker rm -f my-node-app

# 2. Rebuild image
docker build -t node-app:v2 .

# 3. Run new container
docker run -d --name my-node-app -p 3000:3000 node-app:v2

---

## Docker Commands Cheat Sheet

| Command | Description |
|---------|-------------|
| docker build -t node-app:v1 . | Build image |
| docker images | List images |
| docker run -d -p 3000:3000 node-app:v1 | Run container |
| docker ps | List running containers |
| docker ps -a | List all containers |
| docker logs my-node-app | View logs |
| docker exec -it my-node-app sh | Access shell |
| docker stop my-node-app | Stop container |
| docker rm my-node-app | Remove container |
| docker rmi node-app:v1 | Remove image |

---

## Architecture

┌─────────────────────────────────────┐
│         Your Browser                │
│      http://localhost:3000          │
└──────────────┬──────────────────────┘
               │
               │ Port 3000
               ▼
┌─────────────────────────────────────┐
│         Docker Host                 │
│                                     │
│  ┌───────────────────────────────┐  │
│  │   Docker Container            │  │
│  │                               │  │
│  │   ┌───────────────────────┐   │  │
│  │   │  Node.js App          │   │  │
│  │   │  (Port 3000)          │   │  │
│  │   └───────────────────────┘   │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘

---

## What I Learned

- Writing a Dockerfile for a Node.js app
- Using .dockerignore to reduce image size
- Building and tagging Docker images
- Port binding with -p
- Container lifecycle (run, stop, rm)
- Viewing logs and accessing container shell

---

## Contributing

Pull requests are welcome! For major changes, please open an issue first.

---

## Author

Your Name
- GitHub: @yourusername - https://github.com/Manish-281
- LinkedIn: Your LinkedIn - https://www.linkedin.com/in/manishk670/

---
