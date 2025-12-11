###############################################
# IAM Role (Lambda 実行用)
###############################################

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "logs" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    # 必要なら絞り込んでもよいが、まずは * でシンプルに
    resources = ["*"]
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.env_name}-${var.function_name}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "logs" {
  name   = "${var.env_name}-${var.function_name}-logs"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.logs.json
}

###############################################
# Lambda Function
###############################################

resource "aws_lambda_function" "this" {
  function_name = "${var.env_name}-${var.function_name}"

  runtime = "nodejs18.x"
  handler = "index.handler"
  role    = aws_iam_role.this.arn

  # コードは S3 の zip を利用
  s3_bucket         = var.code_s3_bucket
  s3_key            = var.code_s3_key
  s3_object_version = var.code_s3_object_version

  memory_size = var.memory_size
  timeout     = var.timeout

  reserved_concurrent_executions = var.reserved_concurrent_executions

  ########################################
  # Logging Config（システム/アプリログ設定）
  ########################################
  logging_config {
    log_format            = var.log_format
    application_log_level = var.application_log_level
    system_log_level      = var.system_log_level
  }

  ########################################
  # アプリ向け Environment Variables
  ########################################
  environment {
    variables = {
      LOG_LEVEL = var.log_level
    }
  }

  ########################################
  # 更新時に無駄なdiffを避ける
  ########################################
  lifecycle {
    ignore_changes = [
      last_modified,
      qualified_arn,
      version,
    ]
  }
}