# Cloud-1: WordPress on AWS with Terraform and Docker

This project deploys a complete WordPress environment on an AWS EC2 instance using Terraform and Docker. The infrastructure is defined in Terraform, and the WordPress stack (Nginx, MariaDB, WordPress) is managed by Docker Compose.

## :warning: Important Notice: Hardcoded Paths

**This project is not portable in its current state.** The Terraform configuration in `3-ec2.tf` contains hardcoded local paths to files and resources on the original author's machine. To make this project work on your own system, you will need to modify these paths.

Specifically, you will need to update the following:

-   `user_data` in the `aws_instance` resource, which points to a local script.
-   The `source` path in the `provisioner "file"` block, which points to the `inception` directory.
-   The `private_key` path in the `connection` block.
-   The hardcoded `allocation_id` in the `aws_eip_association` resource.

## Overview

This project automates the setup of a cloud server running WordPress. It is intended as an introduction to deploying web applications on AWS.

The project consists of two main parts:

1.  **Terraform Infrastructure:** A set of Terraform configuration files that define the AWS resources needed to run the server.
2.  **Inception (Dockerized WordPress):** A Docker Compose setup that runs the WordPress environment, including Nginx, MariaDB, and WordPress itself.

## AWS Infrastructure

The Terraform configuration will create the following resources in the `us-east-1` region:

-   **VPC:** Uses a pre-existing VPC (`vpc-082ed7b8fc189c07e`).
-   **Security Group:** A security group named `cloud_aws_security_group` that allows inbound traffic on the following ports:
    -   `22` (SSH)
    -   `80` (HTTP)
    -   `443` (HTTPS)
-   **EC2 Instance:** A `t2.micro` EC2 instance running a specified AMI (`ami-0360c520857e3138f`).
-   **Elastic IP (EIP):** Associates a pre-existing EIP with the EC2 instance to provide a static public IP address.

## Prerequisites

Before you begin, you will need the following:

-   **Terraform:** [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
-   **AWS Account:** An active AWS account.
-   **AWS CLI:** [Install and configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) with your AWS credentials.
-   **An AWS Key Pair:** An EC2 key pair named `1337` in the `us-east-1` region, with the private key file (`1337.pem`) stored in the parent directory of this project.

## How to Deploy

1.  **Clone the Repository:**

    ```bash
    git clone <repository-url>
    cd cloud-1
    ```

2.  **Modify Hardcoded Paths:**

    As mentioned above, you must modify the hardcoded paths in `3-ec2.tf` to match your local environment.

3.  **Initialize Terraform:**

    ```bash
    terraform init
    ```

4.  **Apply the Terraform Configuration:**

    ```bash
    terraform apply
    ```

    Terraform will show you a plan of the resources that will be created. Type `yes` to confirm and create the resources.

## Accessing the WordPress Site

Once the `terraform apply` command is complete, the EC2 instance will be running and will begin to set up the WordPress environment. This process can take a few minutes.

To access the site, you will need to follow the instructions in the `inception/README.md` file to configure your local `/etc/hosts` file with the domain name you set up in the Docker environment.

Once configured, you can access your WordPress site by navigating to `https://yourdomain.com` in your web browser.

## Inception Project

For more details on the Dockerized WordPress setup, please refer to the `inception/README.md` file. This file explains how to configure the WordPress environment, manage the Docker containers, and persist data.
