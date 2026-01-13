# gRPC-Web Nginx Reverse Proxy

## Project Description

Contains a ready-to-use **Reverse Proxy** configuration for proxying gRPC-Web
requests to a gRPC server.

### Purpose

To bypass CORS restrictions when working with gRPC-Web.

### Features

- **HTTP/2 Support** - support for the HTTP/2 protocol
- **gRPC-Web Compatibility** - handles gRPC-Web requests and responses
- **CORS** - automatic handling of CORS preflight requests
- **Trailing Headers** - preserves trailing headers in HTTP/2
- **Environment Variables** - configurable through environment variables

## Project Structure

```
nginx-proxy/
├── docker-compose.yml      # Docker Compose configuration
├── nginx.conf.template     # Nginx config with environment variables
├── .env.template           # Template for .env file
└── README.md
```

## Running the Project

You need to create a .env file first.

```bash
# In the project folder

# Start the container with logs
docker-compose up nginx
```

## Configuration

### Environment Variables (`.env`)

| Variable            | Description                                  | Examples                                  |
|---------------------|----------------------------------------------|-------------------------------------------|
| `NGINX_PORT`        | Port on the host                             | `8090`, `443`, `80`                       |
| `NGINX_LISTEN_PORT` | Listening port (usually equals `NGINX_PORT`) | `8090`, `443`, `80`                       |
| `GRPC_BACKEND`      | Address:port of the gRPC server              | `localhost:8080`, `api.example.com:50051` |

## Commands

```bash
# Start (with logs)
docker-compose up nginx

# Start in the background
docker-compose up -d nginx

# View logs
docker-compose logs -f nginx

# Stop
docker-compose stop nginx

# Restart (re-reads the config)
docker-compose restart nginx

# Stop and remove the container
docker-compose down

# Recreate the container with new environment variables
docker-compose down && docker-compose up -d nginx
```