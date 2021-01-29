resource "aws_instance" "sangchul_web01" {
    ami                         = "ami-047a51fa27710816e"
    instance_type               = "t2.micro"
    #ebs_optimized               = true
    #monitoring                  = true
    #count                       = 1
    key_name                    = aws_key_pair.sangchul_4wxyz.key_name
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.sangchul_vpc-sb3.id
    vpc_security_group_ids      = [
        aws_security_group.sangchul_vpc-ec2-web01.id
    ]
    tags = {
        Name                = "sangchul_web31"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "vpc"
        Service             = "network"
    }
    # ebs_block_device {
    #     volume_size         = 5
    #     volume_type         = "gp2"
    # }
}
resource "aws_instance" "sangchul_web32" {
    ami                         = "ami-047a51fa27710816e"
    instance_type               = "t2.micro"
    #ebs_optimized               = true
    #monitoring                  = true
    #count                       = 1
    key_name                    = aws_key_pair.sangchul_4wxyz.key_name
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.sangchul_vpc-sb4.id
    vpc_security_group_ids      = [
        aws_security_group.sangchul_vpc-ec2-web01.id
    ]
    tags = {
        Name                = "sangchul_web32"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "vpc"
        Service             = "network"
    }
}
