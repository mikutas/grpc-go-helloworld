FROM golang:1.21.2 as builder
ARG VERSION
COPY ./ /go/src/github.com/mikutas/grpc-go-helloworld/
RUN cd /go/src/github.com/mikutas/grpc-go-helloworld/ \
 && CGO_ENABLED=0 go build

FROM gcr.io/distroless/base-debian10
COPY --from=builder /go/src/github.com/mikutas/grpc-go-helloworld/ /bin
ENTRYPOINT [ "greeter_server" ]
