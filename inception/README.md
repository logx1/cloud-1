# Inception

This project sets up a complete WordPress environment using Docker. The stack includes Nginx, MariaDB, and WordPress itself, all running in separate containers managed by Docker Compose.

## Overview

The goal of this project is to provide a simple, portable, and easy-to-use WordPress environment for development and testing purposes. It uses official Debian Bookworm images as a base and automates the setup process using shell scripts and WP-CLI.

## Features

- **Dockerized:** The entire environment runs in Docker containers, ensuring consistency and isolation.
- **Nginx:** A high-performance web server that serves the WordPress site over HTTPS.
- **MariaDB:** A popular open-source relational database used to store WordPress data.
- **WordPress:** The latest version of WordPress, installed and configured automatically.
- **WP-CLI:** The command-line interface for WordPress is used to automate the installation process.
- **Portable:** The project is configured to be portable across different machines without requiring any code changes.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

Follow these steps to get the project up and running:

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Create the Data Directories

The project uses bind mounts to persist data. You need to create the data directories before starting the containers:

```bash
mkdir -p data/wordpress
mkdir -p data/mariadb
```

### 3. Create the `.env` File

The project uses an `.env` file to configure the WordPress installation. Create a file named `.env` in the root of the project and add the following content. **Remember to replace the placeholder values with your own secure credentials.**

```env
# MariaDB Settings
DB_NAME=wordpress_db
DB_USER=wordpress_user
DB_PASS=your_strong_database_password

# WordPress Settings
DOMAIN_NAME=yourdomain.com
WORDPRESS_ADMIN_USER=admin
WORDPRESS_ADMIN_PASS=your_strong_admin_password
WORDPRESS_ADMIN_EMAIL=admin@yourdomain.com
WORDPRESS_EDITOR_USER=editor
WORDPRESS_EDITOR_PASS=your_strong_editor_password
WORDPRESS_EDITOR_EMAIL=editor@yourdomain.com
```

### 4. Build and Run the Containers

Use the provided `Makefile` to build and run the containers in detached mode:

```bash
make all
```

This command will build the Docker images and start the Nginx, WordPress, and MariaDB services.

## Usage

The `Makefile` includes several useful commands to manage the environment:

- `make all` or `make up`: Builds and starts the containers.
- `make down`: Stops and removes the containers.
- `make start`: Starts the existing containers.
- `make stop`: Stops the running containers.
- `make status`: Shows the status of the running containers.

## Accessing the Site

Once the containers are running, you can access the WordPress site in your browser. Since the project uses a self-signed SSL certificate for a custom domain name, you need to add an entry to your `/etc/hosts` file to map the domain to your local machine.

1.  Open your `/etc/hosts` file with root privileges:

    ```bash
    sudo nano /etc/hosts
    ```

2.  Add the following line to the file, replacing `yourdomain.com` with the `DOMAIN_NAME` you set in your `.env` file:

    ```
    127.0.0.1 yourdomain.com
    ```

3.  Save the file and exit.

Now you can access your WordPress site by navigating to `https://yourdomain.com` in your web browser. You may see a warning about the self-signed certificate, which you can safely ignore for development purposes.

## Services

The environment consists of three main services:

- **Nginx:** The web server that listens on port 443 and serves the WordPress files. It is configured to use a self-signed SSL certificate for HTTPS.
- **WordPress:** A PHP-FPM service that runs the WordPress application. It is configured to communicate with the Nginx and MariaDB services.
- **MariaDB:** The database service where WordPress stores all its data. The data is persisted in the `./data/mariadb` directory on the host machine.