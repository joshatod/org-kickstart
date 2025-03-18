# Copyright 2023 Chris Farris <chris@primeharbor.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

output "org_name" {
  value = var.organization_name
}

output "org_id" {
  value = data.aws_organizations_organization.org.id
}

output "security_account_id" {
  value = module.security_account.account_id
}

# Things to pass to the Security Services Regional Modules
output "macie_key_arn" {
  value = var.macie_bucket_name == null ? null : aws_kms_key.macie_key[0].arn
}

output "sso_instance_arn" {
  description = "AWS Identity Center Instance ARN managed by org-kickstart"
  value       = tolist(data.aws_ssoadmin_instances.identity_store.arns)[0]
}

output "sso_instance_id" {
  description = "AWS Identity Center Instance ID managed by org-kickstart"
  value       = tolist(data.aws_ssoadmin_instances.identity_store.identity_store_ids)[0]
}

output "sso_admin_group" {
  description = "AWS Identity Center admin group managed by org-kickstart"
  value       = aws_identitystore_group.admin_group
}

output "org_accounts" {
  description = "AWS Organization accounts list"
  value       = module.organization.module.accounts
}

output "org_ous_accounts" {
  description = "AWS Organization OU and accounts list"
  value       = module.organization.custom_ous
}
