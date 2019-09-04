FROM golang:alpine as builder
RUN apk update && apk add --no-cache git
WORKDIR /work
RUN go mod init github.com/Matts966/microsv
COPY static /work/static
COPY main.go /work
RUN go get -u github.com/gobuffalo/packr/... && \
  CGO_ENABLED=0 GOOS=linux packr build -a -installsuffix cgo

FROM scratch
COPY --from=builder /work/microsv /main
EXPOSE 80
ENTRYPOINT [ "/main" ]
