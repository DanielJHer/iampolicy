# Attach MFA policy to all groups
resource "aws_iam_group_policy_attachment" "developers_mfa" {
    group = aws_iam_group.developers_group.name
    policy_arn = aws_iam_policy.enforce_mfa.arn
}

resource "aws_iam_group_policy_attachment" 'operations_mfa" {
    group = aws_iam_group.operations_group.name
    policy_arn = aws_iam_policy.enforce_mfa.arn
}

resource "aws_iam_group_policy_attachment" "finance_mfa" {
    group = aws_iam_group.finance_group.name
    policy_arn = aws_iam_policy.enforce_mfa.arn
}

resource "aws_iam_group_policy_attachment" "analysts_mfa" {
    group = aws_iam_group.analysts_group.name
    policy_arn = aws_iam_policy.enforce_mfa.arn
}

# Attach developer policy to developer group
resource "aws_iam_group_policy_attachment" "developers_policy_attachment" {
    group = aws_iam_group.developers_group.name
    policy_arn = aws_iam_policy.developers_policy.arn
}

# Attach operations policy to operations group
resource "aws_iam_group_policy_attachment" "operations_policy_attachment" {
    group = aws_iam_group.operations_group.name
    policy_arn = aws_iam_policy.operations_policy.arn
}

# Attach fiance policy to finance group
resource "aws_iam_group_policy_attachment" "finance_policy_attachment" {
    group = aws_iam_group.finance_group.name
    policy_arn = aws_iam_policy.finance_policy.arn
}

# Attach analysts policy to analysts group
resource "aws_iam_group_policy_attachment" "analysts_policy_attachment" {
    group = aws_iam_group.analysts_group.name
    policy_arn = aws_iam_policy.analysts_policy.arn
}