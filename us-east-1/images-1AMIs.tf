data "aws_ami" "tf_ami-goldimage" {
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