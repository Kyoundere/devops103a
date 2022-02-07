# Pre-requisites:
Go on "Turn Windows Features On and Off", disable Hyper-V. <br><br>
If it gives a virtualisation error upon using "`vagrant up`" (e.g. amd-v not enabled), go into bios and enable SVM or AMD-V.<br><br>
Add the `.vagrant/` directory into `.gitignore` (the directory where you will install the vagrant VM).
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

The command `rake spec` while in the spec-tests/ directory will perform a series of checks to see if you have the pre-requisites required to successfully launch the application. If there are any missing after this guide, they will need to be installed for the app to work.<br><br>

I've automated all of the installations required inside the Unbuntu VM and put them into the `provisions.sh` shell file, which is coded to automatically launch whenever `vagrant up` is called. These include:<br><br>
- `sudo apt-get update -y`
- `sudo apt-get upgrade -y`
- `sudo apt-get install nginx -y`
- `sudo apt-get install npm -y`
- `curl -sl https://deb.nodesource.com/setup_6.x | sudo -E bash -`
- `sudo apt-get install nodejs -y`
- `sudo npm install pm2 -g`
<br><br>

Now, all the pre-requisites have been successfully installed and the application can be launched.<br><br>
The launch of this application can now be automated.<br><br>
We can do this by using `cd` to move into the Vagrant/app folder inside the vm (where the app's directory is located).<br><br>
From here, if we `npm install` and `npm start`, the application launches but the terminal hangs.<br><br>
To avoid this, we install the forever module by using `npm install forever -g`.<br><br>
Then we use `npm install` normally in the app directory, and then use the forever module like this: `forever start app.js` to launch the app with `forever`.<br><br>
This makes it so that the app launches in the background and doesn't make the terminal hang.<br><br>

- `cd /srv/provisioning/Vagrant/app`
- `npm install forever -g`
- `npm install`
- `forever start app.js`<br>

I've also added a section in the `Vagrantfile` to run two VM machines at once.<br><br>
One is called `app` and one is called `db`.<br><br>
This was done by defining two different VM's and passing them through to be used to assign the operating system, private networks, synced folders and a provisions file:<br><br>

```
config.vm.define "app" do |app`
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.vm.provision "shell", path: "provision.sh", privileged: false 
    app.vm.synced_folder "../","/srv/provisioning"
end
config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
end
```
<br>

# Linux Variables
Creating a linux variable: `FIRST_NAME=SHAHRUKH`<br>
Printing out the variable: `echo $FIRST_NAME`<br>
Viewing the environment variables: `printenv VAR_NAME` and `env`, e.g. `printenv PATH`<br>
Creating an environment variable: `export VAR_NAME`, e.g. `export LAST_NAME=SMITH`<br>
Deleting an environment variable: `unset VAR_NAME`, e.g. `unset LAST_NAME`<br>
Keeping an environment variable persistent: Set it inside `~/.bash_profile`

Connecting to the DB with Linux:
```
// connect to database
if(process.env.DB_HOST) {
  mongoose.connect(process.env.DB_HOST);

  app.get("/posts" , function(req,res){
      Post.find({} , function(err, posts){
        if(err) return res.send(err);
        res.render("posts/index" , {posts:posts});
      })
  });
}
```
<br>

# Setting up a Reverse Proxy
We're going to use reverse proxying so that any traffic to the target IP address (`192.168.10.100`) is automatically redirected to the application, which is hosted on hosted on `port 3000` (`192.168.10.100:3000`).<br><br>
We're doing this by created a file called `default` and setting up an nginx configuration that listens to any traffic from `port 80` and redirects it to `port 3000`.<br><br>
In the provisioning shell file, we'll copy that file and move it into `/etc/nginx/sites-available/` to replace the nginx config file there with our own one.<br><br>
We do this by using: `sudo cp /srv/provisioning/vagrant/default /etc/nginx/sites-available/`.<br><br>
Having edited the nginx configuration, we can restart nginx to apply the chances. We restart nginx with the command `sudo systemctl restart nginx`.<br><br>
Now we run the application as normal, and the reverse proxy should be working perfectly fine, redirecting traffic from `192.168.10.100` to `192.168.10.100:3000`.<br><br>

# Setting up MongoDB

We `vagrant ssh db` to specifically launch the second VM.<br>
We try `sudo apt-get update -y` to double check this VM has internet access.<br><br>


Now we run the following command to add a keyserver for mongodb:<br>
`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927`<br><br>

Then we grab this specific version of mongodb:<br>
`echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list`<br><br>

Refresh the package-manager: <br>
`sudo apt-get update -y`<br>
`sudo apt-get upgrade -y`<br>

We now install the 3.2.20 version of mongodb:<br>
`sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20`

Now, the database has been installed. We have to change our ip on the mongodb config file to `0.0.0.0` from `127.0.0.1`, we can use a single-line command to search for instances of '127.0.0.1' and replace them with '0.0.0.0':<br>
`sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf`<br><br>

# Amazon Web Services (AWS)

The AWS Cloud spans 84 Availability Zones within 26 geographic regions around the world, with announced plans for 24 more Availability Zones and 8 more AWS Regions in Australia, Canada, India, Israel, New Zealand, Spain, Switzerland, and United Arab Emirates (UAE).<br><br>

Provides IaaS, PaaS and SaaS:
- IaaS: Infrastructure as a Service
- PaaS: Platform as a Service
- SaaS: Software as a Service

<br>
EC2 (Elastic Compute Cloud) allows us to rent a virtual machine with the OS of your choice, so we don't have to set everything up ourselves from dependencies to virtualbox to provisioning and security. Important for migrating to the cloud, as well as not having to worry about power requirements, space considerations, expensive computer hardware, security, and software updates. 
<br><br>

# Setting Up AWS

![2 Tier Architecture](2tier.png)

OS: Ubuntu Server 18.04<br>
Architecture: x86<br>
Instance Type: t2 Micro<br>
Subnet: DevOps 103a<br>
Inbound rules: HTTP: my IP, custom TCP at port 3000, SSH at port 20 (to access)
               
Key is required to access the EC2 machine, save key as `keyname.pem` and move it into `~/.ssh`. Select connect on EC2, and copy the SSH login commands into terminal (after CD'ing into `~/.ssh`.<br>


After logging in, we need to move our data into the EC2 machine.<br>
`sudo apt-get install subversion -y`<br>
`sudo svn GitHubTrunkLink`<br>
These commands will download a specific trunk (folder) of our GitHub project into the machine. I'll be copying the entire Vagrant folder, and then using `rm -rf filename` to delete unneeded files, such as `Vagrantfile`.<br>
<br> Alternatively, can use the SCP command to move data directly from our computer into the vm, seems to be more secure: <br>
`scp -i eng103a.pem -r ~/devops103a/Vagrant/ ubuntu@ec2-3-250-15-190.eu-west-1.compute.amazonaws.com:~`<br>

Next, we install nginx again:<br>
`sudo apt-get install nginx -y`<br>

If you access the public IP now, it'll show the nginx home page.<br>
However, if we launch the application (after installing all the dependencies), we won't be able to access the app at port 3000.<br>
This is because the port is blocked, and we need to open it.<br><br>
On the AWS website, enter the security tab on your instance, security groups and edit inbound rules. Add Custom TCP connection at port 3000 for any IPv4 address.<br><br>

Now if you `npm start` the application, you should be able to see the app running at port 3000 on the public IP.

Next, we create another EC2 for MongoDB<br>
Start by updating and upgrading the repos as usual:<br>
`sudo apt-get update -y && sudo apt-get upgrade -y`<br><br>
Then we'll assign the keyserver onto our system:<br>
`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927`<br><br>
And now we grab the specific 3.2 version of MongoDB from their online repository:<br>
`echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list`<br><br>
Since we've just grabbed new packages from a repository, let's update and upgrade again:<br>
`sudo apt-get update -y && sudo apt-get upgrade -y`<br><br>
And now we can finally install MongoDB 3.2.20:<br>
`sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20`<br><br>
The only thing left to do now is to change the mongod.conf file in /etc/ and change the IP from 127.0.0.1, which we can use the command to do, replacing any instance of '127.0.0.1' with '0.0.0.0':<br>
`sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf`<br><br>
After updating the config file, all we have to do is restart MongoDB and we can exit the DB VM:<br>
`sudo systemctl restart mongod`<br><br>

After all this, we just need to ssh back into the App VM instance, and create the environment variable DB_HOST that includes the public IP address of the DB VM, which will allow the app the ask for information from the database and can be found on AWS website:<br>
`echo "export DB_HOST='mongodb://PUBLICIPADDRESSHERE:27017/posts'" >> ~/.bash_profile
source ~/.bash_profile`<br><br>
Finally, we can CD into the 'app' folder, run `node seeds/seed.js` to seed the database, and then subsequently use `npm start`, which will launch the app on port `3000`, and the database can be accessed via the `:3000/posts`.
