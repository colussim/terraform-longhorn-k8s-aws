
variable "volume_count" {
  default = 2
  description = "Number of disk by instance"
}

variable "volume_size" {
  default = "20"
  description = "Size for volume default : 20 GB"
}

variable "device_names" {
    type = list
    default = ["/dev/sdf", "/dev/sdg", "/dev/sdg", "/dev/sdf"]
    description = "device name"
}


variable "worker_instance_id" {
    type = list
    default = ["i-0717cb91ccc3ebfd3", "i-0489a59e7ae953478"]
    description = "Instance id for worker node"
}

variable "worker_instance_count" {
  default = 2
  description = "Number worker Instance"
}

variable "worker_zone" {
  default = "us-east-1a"
}
