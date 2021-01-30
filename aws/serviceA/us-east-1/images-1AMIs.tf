data "aws_ami" "amazon-ami" {
    most_recent = true
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-2*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["amazon"]
}