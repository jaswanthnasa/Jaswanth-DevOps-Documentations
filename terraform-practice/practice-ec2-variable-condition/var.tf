variable "region_value" {

  type        = string
  description = "enter region value"
  # default = "ap-south-1"

  validation {
    condition     = contains(["ap-south-1", "us-east-1"], var.region_value)
    error_message = "The region value should be one of the following valid values: 'ap-south-1','us-east-1' "
  }

}

variable "name" {

  description = "tag name to associate with ec2 instance"
  type        = string
  default     = null


  validation {
    condition     = can(regex("^[a-z]{2}$", var.name))
    error_message = "The name should be exactly two characters & should be all lowercase letters. Regex condition used: '^[a-z]{2}$'."
  }
}

