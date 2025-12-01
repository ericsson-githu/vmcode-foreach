rgs_parent = {
  "rg1" = {
    name       = "rg_dev"
    location   = "West Europe"
    managed_by = "terraform"
    tags = {
      env   = "dev"
      owner = "uday"

    }
  }
}

storage_accounts = {
  "sgs1" = {
    name                     = "udaysingh7612445"
    location                 = "West Europe"
    rg_name                  = "rg_dev"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

virtual_network = {
  vnet1 = {
    name                = "dev-vnet-001"
    location            = "West Europe"
    resource_group_name = "rg_dev"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "sub-dev-001"
        address_prefixes = ["10.0.20.0/24"]
      },
      {
        name             = "sub-dev-002"
        address_prefixes = ["10.0.30.0/24"]
      },
      {
        name             = "AzureBastionSubnet"          # ✔ REQUIRED NAME
        address_prefixes = ["10.0.40.0/24"]               # ✔ Valid prefix
      }
    ]
  }
}
pip_parent = {

  pip1 = {
    pip_name            = "avi-pip"
    resource_group_name = "rg_dev"
    location            = "West Europe"
    allocation_method   = "Static"
  }

   pip2 = {
    pip_name            = "avi-pip1"
    resource_group_name = "rg_dev"
    location            = "West Europe"
    allocation_method   = "Static"
  }

}

key_vault_parent = {
  kv1 = {
    name                        = "kv-dev-uday01"
    resource_group_name         = "rg_dev"
    location                    = "West Europe"
    enabled_for_disk_encryption = true
    tenant_id                   = "9591fa99-2e99-45ae-a29c-c03af6ca6a98"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    tags = {
      env = "dev"
    }
  }
}
secret_parent = {
  secret1 = {
    key_name            = "kv-dev-uday01"
    resource_group_name = "rg_dev"
    secret_name         = "uda9145561"
    secret_value        = "uday@123"
  }
}


nic = {
  nic1 = {
    name                 = "nic-dev-001"
    location             = "West Europe"
    resource_group_name  = "rg_dev"
    subnet_name          = "sub-dev-001"
    virtual_network_name = "dev-vnet-001"
    auxiliary_sku        = "None"
    auxiliary_mode       = "None"
    pip_name = "avi-pip"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
        public_ip_name                = "avi-pip1"
        
      }
    }
  }
}

nsg_parent = {
  "nsg1" = {
    name                = "nsg_test1"
    location            = "West Europe"
    resource_group_name = "rg_dev"

    security_rules = {
      secret1 = {
        name                       = "ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"

      }
    }

  }
}

nic_nsg_parent = {
  nic_nsg1 = {
    nic_name            = "nic-dev-001"
    resource_group_name = "rg_dev"
    nsg_name            = "nsg_test1"
  }
}

vms = {
  vm1 = {
    name             =    "udayvm"
    size                = "Standard_F2"
    resource_group_name = "rg_dev"
    location            = "West Europe"
    admin_username      = "azurerm123"
    admin_password      = "uday@123"
    disable_password_authentication = "false"
    nic_name            = "nic-dev-001"
    os_disks = {

      os_disks1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_references = {
      source_image1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }
}

sql_server_parent = {
  "sql1" = {
    name = "sqlserver-dev-uday01" 
    location = "centralindia"
    resource_group_name = "rg_dev"
    version = "12.0"
    administrator_login = "adminuser"
    administrator_login_password = "uday@12345"
    minimum_tls_version = "1.2"
    public_network_access_enabled = true
     
  }
}

sql_database_parent = {
  "db1" = {
    name         = "db-dev-uday01"
    server_id   = "/subscriptions/2a6429ab-34bc-4c09-812c-9e5d8ceee0d7/resourceGroups/rg_dev/providers/Microsoft.Sql/servers/sqlserver-dev-uday01"
    server_name  = "sqlserver-dev-uday01" 
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    resource_group_name = "rg_dev"
  }
}

bastion_parent = {
  bastion1 = {
    name                 = "bastion-dev-001"
    location             = "West Europe"
    resource_group_name  = "rg_dev"
    subnet_name          = "AzureBastionSubnet" 
    vnet_name            = "dev-vnet-001"
    pip_name             = "avi-pip1"
  }
}