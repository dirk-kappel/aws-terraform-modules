output "interface_endpoints" {
  description = "A map of the interface VPC endpoints created by this module."
  value = {
    for key, endpoint in aws_vpc_endpoint.interface_endpoint :
    key => {
      arn                   = endpoint.arn
      dns                   = length(endpoint.dns_entry) != 0 ? endpoint.dns_entry[0].dns_name : null
      id                    = endpoint.id
      network_interface_ids = length(endpoint.network_interface_ids) > 0 ? endpoint.network_interface_ids : []
    }
  }
}

output "gateway_endpoints" {
  description = "A map of the gateway VPC endpoints created by this module."
  value = {
    for key, endpoint in aws_vpc_endpoint.gateway_endpoint :
    key => {
      arn                   = endpoint.arn
      dns                   = length(endpoint.dns_entry) != 0 ? endpoint.dns_entry[0].dns_name : null
      id                    = endpoint.id
      network_interface_ids = length(endpoint.network_interface_ids) > 0 ? endpoint.network_interface_ids : []
    }
  }
}