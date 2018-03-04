compile:
	GOOS=linux go build -o myapp
run:compile
	aws-sam-local local invoke "myapp" -e event.json
ship:compile
	zip hello_lambda.zip myapp
