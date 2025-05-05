FROM golang:1.23.0

WORKDIR /app

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go parcel.go

RUN go build ./main.go ./parcel.go

CMD ["/main"]