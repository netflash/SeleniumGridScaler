### This is an example of IAM role that could be applied to 
### a Scaler instance

# application IAM role
resource "aws_iam_role" "selenium-grid-hub" {
  name = "selenium-grid-hub"
  path = "/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_instance_profile" "selenium-grid-hub" {
  name  = "selenium-grid-hub"
  path  = "/"
  roles = ["${aws_iam_role.selenium-grid-hub.name}"]
}

# IAM policy granting permission to manage EC2 instances
resource "aws_iam_policy" "selenium-grid-hub" {
  name = "selenium-grid-hub"
  path = "/"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
      "ec2:DescribeInstances", "ec2:DescribeImages",
        "ec2:DescribeKeyPairs","ec2:DescribeVpcs", "ec2:DescribeSubnets", 
        "ec2:DescribeSecurityGroups"],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [ "ec2:RunInstances","ec2:CreateTags","ec2:TerminateInstances"],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "selenium-grid-hub" {
  name = "selenium-grid-hub"

  roles = [
    "${aws_iam_role.selenium-grid-hub.name}",
  ]

  policy_arn = "${aws_iam_policy.selenium-grid-hub.arn}"
}
