# Create Terraform Infrastructure with Docker

## Step 1: Open the Terraform Configuration File

In the **Code Editor** tab, open the `terraform.tf` file. This file includes the `terraform` block, which defines the provider and Terraform versions you will use with this project:

```hcl
terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
    required_version = "~> 1.7"
}
```

## Step 2: Define Resources in `main.tf`

Next, open `main.tf` and copy and paste the following configuration:

```hcl
provider "docker" {}

resource "docker_image" "nginx" {
    name         = "docker.mirror.hashicorp.services/nginx:latest"
    keep_locally = false
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.image_id
    name  = "tutorial"
    ports {
        internal = 80
        external = 8000
    }
}
```

## Step 3: Initialize the Project

In the **Terminal** tab, initialize the project to download the plugin that allows Terraform to interact with Docker:

```bash
terraform init
```

## Step 4: Provision the NGINX Server Container

Run the following command to provision the NGINX server container. When Terraform asks you to confirm, type `yes` and press ENTER:

```bash
terraform apply
```

## Step 5: Verify the NGINX Instance

Run the following command to view the NGINX container running in Docker via Terraform:

```bash
docker ps
```

## Step 6: Destroy Resources

To stop the container and destroy the resources created in this tutorial, run the following command. When Terraform asks you to confirm, type `yes` and press ENTER:

```bash
terraform destroy
```

You have now provisioned and destroyed an NGINX web server with Terraform.