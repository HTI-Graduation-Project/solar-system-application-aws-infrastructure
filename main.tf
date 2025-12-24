module "solar-app-eks-module" {
  source  = "app.terraform.io/HTI-graduation-project/solar-app-eks-module/adelelnimr"
  version = "1.0.0"
}


terraform {
  backend "s3" {
    bucket       = "solar-app-s3"
    key          = "state_file/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}