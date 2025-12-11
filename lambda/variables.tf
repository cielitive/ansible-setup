###############################################
# Lambda モジュール共通で使用する変数
###############################################

variable "env_name" {
  type        = string
  description = "環境ID（例: dev-001, stg-001, prd-002）。Lambda名やIAM Role名のprefixとして利用。"
}

variable "function_name" {
  type        = string
  description = "Lambda関数の論理名（例: func1, func2, func3）。"
}

variable "code_s3_bucket" {
  type        = string
  description = "Lambdaコードzipが格納されているS3バケット名。"
}

variable "code_s3_key" {
  type        = string
  description = "LambdaコードzipのS3オブジェクトKey。例: func1/v2025-01-10-001.zip。"
}

variable "code_s3_object_version" {
  type        = string
  description = "LambdaコードzipのS3オブジェクトVersion ID。PRで更新される想定。"
}

variable "memory_size" {
  type        = number
  default     = 512
  description = "Lambdaに割り当てるメモリ量（MB）。デフォルト512MB。"
}

variable "timeout" {
  type        = number
  default     = 15
  description = "Lambda関数のタイムアウト秒数。デフォルト15秒。"
}

variable "reserved_concurrent_executions" {
  type        = number
  default     = null
  nullable    = true
  description = "予約済み同時実行数。null の場合は設定しない（AWSデフォルト=無制限）。"
}

variable "log_level" {
  type        = string
  default     = "info"
  description = "アプリケーションログ用 LOG_LEVEL 環境変数。"
}

# Lambda LoggingConfig 用
variable "log_format" {
  type        = string
  default     = "Text" # or "JSON"
  description = "Lambdaのログフォーマット。Text または JSON。"
}

variable "application_log_level" {
  type        = string
  default     = "INFO" # TRACE / DEBUG / INFO / WARN / ERROR / FATAL
  description = "アプリケーションログレベル（Lambda LoggingConfig用）。"
}

variable "system_log_level" {
  type        = string
  default     = "WARN" # DEBUG / INFO / WARN / ERROR / FATAL
  description = "システムログレベル（Lambda LoggingConfig用）。"
}