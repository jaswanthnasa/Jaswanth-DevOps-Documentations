#### terraform workspace list ====> to list the workspaces 
#### terraform workspace show ====> to show exactly the curent working workspace
#### terraform workspace new dev ====> to create a new workspace [name=dev]
#### terraform workspace new prod ====> to create a new workspace [name=prod]
#### terraform workspace select dev  ====> to select the particular workspace 

## commands to run this example
### terraform plan -var-file dev.tfvars
### terraform apply -var-file dev.tfvars
### terraform destroy -var-file dev.tfvars

