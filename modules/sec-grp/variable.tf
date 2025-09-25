variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "ingress_rules" {
  type = list(object({
    from_port = number
    to_port = number
    protocol    = string
    cidr_block  = string
  }))
  default = []
}

variable "egress_rules" {
  type = list(object({
    #from_port   = number
    #to_port     = number
    protocol    = string
    cidr_block  = string
  }))
  default = []
}
