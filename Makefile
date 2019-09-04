.PHONY: run
run:
	docker build -t matts966/microsv . && docker run --rm --name microsv -it -p 80:80 matts966/microsv
