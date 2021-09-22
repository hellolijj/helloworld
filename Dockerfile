# Build the manager binary
FROM golang:1.15 as builder

WORKDIR /workspace

# Copy the go source
COPY main.go main.go

# Build
RUN go build -o helloworld main.go

# Use Ubuntu 20.04 LTS as base image to package the manager binary
FROM ubuntu:focal

WORKDIR /
COPY --from=builder /workspace/helloworld .

ENTRYPOINT ["/helloworld"]
