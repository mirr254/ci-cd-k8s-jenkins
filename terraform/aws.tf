# Retrieve AWS credentials from env variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
# region -> eu-west-1
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "${var.region}" 
}