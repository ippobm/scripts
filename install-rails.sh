# Install git
sudo apt install git -y

# Install Ruby/Rails
sudo apt install rbenv -y
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

rbenv install 2.6.6
rbenv global 2.6.6

sudo apt install nodejs -y
sudo apt install yarn -y

gem install bundler
gem install rails -v 5.2.4.3
