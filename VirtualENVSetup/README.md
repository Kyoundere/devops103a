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
`systemctl status nginx`<br>


