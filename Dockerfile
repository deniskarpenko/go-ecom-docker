# Use the official Golang image as a base
FROM golang:1.21 AS builder

# Set the working directory
WORKDIR /app

# Copy the source code
COPY app/ .

# Build the application
RUN go build -o app .

# Use a compatible runtime image
FROM debian:bookworm-slim
# Newer version of Debian
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/app .

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["./app"]
