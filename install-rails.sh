# Install git
sudo apt install git -y

# Install dependencies for Ruby and Rails
sudo apt install curl -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Ruby
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.6
rbenv global 2.6.6
ruby -v

# Install Bundler
gem install bundler
bundle update

# Install Rails
gem install rails -v 5.2.4.2
rbenv rehash

# Install Redis
sudo apt install redis-server -y

# Install PostgreSQL
sudo apt install postgresql-common -y
sudo sh /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

sudo apt install postgresql postgresql-contrib libpq-dev -y
sudo apt install pgadmin4 -y

# Create PostgreSQL user
sudo -u postgres createuser ippo --superuser --createdb --echo 
sudo -u postgres psql -c "ALTER USER ippo PASSWORD 'syncm13'"

# Install Nokogiri
sudo apt-get install libgmp-dev
sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
gem install nokogiri
