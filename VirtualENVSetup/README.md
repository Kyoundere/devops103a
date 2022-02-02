# Pre-requisites:
Go on "Turn Windows Features On and Off", disable Hyper-V. <br><br>
If it gives a virtualisation error upon using "`vagrant up`" (e.g. amd-v not enabled), go into bios and enable SMV or AMD-V.<br><br>
Add the `Vagrant/` directory into `.gitignore` (the directory where you will install the vagrant VM).
<br><br>
![Vagrant](diagram.png)
# Install Ruby 
https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe
<br>
Type `Ruby --version` to check if it's installed.
<br><br>

# Install Vagrant 
https://www.vagrantup.com/
<br>
Type `Vagrant --version` to check if it's installed.
<br><br>
# Install VirtualBox 
https://www.virtualbox.org/wiki/Downloads
<br>
Go to the drivers directory which is by default: <br>(C:\Program Files\Oracle\VirtualBox\drivers)
<br>
Open vboxdrv or vboxsup (whichever is available), right click VBoxDrv.inf or VBoxSup.inf and click install. Then go into terminal and type `sc start xboxdrv` or `sc start vboxsup` depending on which directory was available. <br><br>
Control Panel -> Network and Internet -> Network and Sharing Centre -> Change Adapter settings -> Right click VirtualBox Host-Only Network -> Properties -> Install -> Service -> Manufacturer: Oracle Corporation -> Network service: VirtualBox NDIS6 Bridged Networking Driver.
<br><br>

# Launching Vagrant
Launch Terminal (like GitBash) with `admin privileges` and `cd` into the target directory. Make sure you copy and paste the `Vagrantfile` in this folder into the target directory where you want to install/launch vagrant. Afterwards, write:<br>
`vagrant init`<br>
`vagrant up`<br>
<br>
This should install and launch vagrant. If there's a virtualisation error, refer to the pre-requisites. 
<br><br>

# Using Vagrant
To create a VM: `vagrant up`<br>
To check the status of vagrant: `vagrant status`<br>
To delete the VM: `vagrant destroy`<br>
To shut the vagrant VM down: `vagrant halt`<br>
To reboot the vagrant VM: `vagrant reload`<br>
To access the VM shell: `vagrant ssh`<br>
To access a remote VM shell: `vagrant ssh xxx.xxx.xxx.xxx`, where xxx.xxx.xxx.xxx is an IP address.
<br><br>

# Setting up Ubuntu
How to use the apt-get package manager:<br>
`sudo apt-get install/update/upgrade/remove package -y`<br>
E.g.: `sudo apt-get install nginx -y`<br>
<br>

The following 3 commands are automatically completed by Vagrantfile, but they're useful to know anyway:<br>
`sudo apt-get update`<br>
`sudo apt-get upgrade -y`<br>
`sudo apt-get install nginx -y`<br>
<br>

Useful commands to interact with the system:<br>
`systemctl status/restart/start/stop object`<br>
`systemctl status nginx`<br><br>


# Linux Basics
To find out system information (such as distro, date, etc): `uname -a`<br>
To name the current directory we're in: `pwd`<br>
To list files in the current directory: `ls -a`<br>
To create a directory: `mkdir name-of-directory`<br>
Navigate to a different directory: `cd directory`, where `..` is previous directory, e.g. `cd ..`<br>
To create a file: `touch name-of-file`<br>
To display the contents of a file: `cat name-of-file`<br>
To delete a file: `rm -rf name-of-file-or-directory`<br>
To copy a file: `cp target-file-name location`<br>
To move a file: `mv source-file-name target-location-name`<br>
To list current active processes: `top`<br>
To check file permissions: `ll`<br>
To change file permissions: `chmod permission name-of-file`<br>


# Setting up the Virtual Environment
On the localhost, cd into Vagrant/environment/spec-tests and perform these two commands:<br>
`gem install bundler`<br>
`bundle`<br>
Which will install a few pre-requisites on the localhost.<br><br>

The command 'rake spec' while in the spec-tests/ directory will perform a series of checks to see if you have the pre-requisites required to successfully launch the application. If there are any missing after this guide, they will need to be installed for the app to work.<br><br>

I've automated all of the installations required inside the Unbuntu VM and put them into the `provisions.sh` shell file, which is coded to automatically launch whenever `vagrant up` is called. These include:<br><br>
- `sudo apt-get update -y`
- `sudo apt-get upgrade -y`
- `sudo apt-get install nginx -y`
- `sudo apt-get install npm -y`
- `curl -sl https://deb.nodesource.com/setup_6.x | sudo -E bash -`
- `sudo apt-get install nodejs -y`
- `sudo npm install pm2 -g`
<br>

After these commands are called, all the pre-requisites have been successfully installed and the application can be launched. The launch of this application can also be automated by using `cd` to move into the Vagrant/app folder inside the vm (where the app's directory is located). From here, if we `npm install` and `npm start`, the application launches but the terminal hangs. To avoid this, we install the forever module by using `npm install forever -g`. Then we use `npm install` normally in the app directory, and then use the forever module like this: `forever start app.js` to launch the app with `forever`, so the app launches in the background and doesn't make the terminal hang.<br>

- `cd /srv/provisioning/Vagrant/app`
- `npm install forever -g`
- `npm install`
- `forever start app.js`