resource "aws_iam_group" "developers_group" {
    name = "Developers"
}

resource "aws_iam_group" "operations_group" {
    name = "Operations"
}

resource "aws_iam_group" "finance_group" {
    name = "Finance"
}

resource "aws_iam_group" "analysts_group" {
    name = "Analysts"
}

