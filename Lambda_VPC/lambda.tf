
locals {
  lambda_zip_location = "outputs/welcome.zip"
}



data "archive_file" "welcome" {
  type        = "zip"
  source_file = "welcome.py"
  output_path = local.lambda_zip_location
}



resource "aws_lambda_function" "python_lambda_function" {
  runtime          = var.lambda_runtime
  function_name = "python_mainak2310"
  filename = local.lambda_zip_location
  handler          = var.lambda_function_handler
  timeout = 60
  memory_size = 256
  role             = aws_iam_role.iam_role_mc23101994.arn

  # source_code_hash = filebase64sha256(local.lambda_zip_location)
  depends_on   = [aws_cloudwatch_log_group.log_mc23101994]

   vpc_config {
    subnet_ids         = [var.subnet_ids]
    security_group_ids = [var.security_group_ids]
  }

}

