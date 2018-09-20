# Getting-started

## Required Tools
* A valid token of your enterprise clouddc session :
get a static one, or login to cloud-datacenter.fr with your enterprise creds
and then get an expiring one (with firefox, chromium or chrome : press crtl-maj-i,
get a token from a request in network tools)

## Building infrastructure

Full information on terraform [infrastructure build guide](https://www.terraform.io/intro/getting-started/build.html).

### Configuration
* add the session token in main.tf provider "api_token" field
* edit main.tf file following Sewan's clouddc
[documentation](https://github.com/SewanDevs/terraform-provider-sewan/blob/github_release/website/docs/index.html.markdown) : [vm configuration](https://github.com/SewanDevs/terraform-provider-sewan/blob/github_release/website/docs/r/vm.html.md), [vdc configuration](https://github.com/SewanDevs/terraform-provider-sewan/blob/github_release/website/docs/r/vdc.html.md)

### Initialization
```
root@<container generated id>:~ terraform init

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.
If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
root@<container generated id>:~ terraform providers
.
└── provider.sewan
```

### Apply configuration plan

```
root@<container generated id>:~ terraform apply
```

## Update infrastructure

Full information on terraform [infrastructure update guide](https://www.terraform.io/intro/getting-started/change.html).

* update configuration files :
  * main.tf for vdc and vm not created by a template
  * <chosen template>\_override.tf.json for vm created by a clouddc template

Update infrastructure :
```
root@<container generated id>:~ terraform apply
```

## Destroy infrastructure

Full information on terraform [infrastructure destroy guide](https://www.terraform.io/intro/getting-started/destroy.html).

```
root@<container generated id>:~ terraform destroy
```

Notice the occurrence of a limitation that require a second run of "terraform destroy" command to successfully delete the vdc : vm deletion is not instantaneously. As the vm deletion request returns immediately a success (meaning the deletion
operation has started) and terraform plugin considers it as a finished deletion,
a vdc deletion request is send immediately to clouddc and it fails as the vdc's
vm are not yet deleted.

## Other operations
```
$ terraform
Usage: terraform [--version] [--help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a new or existing Terraform configuration
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    push               Upload this Terraform module to Terraform Enterprise to run
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

All other commands:
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    state              Advanced state management
```
