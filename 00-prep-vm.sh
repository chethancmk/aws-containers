# Install Git
sudo yum update -y
sudo yum install git -y
git version

# Install Docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo reboot

# Install Python
yum list installed | grep -i python3
sudo yum install python3 -y
# Change Alias python3 to default
echo "alias python=python3" >> ~/.bashrc 
source ~/.bashrc

# Install Node JS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
node -e "console.log('Running Node.js ' + process.version)"

# Upgrade AWS CLI
pip3 install --user --upgrade awscli
aws --version

sudo reboot