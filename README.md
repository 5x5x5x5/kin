setup.git
=========
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git config --global user.email "your.name@mail.com"
git clone https://github.com/5x5x5x5/kin.git
chmod 755 something
./setup/setup.sh   
```

See also http://github.com/5x5x5x5/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.



