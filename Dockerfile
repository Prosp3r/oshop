FROM golang:alpine 
RUN apk add git

# Copy dependency files in first to take advantage of Docker caching.
COPY go.mod go.sum ./

# Get and install listed dependencies in one, rather than go get & go install.
RUN go mod download

# Copy everything else from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# RUN mkdir /app
# ADD ./server /app
# COPY ./pb /pb
WORKDIR /
RUN go build -o oshopapp .
EXPOSE 8080
CMD ["./oshop"]