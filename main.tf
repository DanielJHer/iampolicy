module "iam" {
    source = "./iam"
}

provider "aws" {
    region = var.aws_region
}