FROM golang:1.7-alpine
RUN apk add --no-cache git

# Add Maintainer Info
LABEL maintainer="Prosper O <sirpos@gmail.com>"

# Copy dependency files in first to take advantage of Docker caching.
COPY go.mod go.sum ./

# Get and install listed dependencies in one, rather than go get & go install.
RUN go mod download

# Copy everything else from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

WORKDIR /
RUN go build -o oshop .
EXPOSE 80
CMD ["./oshop"]

# docker build -f Dockerfile -t oshop:latest .