  resource "aws_ebs_volume" "ebs_volume" {
  count             = "${var.worker_instance_count * var.volume_count}"
  availability_zone = "${var.worker_zone}"
  size              = "${var.volume_size}"
}

resource "aws_volume_attachment" "volume_attachement" {
  count       = "${var.worker_instance_count * var.volume_count}"
  volume_id   = "${aws_ebs_volume.ebs_volume.*.id[count.index]}"
  device_name = "${element(var.device_names, count.index)}"
  instance_id = "${element(var.worker_instance_id, count.index)}"
}
