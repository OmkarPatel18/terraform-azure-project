resource "azurerm_managed_disk" "datadisk" {
  for_each             = var.vm_ids  # Create 6 data disks instead of 4
  name                 = "${each.key}-datadisk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attachment" {
  for_each           = var.vm_ids  # Attach 6 data disks
  managed_disk_id    = azurerm_managed_disk.datadisk[each.key].id
  virtual_machine_id = each.value
  lun                = 10
  caching            = "ReadWrite"
}
