# Install git
sudo apt install git -y

# Install Redis
sudo apt install redis-server -y

# Install Node
sudo apt install nodejs -y

# Install Yarn
sudo apt install yarn -y

# Install Ruby and Rails
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source "$HOME/.rvm/scripts/rvm"
rvm install 2.6.6
rvm use 2.6.6 --default

gem install bundler
gem install rails -v 5.2.4.3
