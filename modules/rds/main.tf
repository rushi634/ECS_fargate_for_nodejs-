terraform {
  backend "s3" {
    bucket = "statefile-terraforming"
    key    = "path/to/my/rds.tfstate"
    region = "us-east-2"
  }
}
provider "aws" {
  region = "us-east-2"
}
