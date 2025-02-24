output "variable_set_id" {
  description = "The ID of the TFC Variable Set."
  value       = tfe_variable_set.this[0].id
}