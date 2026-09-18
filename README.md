# aws-ecs-service-module

Reusable Terraform module for creating ECS services.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener_rule.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule) | resource |
| [aws_alb_listener_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule) | resource |
| [aws_alb_target_group.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_alb_target_group.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_appautoscaling_policy.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_requests](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.rollback_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_codedeploy_app.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_service_discovery_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |
| [local_file.appspec](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.deploy_codedeploy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.deploy_ecs](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_alb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/alb) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | ARN of the Application Load Balancer used for request tracking. | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | List of capacity providers, such as EC2 or FARGATE. | `list(string)` | `[]` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS cluster where the service will be deployed. | `string` | n/a | yes |
| <a name="input_codedeploy_deployment_option"></a> [codedeploy\_deployment\_option](#input\_codedeploy\_deployment\_option) | Defines the CodeDeploy deployment option. Defaults to WITH\_TRAFFIC\_CONTROL. | `string` | `"WITH_TRAFFIC_CONTROL"` | no |
| <a name="input_codedeploy_deployment_type"></a> [codedeploy\_deployment\_type](#input\_codedeploy\_deployment\_type) | Defines the CodeDeploy deployment type. Defaults to BLUE\_GREEN. | `string` | `"BLUE_GREEN"` | no |
| <a name="input_codedeploy_rollback_alarm"></a> [codedeploy\_rollback\_alarm](#input\_codedeploy\_rollback\_alarm) | Defines whether rollback is triggered by CloudWatch alarms. Defaults to true. | `bool` | `true` | no |
| <a name="input_codedeploy_rollback_error_evaluation_period"></a> [codedeploy\_rollback\_error\_evaluation\_period](#input\_codedeploy\_rollback\_error\_evaluation\_period) | Defines the number of evaluation periods before triggering a rollback. Defaults to 1 period. | `number` | `1` | no |
| <a name="input_codedeploy_rollback_error_period"></a> [codedeploy\_rollback\_error\_period](#input\_codedeploy\_rollback\_error\_period) | Defines the time window, in seconds, used to evaluate errors during a rollback. Defaults to 60 seconds. | `number` | `60` | no |
| <a name="input_codedeploy_rollback_error_threshold"></a> [codedeploy\_rollback\_error\_threshold](#input\_codedeploy\_rollback\_error\_threshold) | Defines the error percentage threshold that triggers a rollback. Defaults to 10%. | `number` | `10` | no |
| <a name="input_codedeploy_strategy"></a> [codedeploy\_strategy](#input\_codedeploy\_strategy) | Defines the CodeDeploy deployment strategy. Defaults to ECSAllAtOnce. | `string` | `"CodeDeployDefault.ECSAllAtOnce"` | no |
| <a name="input_codedeploy_termination_wait_time_in_minutes"></a> [codedeploy\_termination\_wait\_time\_in\_minutes](#input\_codedeploy\_termination\_wait\_time\_in\_minutes) | Defines how long to wait, in minutes, before terminating the old tasks in a BLUE/GREEN deployment. Defaults to 5 minutes. | `number` | `5` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Tagged image used to deploy the application on ECS. | `string` | n/a | yes |
| <a name="input_deployment_controller"></a> [deployment\_controller](#input\_deployment\_controller) | Defines the deployment controller type. Defaults to ECS. Accepts ECS and CODE\_DEPLOY. | `string` | `"ECS"` | no |
| <a name="input_efs_volumes"></a> [efs\_volumes](#input\_efs\_volumes) | Existing EFS volumes to mount into the ECS tasks. | <pre>list(object({<br>    volume_name : string<br>    file_system_id : string<br>    file_system_root : string<br>    mount_point : string<br>    read_only : bool<br>  }))</pre> | `[]` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | List of environment variables passed to the service. | <pre>list(object({<br>    name : string<br>    value : string<br>  }))</pre> | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs where the service will be deployed. | `list(string)` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol used for communication, such as tcp or udp. | `string` | `"tcp"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region where the resources will be provisioned. | `string` | n/a | yes |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | Number of tasks to remove during a scale-down action. | `number` | `-1` | no |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | Comparison operator used for the scale-down condition, such as 'LessThanOrEqualToThreshold'. | `string` | `"LessThanOrEqualToThreshold"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | Cooldown period after a scale-down action, in seconds. | `number` | `120` | no |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | CPU utilization threshold, as a percentage, below which a scale-down action is triggered. | `number` | `30` | no |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | Number of evaluation periods required to trigger a scale-down. | `number` | `3` | no |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | Duration of the scale-down evaluation period, in seconds. | `number` | `120` | no |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | Statistic used for the scale-down condition, such as 'Average' or 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | Number of tasks to add during a scale-up action. | `number` | `1` | no |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | Comparison operator used for the scale-up condition, such as 'GreaterThanOrEqualToThreshold'. | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | Cooldown period after a scale-up action, in seconds. | `number` | `60` | no |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | CPU utilization threshold, as a percentage, above which a scale-up action is triggered. | `number` | `80` | no |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | Number of evaluation periods required to trigger a scale-up. | `number` | `2` | no |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | Duration of the scale-up evaluation period, in seconds. | `number` | `60` | no |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | Statistic used for the scale-up condition, such as 'Average' or 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_tracking_cpu"></a> [scale\_tracking\_cpu](#input\_scale\_tracking\_cpu) | Target CPU utilization for scaling tracking, as a percentage. | `number` | `80` | no |
| <a name="input_scale_tracking_requests"></a> [scale\_tracking\_requests](#input\_scale\_tracking\_requests) | Target number of requests per second (TPS) for scaling tracking. | `number` | `0` | no |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | Scaling type, such as 'cpu', 'cpu\_tracking' or 'requests\_tracking'. | `string` | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | List of secrets from Parameter Store or Secrets Manager. | <pre>list(object({<br>    name : string<br>    valueFrom : string<br>  }))</pre> | `[]` | no |
| <a name="input_service_connect_arn"></a> [service\_connect\_arn](#input\_service\_connect\_arn) | Service Connect ARN. | `string` | `null` | no |
| <a name="input_service_connect_name"></a> [service\_connect\_name](#input\_service\_connect\_name) | Service Connect name. | `string` | `null` | no |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | Amount of CPU allocated to the service, in ECS CPU units. | `number` | n/a | yes |
| <a name="input_service_discovery_namespace"></a> [service\_discovery\_namespace](#input\_service\_discovery\_namespace) | Service Discovery namespace ID. | `any` | `null` | no |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Health check configuration for the service, including path and protocol. | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | List of hosts associated with the service, typically used for DNS configuration. | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Launch type configuration based on the capacity providers available in the cluster. | <pre>list(object({<br>    capacity_provider = string<br>    weight            = number<br>  }))</pre> | <pre>[<br>  {<br>    "capacity_provider": "SPOT",<br>    "weight": 100<br>  }<br>]</pre> | no |
| <a name="input_service_listener"></a> [service\_listener](#input\_service\_listener) | ARN of the Application Load Balancer listener to be used by the service. | `string` | `null` | no |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Amount of memory allocated to the service, in MB. | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service to be used in ECS, or a similar identifier. | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Port on which the service will be reachable. | `number` | n/a | yes |
| <a name="input_service_protocol"></a> [service\_protocol](#input\_service\_protocol) | Service protocol in use, such as http, https, grpc or tcp. | `string` | `null` | no |
| <a name="input_service_task_count"></a> [service\_task\_count](#input\_service\_task\_count) | Number of task instances to run concurrently in the service. | `number` | n/a | yes |
| <a name="input_service_task_execution_role"></a> [service\_task\_execution\_role](#input\_service\_task\_execution\_role) | ARN of the ECS task execution role the service will run with. | `string` | n/a | yes |
| <a name="input_task_maximum"></a> [task\_maximum](#input\_task\_maximum) | Maximum number of tasks the service can run. | `number` | `10` | no |
| <a name="input_task_minimum"></a> [task\_minimum](#input\_task\_minimum) | Minimum number of tasks the service must run. | `number` | `3` | no |
| <a name="input_use_lb"></a> [use\_lb](#input\_use\_lb) | Enables exposing the service through a load balancer. | `bool` | `true` | no |
| <a name="input_use_service_connect"></a> [use\_service\_connect](#input\_use\_service\_connect) | Enables or disables the use of Service Connect. | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the service-related resources will be provisioned. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->