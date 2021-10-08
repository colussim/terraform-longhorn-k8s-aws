variable "name" {
  default     = "mysql-deployment-student2"
  description = "The name of the MySQL deployment"
}
variable "namespace" {
  default     = "student1"
  description = "The kubernetes namespace to run the mysql server in."
}

variable "selectors" {
  type = map(string)
  default = {}
}

variable "pvc" {
  default     = "pvc-mysql-data01-clone"
  description = "The name of the PVC."
}


variable "labels" {
  type = map(string)
  default = {}
}


variable "mysql_image_url" {
  default = "mysql"
  description = "The image url of the mysql version wanted"
}

variable "mysql_image_tag" {
  default = "8.0.25"
  description = "The image tag of the mysql version wanted"
}

variable "adminpassword" {
  default     = "Bench123"
  description = "Root Password"
}
