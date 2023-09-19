variable "region_value" {
    
    validation {
    condition = contains(["ap-south-1","us-east-1"], var.region_value)
    error_message = "The region  value should be one of the following valid values: 'ap-south-1','us-east-1' "
  }
  
}