#------------ AWS
#-------------aws/outputs.tf

output "instance_public_ip" {
  value = aws_instance.mike_instance.*.public_ip
}

# output "instance_ssh_path" {
#     value = "${local.instance_ssh_path}ssh_test.pub"
# }
/*
output "instance_ssh_pub_path" {
  value = local_file.public_ssh.id
}*/