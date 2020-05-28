# Install git
sudo apt install git -y

# Install PostgreSQL
sudo apt install postgresql postgresql-contrib libpq-dev -y

# Create PostgreSQL user
sudo -u postgres createuser vagrant --superuser --createdb --echo 
sudo -u postgres psql -c "ALTER USER vagrant PASSWORD 'vagrant'"

# Install Redis
sudo apt install redis-server -y

sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Ruby and Rails
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
rvm install 2.6.6
rvm use 2.6.6 --default

# Install Nokogiri
sudo apt-get install libgmp-dev
sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
gem install nokogiri

gem install bundler
gem install rails -v 5.2.4.3
