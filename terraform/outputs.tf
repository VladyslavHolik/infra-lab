output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.aws-instance-lab2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.aws-instance-lab2.public_ip
}

output "instance_public_url" {
  value = aws_instance.aws-instance-lab2.public_dns
}
