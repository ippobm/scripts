#!/bin/sh

sudo apt-get update -y

## Install prerequisites
sudo apt-get install curl gnupg -y

## Install RabbitMQ signing key
curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -

## Install apt HTTPS transport
sudo apt-get install apt-transport-https

## Add Bintray repositories that provision latest RabbitMQ and Erlang 21.x releases
sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list <<EOF
## Installs the latest Erlang 22.x release.
## Change component to "erlang-21.x" to install the latest 21.x version.
## "bionic" as distribution name should work for any later Ubuntu or Debian release.
## See the release to distribution mapping table in RabbitMQ doc guides to learn more.
deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang
deb https://dl.bintray.com/rabbitmq/debian bionic main
EOF

## Update package indices
sudo apt-get update -y

## Install rabbitmq-server and its dependencies
sudo apt-get install rabbitmq-server -y --fix-missing

# rabbitmqctl add_user should be used to create a user, 
# rabbitmqctl set_permissions to grant the user the desired permissions and finally, 
# rabbitmqctl set_user_tags should be used to give the user management UI access permissions.

# Create admin user
sudo rabbitmqctl add_user admin vagrant

# Tag the user with "administrator" for full management UI and HTTP API access
sudo rabbitmqctl set_user_tags admin administrator

# Granting Permissions to a User
# First ".*" for read permission on every entity
# Second ".*" for write permission on every entity
# Third ".*" for configure permission on every entity
sudo rabbitmqctl set_permissions -p "/" "admin" ".*" ".*" ".*"

# Install Management Plugin
sudo rabbitmq-plugins enable rabbitmq_management
