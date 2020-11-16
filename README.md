# ft_services

Ft_services will introduce you to Kubernetes. You will discover cluster management and
deployment with Kubernetes. You will virtualize a network and do "clustering".

# Containers 

## Nginx

Nginx, stylized as NGINX or nginx or NginX, is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and publicly released in 2004. Nginx is free and open-source software, released under the terms of the 2-clause BSD license.

This container is listening on port 80 for http, port 443 for https, and port 22 for ssh.

## Wordpress

WordPress is a free and open-source content management system written in PHP and paired with a MySQL or MariaDB database. Features include a plugin architecture and a template system, referred to within WordPress as Themes.

This container is listening on port 5050, The WordPress website has several users and an administrator. Wordpress has its own nginx server.

## MYSQL

MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language.

This container is listening on port 3306.

## phpMyAdmin

phpMyAdmin is a free and open source administration tool for MySQL and MariaDB. As a portable web application written primarily in PHP, it has become one of the most popular MySQL administration tools, especially for web hosting services.

This container is listening on port 5000, phpMyAdmin is linked with the MySQL database. PhpMyAdmin has its own nginx server.

## InfluxDB

InfluxDB is an open-source time series database developed by InfluxData. It is written in Go and optimized for fast, high-availability storage and retrieval of time series data in fields such as operations monitoring, application metrics, Internet of Things sensor data, and real-time analytics.

This container is listening on port 8086.

## Grafana

Grafana is a multi-platform open source analytics and interactive visualization web application. It provides charts, graphs, and alerts for the web when connected to supported data sources, Grafana Enterprise version with additional capabilities is also available. It is expandable through a plug-in system.

This container is listening on port 3000, Grafana is linked with the InfluxDB database and it's monitoring all the containers. every service has it's own dashboard.

## FTP

The File Transfer Protocol is a standard network protocol used for the transfer of computer files between a client and server on a computer network. FTP is built on a client-server model architecture using separate control and data connections between the client and the server.

# LoadBalancer

In computing, load balancing refers to the process of distributing a set of tasks over a set of resources, with the aim of making their overall processing more efficient.

## MetalLB

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.

## Installation

Execute setup.sh script:

```bash
sh setup.sh
```

make sure you have docker and minikube installed.

## Disclaimer

Of course, this is just a student project. You shouldn't use it in anything resembling a production environment. I've been following pretty strict project guidlines, so there are many things that aren't implemented using best practices.
