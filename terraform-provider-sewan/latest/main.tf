provider "sewan" {
  api_token = "<your company token>"
  api_url   = "https:/cloud-datacenter.fr/api/clouddc/"
  enterprise = "your enterprise name"
}

resource "sewan_clouddc_vdc" "example-vdc-name" {
  name       = "example-vdc-name"
  datacenter = "<dc1> or <dc2> or <ha>"
  vdc_resources = [
    {
      resource = "ram"
      total    = 10
    },
    {
      resource = "cpu"
      total    = 10
    },
    {
      resource = "storage_enterprise"
      total    = 80
    },
    {
      resource = "storage_performance"
      total    = 10
    },
    {
      resource = "storage_high_performance"
      total    = 10
    },
  ]
}

//
// RESOURCES CREATED FROM TEMPLATE
//
resource "sewan_clouddc_vm" "vm-created-from-template" {
  count           = 2
  depends_on      = ["sewan_clouddc_vdc.example-vdc-name"]
  name            = "vm-created-from-template"
  instance_number = "${count.index + 1}"
  ram             = 1
  cpu             = 1
  nics = [
    {
      vlan      = "<a vlan name>"
      connected = false
    },
  ]
  template      = "<a template name>"
  vdc           = "${sewan_clouddc_vdc.example-vdc-name.slug}"
  backup        = "<backup-no-backup> or <backup-7-days> or <backup-31-days>"
  storage_class = "<storage_enterprise> or <storage_performance> or <storage_high_performance>"
  boot          = "<on disk> or """
}

//
// RESOURCES NOT CREATED FROM TEMPLATE
//
resource "sewan_clouddc_vm" "vm-not-created-from-template" {
  depends_on      = ["sewan_clouddc_vdc.example-vdc-name"]
  count           = 2
  name            = "vm-not-created-from-template-${count.index}"
  ram             = 1
  cpu             = 1
  disks = [
    {
      name          = "system disk"
      size          = 10
      storage_class = "storage_enterprise"
    },
    {
      name          = "data disk"
      size          = 20
      storage_class = "storage_enterprise"
    },
  ]
  nics = [
    {
      vlan      = "<a vlan name>"
      connected = false
    },
  ]
  os            = "any available os on your clouddc, example : Debian, Ubuntu, CentOS, etc."
  vdc           = "${sewan_clouddc_vdc.example-vdc-name.slug}"
  backup        = "<backup-no-backup> or <backup-7-days> or <backup-31-days>"
  storage_class = "<storage_enterprise> or <storage_performance> or <storage_high_performance>"
  boot          = "<on disk> or """
}
