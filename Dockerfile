FROM golang:1.15.2-alpine3.12

RUN apk add --no-cache git

# Add Maintainer Info
LABEL maintainer="Prosper O <sirpos@gmail.com>"

# Build Args
ARG HOME_DIR
ARG MODULE_NAME
ARG CMD_NAME
ARG LOG_DIR_NAME
ARG VOLUME_DIR
ARG VERSION
ARG PORT
ARG CGO_ENABLED

RUN echo "Build number:" . $VERSION

# Set the Current Working Directory inside the container
WORKDIR $MODULE_NAME

# Copy dependency files in first to take advantage of Docker caching.
COPY go.mod go.sum ./

# Get and install listed dependencies in one, rather than go get & go install.
RUN go mod download

# Copy everything else from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

WORKDIR /
RUN go build -o oshop .
EXPOSE 8080
CMD ["./oshop"]

# docker build -f Dockerfile -t oshop:latest .