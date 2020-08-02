FROM golang:latest as builder
WORKDIR /go/src/github.com/pedropinheiro75/odc-chat-k8s
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o odc-chat-k8s .

FROM alpine:latest
LABEL maintainer="Pedro Pinheiro <pinheiro.pedrohl@gmail.com>"
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /pedropinheiro75 .
COPY home.html /root/
EXPOSE 8080
CMD ["./odc-chat-k8s"]