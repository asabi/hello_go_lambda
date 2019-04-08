.PHONY:compile
.PHONY:run
.PHONY:ship

compile:
	GOOS=linux go build -o myapp

run: 	compile
	sam local invoke "myapp" -e event.json

ship:	compile
	zip hello_lambda.zip myapp
