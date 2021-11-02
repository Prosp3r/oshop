FROM golang:alpine
RUN apk add --no-cache git

# Add Maintainer Info
LABEL maintainer="Prosper O <sirpos@gmail.com>"

RUN apt-get update
RUN apt-get upgrade -y

ENV GOBIN /go/bin

RUN go get github.com/go-sql-driver/mysql

# Copy dependency files in first to take advantage of Docker caching.
# COPY go.mod go.sum ./

# Get and install listed dependencies in one, rather than go get & go install.
# RUN go mod download

#RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/golang-migrate/migrate
RUN go get github.com/golang-migrate/migrate/v4

# Copy everything else from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

WORKDIR /
RUN go build -o oshop .
EXPOSE 8080
CMD ["./oshop"]

# docker build -f Dockerfile -t oshop:latest .