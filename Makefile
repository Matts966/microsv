.PHONY: run
run:
	docker build -t matts966/microsv . && docker run --rm --name microsv -d -p 80:80 matts966/microsv
