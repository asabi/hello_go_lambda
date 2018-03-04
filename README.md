# AWS Lambda function - Go example

## Background
Go on AWS Lambda was announced on Jan 15th, 2018. At the time of writing this repo, there is very little information online around writing native Go AWS Lambda functions. This repository is for all of those who are looking for a guide to get started.

This README was written with a Mac osX machine in mind, but the instructions can easily be adjusted to Windows or Linux based operating systems.
## Getting Started

To get started with Go development with Lambda you will need the following:

- Install Go from the official site 

Make sure you add the following somewhere to your ~/.bash_profile file:

```
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
```
If you want to keep the same terminal window open, run the following command as well after making the above adjustment:
``` 
source ~/.bash_profile 
``` 

- Install Docker — Docker is used to run the AWS Lambda locally
- Install aws-sam-local — We will use this tool to be able to run Lambda locally on our machine during the development process.

### Why Use aws-sam-local?
Lambda functions are awesome, at the same time developing Lambda functions can be frustrating, especially when dealing with a compiled language such as Go (there is currently no interface to write the code inline. You have to upload a zipped version of your compiled binary to AWS Lambda). Every code change requires you to compile, zip and upload the code to test it. That’s where aws-sam-local comes in. You can simply make a code change and and type “make run” in the terminal to see the results.

## Create the Application
Type the following into a terminal window:

```
go get -u github.com/aws/aws-lambda-go/events
go get -u github.com/aws/aws-lambda-go/lambda
go get -u github.com/tidwall/gjson 
```

Once you did the above steps, you can download this repository.

# Trying Your New Application
Type the following:

```
cd $GOPATH/src/hello_go_lambda
make run
```

The above lines will change the directory to the application, compile and run the app. Note that on the very first run Docker will download the image to be able to run the application using aws-sam-local, this may take a couple of minutes. Subsequent calls will be much faster.

# What’s Next?

The Lambda function we created is specifically geared towards invoking using the AWS api gateway.
Creating the Lambda function and the corresponding API gateway to trigger the Lambda function from the web is beyond the scope of this README. There are many tutorials on how to do that.

[AWS official documentation for creating a Lambda function](https://docs.aws.amazon.com/lambda/latest/dg/get-started-create-function.html)

[AWS official documentation for getting started with api gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started.html)

Once you have the api gateway setup, you can call your Lambda function from a terminal window using:

**Important: The token has to match whatever you put in your template.yaml file. The token you see below is an example. Make sure to change it in your template.yaml file, and your go code**

```
curl -d '{"param1":"my param value","token":"35c760f4-b3dc-4657-b4f3-2c6566d4f42e"}' -H "Content-Type: application/json" -X POST  https://{url of api gateway}/V1/{endpoint}
```
