###############################################
# Lambda Function Resource
###############################################

resource "aws_lambda_function" "this" {
  function_name = "${var.env_name}-${var.function_name}"

  runtime = "nodejs18.x"
  handler = "index.handler"
  role    = var.role_arn

  # ================================
  # S3 からコードを取得
  # ================================
  s3_bucket         = var.code_s3_bucket
  s3_key            = var.code_s3_key
  # VersionId は使用しない（PRレビューでKey管理できる形にするため）
  # s3_object_version を使わないことで VersionId に依存せず Key だけでバージョン管理できる
  # ================================

  # Lambda Runtime Settings
  memory_size = var.memory_size
  timeout     = var.timeout

  reserved_concurrent_executions = var.reserved_concurrent_executions

  # ================================
  # Environment Variables
  # ================================
  environment {
    variables = {
      LOG_LEVEL = var.log_level
    }
  }

  # アップデート時の挙動が安定するように設定
  lifecycle {
    ignore_changes = [
      last_modified,
      qualified_arn,
      version
    ]
  }
}