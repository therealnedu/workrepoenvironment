resource "aws_iam_user" "lb" {
  name = "molly"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}