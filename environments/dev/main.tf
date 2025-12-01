module "rgs" {
  source = "../../modules/azurerm_resource_group"
  rgs_child =  var.rgs_parent
}

module "sgs" {
  source = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
  depends_on = [module.rgs]
}

module "virtual_network" {
  depends_on      = [module.rgs]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
}


module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  pip_child = var.pip_parent
  depends_on = [module.rgs]

}

module "key_vault_" {
  source = "../../modules/azurerm_key_vault"
  key_vault_child =var.key_vault_parent
  depends_on = [module.rgs]
 
}

module "key_secrets_" {
  source = "../../modules/azurerm_key_secret"
  secrets =var.secret_parent
  depends_on = [module.key_vault_]
 
}


module "nic" {
  depends_on = [module.rgs, module.virtual_network]
  source     = "../../modules/azurerm_interface_card"
  nic        = var.nic
  public_ip_ids = module.public_ip.public_ip_ids
}
module "nsg" {
  depends_on = [module.rgs]
  source     = "../../modules/azurerm_nsg"
  nsg_child = var.nsg_parent
}

module "nsg_nic" {
  depends_on = [module.nic,module.nsg]
  source     = "../../modules/azurerm_nsg_nic"
  nic_nsg_child = var.nic_nsg_parent
  
}

module "vm" {
  depends_on = [module.nic,module.nsg,module.nsg_nic]
  source     = "../../modules/azurerm_linux_virtual_machine"
  vms = var.vms
}

module "sql_server" {
  depends_on = [module.rgs]
  source     = "../../modules/azurerm_sql_server"
  sql_server_child = var.sql_server_parent
}

module "sql_database" {
  depends_on = [module.rgs,module.sql_server]
  source     = "../../modules/azurerm_sql_database"
  sql_database_child = var.sql_database_parent
}

module "bastion_host" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_bastion_host"
  bastion_child = var.bastion_parent
}