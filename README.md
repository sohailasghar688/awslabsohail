# awslabsohail

####AWS keys must configure where we are running this terraform code. Shared in person!

Key file names are "test" and "test.pub". They should reside with the terraform files.


terraform init ## after updating the keys
terraform plan --out output.txt   ##Show changes required by the current configuration
terraform apply output.txt  ##Create or update infrastructure
