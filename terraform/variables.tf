variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "rsa_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1x1okkVhqxUdhp0AldYTmAYSc98nMvO+InNjuCeE3rQj0USGx1P+v9kZtZK6IMgn3VyPk0VN7kFdReX9kog2bEkcpY6/BEBXTTqhGoZYN/m14W6tzU9QQsSREsyA6J01noldXcnn5lEcf3UirfeXIWLEAs+XKwgDdNDiH2Xx1QBDILHEq9n9kMT/zj6Uff+Y5GdDL3Zx9W9yZXgcLsCXMbakPlQEeQ/lqKHA2pRziR30Da5+Vrebpa+WcIq2xjTYdbtrD2NY4w31u1Z6a0vD18+xhLeYAg/yBKrb8KRWz3fQdqcfZYuzntcZJH9G5BZl8rZ2ZB2evhMr5hPwgW0M1oFY3mZdKXxepqkmdZSb+DuKE38TIzgXSECXBO7tx74ivyHPb+/LAYpWqRIddLXV2qEw2StjyX+ixmogSItXmM1p4+35lTl0Oy2F829hQN/D3HalTxcp2SVXgw0drnYEPMcfEq+jeY9AjKLMgP5/cxAyFoyb4nI5DABgu5ikWbwE= moyfo@DESKTOP-5FP4JC5"
}

variable "aws_ami" {
  type    = string
  default = "ami-0faab6bdbac9486fb"
}

variable "aws_instance_type" {
  type    = string
  default = "t2.micro"
}
