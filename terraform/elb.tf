###############################
## Kubernetes API Load Balancer
###############################

resource "aws_elb" "kubernetes_api" {
    name = "${var.elb_name}"
    instances = ["${aws_instance.controller.*.id}"]
    subnets = ["${aws_subnet.kubernetes.id}"]
    cross_zone_load_balancing = false

    security_groups = ["${aws_security_group.kubernetes_api.id}"]

    listener {
      lb_port = 6443
      instance_port = 6443
      lb_protocol = "TCP"
      instance_protocol = "TCP"
    }

    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 15
      target = "HTTP:8080/healthz"
      interval = 30
    }

    tags {
      Name = "kubernetes"
      Owner = "${var.owner}"
    }
}