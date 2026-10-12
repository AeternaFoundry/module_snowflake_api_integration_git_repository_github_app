resource "snowflake_api_integration_git_repository_github_app" "api_integration_git_repository_github_apps" {
  for_each = var.api_integration_git_repository_github_apps

  api_allowed_prefixes = each.value.api_allowed_prefixes
  enabled              = each.value.enabled
  name                 = each.value.name
  api_blocked_prefixes = each.value.api_blocked_prefixes
  comment              = each.value.comment

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

