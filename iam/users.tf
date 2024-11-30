# Creating developer users variables
variable "developer_names" {
    default = ["developer1", "developer2", "developer3", "developer4"]
}
# Dynamically create IAM users
resource "aws_iam_user" "developers" {
    for_each = toset(var.developer_names)
    name = each.value
}
# Dynamically creating group memberships
resource "aws_iam_group_membership" "developers_group" {
    for_each = aws_iam_user.developers
    user = each.value.name
    groups = [aws_iam_group.developers_group.name]
}

# Creating Operations users
variable "operations_names" {
    default = ["operations1", "operations2"]
}
resource "aws_iam_user" "operations" {
    for_each = toset(var.operations_names)
    name = each.value
}
resource "aws_iam_group_membership" "operations_group" {
    for_each = aws_iam_user.operations
    user = each.value.name
    groups = [aws_iam_group.operations_group.name]
}

# Finance
variable "finance_names" {
    default = ["finance1"]
}
resource "aws_iam_user" "finance" {
    for_each = toset(var.finance_names)
    name = each.value
}

resource "aws_iam_group_membership" "finance_group" {
    for_each = aws_iam_user.finance
    user = each.value.name
    groups = [aws_iam_group.finance_group.name]
}

# Analysts
variable "analysts_names" {
    default = ["analyst1", "analyst2", "analyst3"]
}
resource "aws_iam_user" "analysts" {
    for_each = toset(var.analysts_names)
    name = each.value
}

resource "aws_iam_group_membership" "analysts_group" {
    for_each = aws_iam_user.analysts
    user = each.value.name
    groups = [aws_iam_group.analysts_group.name]
}