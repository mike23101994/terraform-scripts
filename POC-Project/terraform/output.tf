output "instance_key" {
    value = aws_instance.nile-ec2.key_name
}

output "instance_id" {
    value = aws_instance.nile-ec2.id
}
output "instance_public_ip" {
    value = aws_instance.nile-ec2.public_ip
}