## Key value pairs of the users
locals {
  users = {
    "Wizkid" = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy",
    "nene"   = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "amara"  = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "rose"   = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }
}

locals {
  managed_policies = {
    security   = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"
    devops     = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    compliance = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }

  inline_policies = {
    security = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "ec2:*"
          Resource = "*"
        }
      ]
    })

    devops = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "cloudtrail:GetTrail:*"
          Resource = "*"
        }
      ]
    })
  }
}