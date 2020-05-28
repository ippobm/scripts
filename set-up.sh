#!/bin/sh

## If sudo is not available on the system,
## uncomment the line below to install it
# apt-get install -y sudo

sudo apt-get update -y

## Install prerequisites
sudo apt-get install curl gnupg -y

## Install RabbitMQ signing key
curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -

## Install apt HTTPS transport
sudo apt-get install apt-transport-https -y

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

# Install git
sudo apt install git -y

# Install PostgreSQL
sudo apt install postgresql postgresql-contrib libpq-dev -y

# Create PostgreSQL user
sudo -u postgres createuser vagrant --superuser --createdb --echo 
sudo -u postgres psql -c "ALTER USER vagrant PASSWORD 'vagrant'"

# Install Redis
sudo apt install redis-server -y

# Install Node
sudo apt install nodejs -y

# Install Yarn
sudo apt install yarn -y

# Install Ruby and Rails
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
rvm install 2.6.6
rvm use 2.6.6 --default

# Install Nokogiri
sudo apt-get install libgmp-dev -y
sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev -y
gem install nokogiri

gem install bundler
gem install rails -v 5.2.4.3

sudo apt install linux-cloud-tools-common -y
sudo apt install linux-tools-generic -y
sudo apt install linux-cloud-tools-generic -y

hv_fcopy_daemon
hv_kvp_daemon
hv_set_ifconfig
hv_vss_daemon
hv_get_dns_info

sudo shutdown -r now
