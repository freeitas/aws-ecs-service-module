variable "region" {
  type        = string
  description = "AWS region where the resources will be provisioned."
}

variable "service_name" {
  type        = string
  description = "Name of the service to be used in ECS, or a similar identifier."
}

variable "container_image" {
  type        = string
  description = "Tagged image used to deploy the application on ECS."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster where the service will be deployed."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the service-related resources will be provisioned."
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs where the service will be deployed."
}

variable "service_port" {
  type        = number
  description = "Port on which the service will be reachable."
}

variable "use_lb" {
  type        = bool
  default     = true
  description = "Enables exposing the service through a load balancer."
}

variable "service_protocol" {
  description = "Service protocol in use, such as http, https, grpc or tcp."
  type        = string
  default     = null
}

variable "protocol" {
  description = "Protocol used for communication, such as tcp or udp."
  type        = string
  default     = "tcp"
}

variable "use_service_connect" {
  description = "Enables or disables the use of Service Connect."
  type        = bool
  default     = false
}

variable "deployment_controller" {
  type    = string
  default = "ECS"
  description = "Defines the deployment controller type. Defaults to ECS. Accepts ECS and CODE_DEPLOY."
}

variable "codedeploy_strategy" {
  type    = string
  default = "CodeDeployDefault.ECSAllAtOnce"
  description = "Defines the CodeDeploy deployment strategy. Defaults to ECSAllAtOnce."
}

variable "codedeploy_deployment_option" {
  type    = string
  default = "WITH_TRAFFIC_CONTROL"
  description = "Defines the CodeDeploy deployment option. Defaults to WITH_TRAFFIC_CONTROL."
}

variable "codedeploy_deployment_type" {
  type    = string
  default = "BLUE_GREEN"
  description = "Defines the CodeDeploy deployment type. Defaults to BLUE_GREEN."
}

variable "codedeploy_termination_wait_time_in_minutes" {
  type    = number
  default = 5
  description = "Defines how long to wait, in minutes, before terminating the old tasks in a BLUE/GREEN deployment. Defaults to 5 minutes."
}

variable "codedeploy_rollback_alarm" {
  type = bool
  default = true
  description = "Defines whether rollback is triggered by CloudWatch alarms. Defaults to true."
}

variable "codedeploy_rollback_error_threshold" {
  type    = number
  default = 10
  description = "Defines the error percentage threshold that triggers a rollback. Defaults to 10%."
}

variable "codedeploy_rollback_error_period" {
  type = number
  default = 60
  description = "Defines the time window, in seconds, used to evaluate errors during a rollback. Defaults to 60 seconds."
}

variable "codedeploy_rollback_error_evaluation_period" {
  type    = number
  default = 1
  description = "Defines the number of evaluation periods before triggering a rollback. Defaults to 1 period."
}

variable "service_connect_name" {
  description = "Service Connect name."
  type        = string
  default     = null
}

variable "service_connect_arn" {
  description = "Service Connect ARN."
  type        = string
  default     = null
}

variable "service_cpu" {
  type        = number
  description = "Amount of CPU allocated to the service, in ECS CPU units."
}

variable "service_memory" {
  type        = number
  description = "Amount of memory allocated to the service, in MB."
}

variable "service_listener" {
  type        = string
  default     = null
  description = "ARN of the Application Load Balancer listener to be used by the service."
}

variable "service_task_execution_role" {
  type        = string
  description = "ARN of the ECS task execution role the service will run with."
}

variable "service_launch_type" {
  description = "Launch type configuration based on the capacity providers available in the cluster."
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {
  type        = number
  description = "Number of task instances to run concurrently in the service."
}

variable "service_hosts" {
  type        = list(string)
  description = "List of hosts associated with the service, typically used for DNS configuration."
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Health check configuration for the service, including path and protocol."
}

variable "environment_variables" {
  type = list(object({
    name : string
    value : string
  }))
  description = "List of environment variables passed to the service."
  default     = []
}

variable "secrets" {
  type = list(object({
    name : string
    valueFrom : string
  }))
  description = "List of secrets from Parameter Store or Secrets Manager."
  default     = []
}

variable "capabilities" {
  type        = list(string)
  default     = []
  description = "List of capacity providers, such as EC2 or FARGATE."
}

variable "scale_type" {
  type        = string
  description = "Scaling type, such as 'cpu', 'cpu_tracking' or 'requests_tracking'."
  default     = null
}

variable "task_minimum" {
  type        = number
  description = "Minimum number of tasks the service must run."
  default     = 3
}

variable "task_maximum" {
  type        = number
  description = "Maximum number of tasks the service can run."
  default     = 10
}


variable "scale_out_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold, as a percentage, above which a scale-up action is triggered."
  default     = 80
}

variable "scale_out_adjustment" {
  type        = number
  description = "Number of tasks to add during a scale-up action."
  default     = 1
}

variable "scale_out_comparison_operator" {
  type        = string
  description = "Comparison operator used for the scale-up condition, such as 'GreaterThanOrEqualToThreshold'."
  default     = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  type        = string
  description = "Statistic used for the scale-up condition, such as 'Average' or 'Sum'."
  default     = "Average"
}

variable "scale_out_period" {
  type        = number
  description = "Duration of the scale-up evaluation period, in seconds."
  default     = 60
}

variable "scale_out_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-up."
  default     = 2
}

variable "scale_out_cooldown" {
  type        = number
  description = "Cooldown period after a scale-up action, in seconds."
  default     = 60
}

variable "scale_in_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold, as a percentage, below which a scale-down action is triggered."
  default     = 30
}

variable "scale_in_adjustment" {
  type        = number
  description = "Number of tasks to remove during a scale-down action."
  default     = -1
}

variable "scale_in_comparison_operator" {
  type        = string
  description = "Comparison operator used for the scale-down condition, such as 'LessThanOrEqualToThreshold'."
  default     = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  type        = string
  description = "Statistic used for the scale-down condition, such as 'Average' or 'Sum'."
  default     = "Average"
}

variable "scale_in_period" {
  type        = number
  description = "Duration of the scale-down evaluation period, in seconds."
  default     = 120
}

variable "scale_in_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-down."
  default     = 3
}

variable "scale_in_cooldown" {
  type        = number
  description = "Cooldown period after a scale-down action, in seconds."
  default     = 120
}

variable "scale_tracking_cpu" {
  type        = number
  description = "Target CPU utilization for scaling tracking, as a percentage."
  default     = 80
}

variable "alb_arn" {
  type        = string
  description = "ARN of the Application Load Balancer used for request tracking."
  default     = null
}

variable "scale_tracking_requests" {
  type        = number
  description = "Target number of requests per second (TPS) for scaling tracking."
  default     = 0
}

variable "efs_volumes" {
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    read_only : bool
  }))
  description = "Existing EFS volumes to mount into the ECS tasks."
  default     = []
}

variable "service_discovery_namespace" {
  description = "Service Discovery namespace ID."
  default     = null
}