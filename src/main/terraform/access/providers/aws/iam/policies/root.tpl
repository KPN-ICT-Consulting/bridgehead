{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/${dynamodb}"
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::kma-terraform-*"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::kma-terraform-*/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:AttachUserPolicy",
        "iam:DetachUserPolicy"
      ],
      "Resource": "arn:aws:iam::*:role/cal/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateGroup",
        "iam:CreatePolicy",
        "iam:CreateRole",
        "iam:CreateUser",
        "iam:GetPolicy",
        "iam:GetUser",
        "iam:ListGroups",
        "iam:ListPolicies",
        "iam:ListRoles",
        "iam:ListUsers",
        "iam:PassRole",
        "iam:ListRoles"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "application-autoscaling:RegisterScalableTarget",
        "application-autoscaling:DeregisterScalableTarget",
        "application-autoscaling:PutScalingPolicy",
        "application-autoscaling:DeleteScalingPolicy"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:PutMetricAlarm",
        "cloudwatch:DeleteAlarms"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*Vpc*",
        "ec2:*Subnet*",
        "ec2:*Gateway*",
        "ec2:*Vpn*",
        "ec2:*Route*",
        "ec2:*Address*",
        "ec2:*SecurityGroup*",
        "ec2:*NetworkAcl*",
        "ec2:*DhcpOptions*",
        "ec2:RunInstances",
        "ec2:StopInstances",
        "ec2:StartInstances",
        "ec2:TerminateInstances",
        "ec2:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:CreateHostedZone",
        "route53:UpdateHostedZoneComment",
        "route53:GetHostedZone",
        "route53:ListHostedZones",
        "route53:DeleteHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets",
        "route53:GetHostedZoneCount",
        "route53:ListHostedZonesByName",
        "route53:CreateHealthCheck",
        "route53:UpdateHealthCheck",
        "route53:GetHealthCheck",
        "route53:ListHealthChecks",
        "route53:DeleteHealthCheck",
        "route53:GetCheckerIpRanges",
        "route53:GetHealthCheckCount",
        "route53:GetHealthCheckStatus",
        "route53:GetHealthCheckLastFailureReason"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "rds:Describe*",
        "rds:CreateDBInstance",
        "rds:CreateDBCluster"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecs:DeregisterTaskDefinition",
        "ecs:UpdateService",
        "ecs:CreateService",
        "ecs:RegisterTaskDefinition",
        "ecs:DeleteService",
        "ecs:DescribeServices",
        "ecs:ListTaskDefinitions"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "*"
    }
  ]
}
