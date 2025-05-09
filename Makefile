.PHONY: start ci

lint:
	docker run --rm -it -v $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
tst:
	docker compose exec app go test main_test.go
start:
	docker compose up -d

ci: start lint tst