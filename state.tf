# terraform.tfstate 파일이 저장되는 백엔드
terraform {
  backend "s3" {
    bucket  = "gjh-aws-cicd-pipeline"
    encrypt = true
    key     = "terraform.tfstate"
    region  = "ap-northeast-2"
  }
}

provider "aws" {
  region = "ap-northeast-2"
}


