data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    # Replace this with your bucket name!
    bucket = "statefile-terraforming"
    key    = "path/to/my/vpc.tfstate"
    region = "us-east-2"
  }
}