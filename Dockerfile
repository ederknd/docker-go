FROM golang:1.16 as builder

WORKDIR /go/src/app

COPY ./hello.go .

RUN go build ./hello.go

FROM scratch
 
WORKDIR /root/

COPY --from=builder /go/src/app/hello ./hello

CMD ["./hello"]
