# Use the official Golang image as a base
FROM golang:1.21 AS builder

# Set the working directory
WORKDIR /app/cmd/web

# Copy the source code
COPY app/ .

# Use a compatible runtime image
FROM debian:bookworm-slim
# Newer version of Debian

# Install make
RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*

# Expose the application port
EXPOSE 8080

RUN go mod tidy

RUN go build -o webapp

CMD ["./webapp"]
