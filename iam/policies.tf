# Enforce MFA for all accounts
resource "aws_iam_policy" "enforce_mfa" {
    name = "EnforceMFA"
    description = "Deny access to all actions unless MFA is enabled"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect: "Deny",
                Action: "*",
                Resource: "*",
                Condition: {
                    Bool: {
                        "aws:MultiFactorAuthPresent": "false"
                    }
                }
            }
        ]
    })
}

# Enforce password policy across organization
resource "aws_iam_account_password_policy" "strong_password_policy" {
    minimum_password_length = 12
    require_symbols = true
    require_numbers = true
    require_uppercase_characters = true
    require_lowercase_characters = true
    allow_users_to_change_password = true
    max_password_age = 90
    password_reuse_prevention = 5
}

# Permissions for Developers
resource "aws_iam_policy" "developers_policy" {
    name = "DevelopersPolicy"
    description = "Permission for Developers: EC2 Management, S3 Access, Cloudwatch Logs viewing"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect: "Allow"
                Action: [
                    "ec2:DescribeInstances",
                    "ec2:StartInstances",
                    "ec2:StopInstances",
                    "ec2:RebootInstances"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow"
                Action: [
                    "s3:ListBucket",
                    "s3:GetObject",
                    "s3:PutObject"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow"
                Action: [
                    "logs:DescribeLogGroups",
                    "logs:DescribeLogStreams",
                    "logs:GetLogEvents"
                ],
                Resource: "*"
            }
        ]
    })
}

# Permissions for Operations
resource "aws_iam_policy" "operations_policy" {
    name = "OperationsPolicy"
    description = "Permissions for the operations groups for EC2 access, CloudWatch access, Systems Manager access, RDS management"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect: "Allow",
                Action: [
                    "ec2:*"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "ssm:*",
                    "ssm-contacts:*",
                    "ssm-incidents:*"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "rds:*"
                ],
                Resource: "*"
            }
        ]
    })
}

# Permissions for Finance policy
resource "aws_iam_policy" "finance_policy" {
    name = "FinancePolicy"
    description = "Finance permission for Cost Explorer, AWS Budgets, and Read-only access"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect: "Allow",
                Action: [
                    "ce:*"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "budgets:*"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "ec2:Describe*",
                    "s3:ListBucket",
                    "rds:Describe*",
                    "cloudwatch:Describe*",
                    "logs:Describe*"
                ]
                Resource: "*"
            }
        ]
    })
} 

# Permissions for Analysts group
resource "aws_iam_policy" "analysts_policy" {
    name = "AnalystsPolicy"
    description = "Permission for Analysts: Read Only for S3 and DB"

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect: "Allow",
                Action: [
                    "s3:ListBucket",
                    "s3:GetObject"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "rds:DescribeDBInstances",
                    "rds:DescribeDBSnapshots",
                    "rds:ListTagsForResource",
                    "rds:DescribeDBClusterSnapshots",
                    "rds:DescribeDBClusters"
                ],
                Resource: "*"
            },
            {
                Effect: "Allow",
                Action: [
                    "logs:GetLogEvents"
                ],
                Resource: "*"
            }
        ]
    })
}