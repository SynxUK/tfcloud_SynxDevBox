resource "azurerm_network_security_group" "subnetnsg" {
  name                = "${var.AppName}SubnetNsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "subnet_nsg_rule_inbound" {
  for_each = local.inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.subnetnsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.subnetnsg.name
}


resource "azurerm_network_security_rule" "subnet_nsg_rule_outbound" {
  for_each = local.outbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.subnetnsg.resource_group_name
  network_security_group_name = azurerm_network_security_group.subnetnsg.name
}
