# AWS AMI automation with Packer, Puppet and Terraform

This example aims to demonstrate how to user Packer and Puppet to create a AWS image.



## Packer Section



```
 packer
 ├── config_files
 ├── script_files
 │   ├── base_script.ps1
 │   └── base_winrm.ps1
 ├── template
 │   └── base_template.json
 └── vars
     └── base_vars.json
```

* **config_files** - placeholder for any configuration files that need to be uploaded to the image creation.
* **script_files** - contains the scripts that will be executed 


## Puppet Section


```
 puppet
 ├── Puppetfile
 ├── manifests
 │   └── site.pp
 └── modules
```

## Deploying the Image



```bash
packer build -var-file=vars/base_vars.json template/base_template.json
```