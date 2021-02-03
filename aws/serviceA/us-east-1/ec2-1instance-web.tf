###인스턴스 생성(sangchul_web31)
resource "aws_instance" "tf_instance_web31" {
    ami                         = "ami-047a51fa27710816e"
    instance_type               = "t2.micro"
    #ebs_optimized               = true
    #monitoring                  = true
    #count                       = 1
    key_name                    = aws_key_pair.tf_key_4wxyz.key_name
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.tf_vpc99-sb11.id
    vpc_security_group_ids      = [
        aws_security_group.tf_vpc99_sg-ec2-web1.id,
        aws_security_group.tf_vpc99_sg-ec2-office1.id
    ]
    user_data = file("./script/install_web1.sh")
    tags = {
        Name                = "web31"
        Env                 = "stg"
        CreateUser          = "terraform@email.com"
        Owner               = "iac"
        Role                = "web"
        Service             = "aws_instance"
    }
    root_block_device {
        volume_type         = "gp2"
        volume_size         = 30
        tags = {
            Name            = "web31"
            Env             = "stg"
            CreateUser      = "terraform@email.com"
            Owner           = "iac"
            Role            = "web"
            Service         = "root_block_device"
        }
    }
    # ebs_block_device {
    #     device_name             = "/dev/xvda"
    #     volume_size             = 30
    #     volume_type             = "gp2"
    #     delete_on_termination   = false
    #     tags = {
    #         Name                = "web31"
    #         Env                 = "stg"
    #         CreateUser          = "terraform@email.com"
    #         Owner               = "iac"
    #         Role                = "web"
    #         Service             = "ebs_block_device"
    #     }
    # }
}
###인스턴스 생성(sangchul_web32)
# resource "aws_instance" "sangchul_web41" {
#     ami                         = "ami-047a51fa27710816e"
#     instance_type               = "t2.micro"
#     #ebs_optimized               = true
#     #monitoring                  = true
#     #count                       = 1
#     key_name                    = aws_key_pair.sangchul_4wxyz.key_name
#     associate_public_ip_address = true
#     subnet_id                   = aws_subnet.sangchul_vpc11-sb4.id
#     vpc_security_group_ids      = [
#         aws_security_group.sangchul_vpc11-ec2-web1.id
#     ]
#     tags = {
#         Name                = "sangchul_web41"
#         Env                 = "stg"
#         CreateUser          = "terraform@email.com"
#         Owner               = "iac"
#         Role                = "web"
#         Service             = "ec2"
#     }
# }
