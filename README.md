# azurerm_three_tier_application_config_terraform
## Overview

This repository contains Terraform configuration files to deploy a three-tier application on Azure using Azure Resource Manager (ARM). The three tiers include a web tier, an application tier, and a database tier.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure subscription
- Service principal with `Contributor` role

## Usage

1. Clone the repository:
    ```sh
    git clone /D:/Rapository/Git Repos/azurerm_three_tier_application_config_terraform
    cd azurerm_three_tier_application_config_terraform
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review the plan:
    ```sh
    terraform plan
    ```

4. Apply the configuration:
    ```sh
    terraform apply
    ```

## Architecture

The architecture consists of the following components:
- **Web Tier**: Azure App Service
- **Application Tier**: Azure App Service
- **Database Tier**: Azure SQL Database

## Outputs

After applying the configuration, Terraform will output the following:
- Web App URL
- Application App URL
- Database connection string

## Cleanup

To destroy the resources created by this configuration, run:
```sh
terraform destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is licensed under the MIT License.