FROM golang:latest AS builder

WORKDIR /usr/local/bin

COPY full-cycle.go .

RUN go build full-cycle.go


FROM scratch

WORKDIR /usr/local/bin

COPY --from=builder /usr/local/bin/full-cycle .

ENTRYPOINT [ "full-cycle" ]