# ------- terraform-demo-project 
# --------  IBM 
# -------- root/providers.tf

terraform {
  required_version = "v0.15.1"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

provider "ibm" {    
  ibmcloud_api_key = var.ibmcloud_api_key
}
