.PHONY: run
run:
	docker build -t microsv . && docker run --rm --name microsv -it -p 80:80 microsv
