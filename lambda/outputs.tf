output "lambda_name" {
  value       = aws_lambda_function.this.function_name
  description = "作成されたLambda関数名。"
}

output "lambda_arn" {
  value       = aws_lambda_function.this.arn
  description = "作成されたLambda関数のARN。"
}

output "lambda_role_arn" {
  value       = aws_iam_role.this.arn
  description = "Lambda実行用IAMロールのARN。"
}