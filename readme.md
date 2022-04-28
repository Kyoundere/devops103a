- [What is DevOps](#what-is-devops)
  - [Why should we use DevOps](#why-should-we-use-devops)
    - [Benefits of DevOps](#benefits-of-devops)
    - [Monolith, 2 tier & Microservices Architectures](#monolith-2-tier--microservices-architectures)
- [Installing Python](#installing-python)
- [Vagrant](#vagrant)
  - [Pre-Requisites](#pre-requisites)
- [Install Ruby](#install-ruby)
  - [Install Vagrant](#install-vagrant)
- [Install VirtualBox](#install-virtualbox)
  - [Launching Vagrant](#launching-vagrant)
  - [Using Vagrant](#using-vagrant)
- [Setting up Ubuntu](#setting-up-ubuntu)
  - [Linux Basics](#linux-basics)
- [Setting up the Virtual Environment](#setting-up-the-virtual-environment)
  - [Linux Variables](#linux-variables)
- [Setting up a Reverse Proxy](#setting-up-a-reverse-proxy)
- [Setting up MongoDB](#setting-up-mongodb)
- [Amazon Web Services (AWS)](#amazon-web-services-aws)
  - [Setting Up AWS](#setting-up-aws)
  - [AMIs](#amis)
  - [S3](#s3)
  - [Autoscaling](#autoscaling)
  - [Setting Up Auto Scaling + Load Balancer](#setting-up-auto-scaling--load-balancer)
- [CI/CD](#cicd)
  - [Creating an SSH Connection](#creating-an-ssh-connection)
  - [Jenkins](#jenkins)
  - [Continuous Integration](#continuous-integration)
  - [Continuous Delivery](#continuous-delivery)
  - [Continuous Deployment](#continuous-deployment)
- [IAC with Ansible](#iac-with-ansible)
    - [Let's create Vagrantfile to create Three VMs for Ansible architecture](#lets-create-vagrantfile-to-create-three-vms-for-ansible-architecture)
      - [Ansible controller and Ansible agents](#ansible-controller-and-ansible-agents)
  - [Benefits of Ansible](#benefits-of-ansible)
  - [What is IaC](#what-is-iac)
  - [Checking Vagrant Instances](#checking-vagrant-instances)
  - [Installing Ansible with Linux](#installing-ansible-with-linux)
  - [Installing Ansible on Windows](#installing-ansible-on-windows)
  - [Ansible Playbooks](#ansible-playbooks)
    - [Creating a playbook:](#creating-a-playbook)
    - [Next, we will make a yml file to move the app folder into the web server, install all the dependencies required and then install and run the application:](#next-we-will-make-a-yml-file-to-move-the-app-folder-into-the-web-server-install-all-the-dependencies-required-and-then-install-and-run-the-application)
  - [Migrating Ansible to Cloud (Python))](#migrating-ansible-to-cloud-python)
  - [Installing Terraform](#installing-terraform)

# What is DevOps
## Why should we use DevOps
### Benefits of DevOps

**Four pillars of DevOps best practice**
- Ease of Use
- Flexibility
- Robustness; faster delivery of product
- Cost effective

### Monolith, 2 tier & Microservices Architectures

Monolith (One box that has the front end, back end, database) (Everytime you add a feature, you have to restart the entire program) (Uptime, responce time, etc..)

2 tier (breaking it down into smaller things with AWS)

Microservices (Separating it into even smaller things for improved uptime, and easier updating

# Installing Python
- `sudo add-apt-repository ppa:deadsnakes/ppa -y`
- `sudo apt install python3.10 -y`
- `sudo su`
- `update-alternatives --install /usr/bin/python python /usr/bin/python3 1`
- `python --version`
- `exit`
- `sudo apt-get install python3-pip -y`
# Vagrant

## Pre-Requisites
Go on "Turn Windows Features On and Off", disable Hyper-V. <br><br>
If it gives a virtualisation error upon using "`vagrant up`" (e.g. amd-v not enabled), go into bios and enable SVM or AMD-V.<br><br>
Add the `.vagrant/` directory into `.gitignore` (the directory where you will install the vagrant VM).
<br><br>
![Vagrant](VirtualENVSetup/diagram.png)
# Install Ruby 
https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe
<br>
Type `Ruby --version` to check if it's installed.
<br><br>

## Install Vagrant 
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

## Launching Vagrant
Launch Terminal (like GitBash) with `admin privileges` and `cd` into the target directory. Make sure you copy and paste the `Vagrantfile` in this folder into the target directory where you want to install/launch vagrant. Afterwards, write:<br>
`vagrant init`<br>
`vagrant up`<br>
<br>
This should install and launch vagrant. If there's a virtualisation error, refer to the pre-requisites. 
<br><br>

## Using Vagrant
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


## Linux Basics
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

## Linux Variables
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

## Setting Up AWS

![2 Tier Architecture](VirtualENVSetup/2tier.png)

OS: Ubuntu Server 18.04<br>
Architecture: x86<br>
Instance Type: t2 Micro<br>
Subnet: DevOps 103a<br>
Inbound rules: HTTP: my IP, custom TCP at port 3000, SSH at port 22 (to access)
               
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
OS: Ubuntu Server 18.04<br>
Architecture: x86<br>
Instance Type: t2 Micro<br>
Subnet: DevOps 103a<br>
Inbound rules: Custom TCP: 27017 any IP, SSH at port 22 (to access)<br><br>
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
`echo "export DB_HOST='mongodb://PUBLICIPADDRESSHERE:27017/posts'" > ~/.bash_profile`
`source ~/.bash_profile`<br><br>
Finally, we can CD into the 'app' folder, run `node seeds/seed.js` to seed the database, and then subsequently use `npm start`, which will launch the app on port `3000`, and the database can be accessed via the `:3000/posts`.<br><br>

## AMIs

AWS Amazon Machine Image/s (AMIs)
- helps us save and back-up the data
- helps automate deployment on cloud

Creating an AMI: Select a running instance, right click, images, `create image`.<br><br>
After creating this image, you can launch an instance from this image that preserves the volume of the snapshot, which will keep changes of the instance from when the AMI was created.

Deploying an AMI:
- On the left vertical bar, select '`AMIs`'.
- Find the created AMI, select `create instance from image`.
- Pick the settings as used before, with the right security group settings.
- Review and launch your instance.

## S3
- Simple Storage Service
- Database available on AWS
- Globally available
- DR (Disaster Recovery)
- Can store any files
- CRUD ACTIONS (Create, Bucket/Object, Read, Update, Delete)
From local host to EC2

E.g. when github goes down, S3 will still have the storage available as an option for disaster recovery.

![S3](sr3/DevOpsIsh.png)

AWSCLI<br>
AWS SEC & Access Keys<br>
Required to access S3 from EC2 storage for CRUD
actions from any AWS zone.

Standard - Data be accessed anytime<br>
Glacier - Infrequent access to data, but cheaper<br>
CDN - Content Delivery Network<br><br>

How to access S3:<br>
- Enter EC2 instance
- Python 3 or above
- Install pip3
- Ensure to use python 3
- `sudo apt install python3.7-minimal`
- alias python=python3.7
- sudo pip3 install awscli
- aws configure
- Enter access key, secret key, region (eu-west-1), and json for output data type
- aws s3 ls

To create a bucket after accessing S3:
- `aws s3 mb s3://name-of-bucket`
- The name of the bucket cannot contain underscores due to the naming convention

Copy files from the EC2 into the S3 storage:
- `aws s3 cp nameoffile.txt s3://name-of-bucket`

Download files from the S3 storage into the EC2:
- `aws s3 cp s3://name-of-bucket/name-of-file.txt nameoffile.txt`

Deleting local file test.txt:<br>
- `s3.Object(bucket_name, filename).delete()`

Recreating the bucket (only works if it doesn't exist already):<br>
- `s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)`

Deleting the entire bucket (only works if it's empty):
- `s3.Bucket(bucket_name).delete()`

Upload file to the bucket called test.txt:<br>
- `s3.Bucket(bucket_name).upload_file(filename, "hooyah")`

Download a file from the bucket called test.txt:<br>
- `s3.Bucket(bucket_name).download_file(filename, "wongotongo.txt")`
<br><br>

All in combination, I have created an interactive file that asks for input to use each action on:<br>


```python
#!/usr/bin/env python
import boto3
location = {'LocationConstraint': "eu-west-1"}
s3 = boto3.resource('s3')
bucket_name = input("what is the bucket name\n")

while True:
    action = input("what would you like you to do? c for createbucket, db for delete bucket, d for delete file, u for upload, dl for download, e for exit\n").lower()

    if action == "db":
        s3.Bucket(bucket_name).delete()
    elif action == "cb":
        s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)
    elif action == "d":
        filename = input("what is the filename?\n")
        s3.Object(bucket_name, filename).delete()
    elif action == "u":
        filename = input("what is the name of the file you're uploading?\n")
        targetfilename = input("what is the destination file name?\n")
        s3.Bucket(bucket_name).upload_file(filename, targetfilename)
    elif action == "dl":
        filename = input("what is the name of the file you're downloading?\n")
        targetfilename = input("what is the destination file name?\n")
        s3.Bucket(bucket_name).download_file(filename, targetfilename)
    elif action == "e":
        break
```

## Autoscaling 
Autoscaling and Load Balancing:
- Autoscaling autoamtically adjusts the amount of computational resources based on the server load
- Load Balancing distributes traffic between EC2 instances so that no one instance gets overwhelmed, especially when scaling out to introduce more instances
- Results in high availability (will stay available and stable for a long time, as any instances that don't pass health checks will be terminated automatically and a new instance will be spun up to replace it with no downtime across multiple AZs
- Also results in high scalability on demand in response to multiple factors such as high CPU usage or network load or number of users to stay stable, as well as scaling back inwards to save fees and money when the servers are unneeded

![Load Balancer](loadbalancer.png)

Load balancer acts after a server has scaled out, so when the new backup servers are incorporated into your system it will automatically distribute the network load evenly across all the servers, so that the new server will relieve the load on the other servers.

E.g. An online store going through Christmas and January:
- Of course there'll be many more people trying to buy from the store during christmas.
so the network load during christmas will be really high.<br>
- Then as we get into january the network load will go down pretty quickly.<br>
- If you hosted everything locally, you would usually buy the extra servers/hardware - outright to deal with christmas network load.<br>
- When they're no longer needed during january you're losing a lot of money because you have to sell them back or they will stay unused.
- Cloud computing autoscaling is a big solution for this, because resources can be purchased as they are needed, so when christmas arrives a company can just use the autoscaling functionality to scale out the business and the load balancer will relieve the load on the servers. 
- Then as soon as christmas is over and the network traffic drops, the system will autoscale again but inwards this time, so you will no longer be paying for the servers you don't need.

## Setting Up Auto Scaling + Load Balancer

- Select `Launch Template` on AWS
- `Create Launch Template`
- Select your AMI to launch each auto scaling instance from a snapshot
- Ensure the security group is correct for the ports
- At the end of `Advanced details`, enter user-data to automate a script that launches every time an auto scaling group instance is launched, this is my user-data script:
```#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo su ubuntu
echo "export DB_HOST=mongodb://eng103a-zilamo.duckdns.org:27017/posts" > ~/.bash_profile
source ~/.bash_profile
cd ~/duckdns
./duck.sh
cd /home/ubuntu/code/Vagrant/app && node seeds/seed.js
cd /home/ubuntu/code/Vagrant/app && screen -d -m npm start
```
- Next, select your newly-created launch template and select 'create auto scaling group'
- Choose multiple Availability Zones to ensure high availability is reached, preferably in separate regions (such as 1a 1b 1c)
- Next, attach to a new load balancer
- Internet-facing Application Load Balancer 
- Minimum 2, Desired 2, Maximum 3
- Enable logging via CloudWatch
- Target tracking policy: employ new instances at 25% CPU usage

Now while your auto scaling group is up, it should run 2 instances minimum, and try to keep at 2 instances, keeping it highly available in case the other instance goes down.<br>
If the CPU usage spikes above 25% it will immediately employ an extra instance, which makes it highly scalable to deal with a higher load on the server.<br>
If the CPU usage eases down, one of the instances will terminate itself to return back to the desired 2 instances. 

- internet gateway is public access
- route table can decide who can come in to the 'guest room'
- bedroom key is exclusive to myself
- security group is firewall on an instance level


# CI/CD

Could you explain CI/CD?:
- Continuous Integration is partly a culture that involves frequent code commits and updates, rather than occasional large commits. 
- On top of that, the push should automatically integrate the data from localhost onto github and straight onto the AWS instance without your own manual interaction with the instances. 
- CD stands for either continuous delivery or continuous deployment, depending on how the user wants to approach their pipeline. 
- These both involve automation of further stages of the pipeline. 
- Continuous delivery means that the changes that are uploaded to the repository via continuous integration are automatically bug tested (such as via Jenkins) and then uploaded on the final instance, such as in AWS storage, where the operations team can manually deploy the changes to live. 
- Continuous deployment is the same as continuous delivery, except it's automatically uploaded to the live instance rather than letting the operations team manually handle it, effectively automating the final step that continuous delivery leaves to the operations team.

## Creating an SSH Connection

1. Generate SSH key-pair on localhost.
2. Put the lock onto GitHub, copying the public SSH key onto GitHub.
3. Create a new repo for CICD on our GitHub.
4. Use your ssh key to push changes locally into the SSH key-protected repository.

- file.pub - key to get into github account using secure shell
1. 
    - `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
    - Generates SSH key-pair.
    - Enter file in which to save key without writing anything (or give it a name).
        - ONLY IF you've given it a name, use the following two commands:
        - `eval "$(ssh-agent -s)"`
        - `ssh-add ~/.ssh/keyname` where keyname is the name you entered.
    - Enter passphrase (empty if none).
    - Generates .pub file which is the key.
2. 
    - Go onto your GitHub settings, SSH keys and copy and paste the entire key. 
    - You can list the contents of the key by using the '`cat`' command.
3. 
    - Go to your main GitHub page.
    - Click 'repositories'.
    - Create a new public repository, name it something related to CI/CD.
4. 
    - `git init`
    - `git add .`
    - `git commit -m "first commit"`
    - `git branch -M main`
    - `git remote add origin SSHGITCLONELINKHERE`
    - `git push -u origin main`
  
## Jenkins

- Jenkins default port is 8080

1. Testing to see if Jenkins works
    - Click "New Item"
    - Select "Freestyle Project"
    - Scroll down to the bottom and click "Add Build Step"
    - Select "Shell Commands"
    - Here, you can enter bash commands that will execute when this build is run, such as `uname -a` and `date`
    - Click 'Apply' and 'Save'
    - Build the item by choosing 'Build Now'
    - Click on the item, select the latest build and view 'Console Output' to see the outpout of the bash commands
2. Testing to see if Jenkins works by chaining two items
    - Follow the previous step right until before you select 'Apply' and 'Save'
    - At the bottom, under 'Post-build Actions', select 'Build other projects'
    - Select the first item you created, and tick "Trigger only if build is stable".
    - Now, when you build the new project, it will run the bash commands, and if everything is successful it will automatically build the first project you designed as well, and execute those commands in the same console output.

## Continuous Integration

1. Set up a new freestyle project item in Jenkins
    - `Discard old builds` - max builds: 3
    - Select `GitHub Project`, copy and paste the clone HTTPS url here
    - Select `Restrict where this project can be run`, and write `sparta-ubuntu-node`

2. Set up a webhook and create an SSH key on GitHub
    - Go to `Settings -> Webhooks -> Add webhook`
    - Copy the URL along with the port of the Jenkins server, with `/github-webhook/` appended to the end, e.g. `http://14.130.53.18:8080/github-webhook/`
    - Write content-type: `application/json`
    - Open Git Bash and write the following code in your new repository for Jenkins' directory:
    - `ssh-keygen -t ed25519 -C "your_email@example.com"`
    - You will be prompted for a filename, keep it empty or write a custom name
    - Press enter twice on the passphrase prompt to keep it empty
        - If you specified a username, enter the following code to add it to the list of SSH keys:
        - `eval "$(ssh-agent -s)"`
        - `ssh-add ~/.ssh/filename`, where `filename` is the filename you specified
    - use the `cat` command to list the contents of your key file in `~/.ssh`, so that you can copy paste it

3. Complete the continuous integration job in Jenkins
    - Continue on from the first step
    - Select the `Git` box
    - Add the GitHub `clone ssh` URL into `Repository URL`
    - Select `Credential -> Add -> Key` and then insert your private key (cat filename without .pub extension for private key on Git Bash)
    - Branches to build: `*/main` OR the specific branch you are working on, such as `*/dev`
    - Build triggers: Select `GitHub hook trigger for GITScm Polling` (this triggers the build as soon as a change is pushed to the repository)
    - In Build Environment, select `Provide Node & npm bin/ folder to PATH` and `SSH Agent` and provide the private key here
    - Under `Build` select `Add build step -> Execute shell commands`:
    ```bash
    cd app
    npm install
    npm test
    ```
    - Finally, select `post-build actions` and write the name of the next item you will create for the continuous delivery job


## Continuous Delivery

1. Set up a new freestyle project in Jenkins
    - `Discard old builds` - max builds: 3
    - Select `GitHub Project`, copy and paste the clone HTTPS url here
    - Select `Restrict where this project can be run`, and write `sparta-ubuntu-node`

2. Finish the continuous delivery job in Jenkins
    - Select the `Git` box
    - Add the GitHub `clone ssh` URL into `Repository URL`
    - Select `Credential -> Add -> Key` and then insert your private key (cat filename without .pub extension for private key on Git Bash)
    - Branches to build: `*/main` OR the specific branch you are working on, such as `*/dev`
    - In Build Environment, select `Provide Node & npm bin/ folder to PATH` and `SSH Agent` and provide the private key here, as well as the SSH keypair to access your AWS instance, should be a .pem file
    - Under `Build` select `Add build step -> Execute shell commands`:
    ```bash
    git checkout main
    git pull origin main
    git merge origin/dev
    git push origin main
    scp -o "StrictHostKeyChecking=no" -v -r app ubuntu@ec2-54-195-167-174.eu-west-1.compute.amazonaws.com:~ 
    ```
    - Except, replace the ssh log-on URLs for the `scp` command

## Continuous Deployment

1. Edit the continuous delivery build shell commands to implement continuous deployment instead
    - Replace the shell commands with: 
    ```bash
    git checkout main
    git pull origin main
    git merge origin/dev
    git push origin main
    scp -o "StrictHostKeyChecking=no" -v -r app ubuntu@ec2-54-195-167-174.eu-west-1.compute.amazonaws.com:~ 
    ssh -o "StrictHostKeyChecking=no" -v -tt ubuntu@ec2-54-195-167-174.eu-west-1.compute.amazonaws.com << EOF
    cd app 
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install nginx -y
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install
    screen -d -m npm start
    exit

    EOF
    ```
    - Except, replace the ssh log-on URLs for the `scp` and `ssh` commands


# IAC with Ansible

![Ansible](ansible.png)

### Let's create Vagrantfile to create Three VMs for Ansible architecture
#### Ansible controller and Ansible agents 

```

# -*- mode: ruby -*-
 # vi: set ft=ruby :
 
 # All Vagrant configuration is done below. The "2" in Vagrant.configure
 # configures the configuration version (we support older styles for
 # backwards compatibility). Please don't change it unless you know what
 
 # MULTI SERVER/VMs environment 
 #
 Vagrant.configure("2") do |config|
 # creating are Ansible controller
   config.vm.define "controller" do |controller|
     
    controller.vm.box = "bento/ubuntu-18.04"
    
    controller.vm.hostname = 'controller'
    
    controller.vm.network :private_network, ip: "192.168.33.12"
    
    # config.hostsupdater.aliases = ["development.controller"] 
    
   end 
 # creating first VM called web  
   config.vm.define "web" do |web|
     
     web.vm.box = "bento/ubuntu-18.04"
    # downloading ubuntu 18.04 image
 
     web.vm.hostname = 'web'
     # assigning host name to the VM
     
     web.vm.network :private_network, ip: "192.168.33.10"
     #   assigning private IP
     
     #config.hostsupdater.aliases = ["development.web"]
     # creating a link called development.web so we can access web page with this link instread of an IP   
         
   end
   
 # creating second VM called db
   config.vm.define "db" do |db|
     
     db.vm.box = "bento/ubuntu-18.04"
     
     db.vm.hostname = 'db'
     
     db.vm.network :private_network, ip: "192.168.33.11"
     
     #config.hostsupdater.aliases = ["development.db"]     
   end
 
 
 end
```

## Benefits of Ansible
- Don't need to manually SSH into each server to try to execute commands 
- The more servers there are, the more impossible it becomes to do everything manually (e.g. if you have 100 servers, how will you perform a command in all 100 of them without a controller like ansible?)
- Can use ansible to gather information about all the servers at once or individual ones
- Very simple and easy to set up (it took us about 10 minutes to install ansible, and 5 minutes to edit the hosts file)

## What is IaC

- Managing and provisioning of infrastructure through code instead of through manual processes with an emphasis on self-service
- Such as being able to execute commands from multiple servers at once through code with a controller such as Ansible in YAML 
- Results in consistency throughout your configuration because it's all coming from the same code using the controller, which minimises the risk of human error
overall 
- Results in financial savings for a business that implements IaC via increased productivity and makes it much easier to scale up and attach new servers to the controller

## Checking Vagrant Instances

To check if the vagrant servers work and have internet access, we'll individually SSH into them with `vagrant ssh instancename` and perform the `sudo apt-get update -y && sudo apt-get upgrade -y` command on each one (web, db, controller).<br>

## Installing Ansible with Linux

- To install ansible, first let's ssh into the ansible instance: `vagrant ssh controller`<br>
- Now we will perform the pre-requisites to installing ansible<br>
- `sudo apt-get install software-properties-common -y`
- `sudo apt-add-repository ppa:ansible/ansible -y`
- Now we can install ansible
- `sudo apt-get install ansible -y`
- To check if ansible is successfully installed
- `ansible --version`
- Now we'll install a package that will help us to visualise the local storage
- `sudo apt-get install tree`
- Now we'll test it out 
- `cd /etc/ansible/`
- `tree`
- We need to now edit the hosts file here to tell ansible which servers you want to connect to and how
- `echo -e "[web]\n192.168.33.10 ansible_ssh_pass=vagrant\n[db]\n192.168.33.11 ansible_ssh_pass=vagrant" | sudo tee --append /etc/ansible/hosts`
- This should be appended to the end of the hosts file:
```yaml
[web]
192.168.33.10 ansible_ssh_pass=vagrant
[db]
192.168.33.11 ansible_ssh_pass=vagrant
```
- Next we'll try to connect to the servers specified in the hosts file
- `ssh vagrant@192.168.33.10` #this is the private IP of the app, password is 'vagrant'
- This should successfully connect, and we'll just exit it afterwards
- `exit`
- We'll do the same thing for the db server
- `ssh vagrant@192.168.33.11` #this is the private IP of the db, password is 'vagrant'
- `exit`
- We can also ping multiple servers at once to check their connectivity:
- `ansible web,db -m ping`
- On top of that, we have functionality to copy files from the localhost into the remote servers
- Let's create a file in the home directory which we'll try to copy to all the attached servers afterwards
- `sudo nano ~/readme.md`
- (Write anything inside the file and save it)
- `ansible all -m copy -a "src=~/readme.md dest=~/README.md"`
- Now the file should be copied into the home directory of all the connected servers, you can check this by doing the following command:
- `ansible all -a "ls"`
- Which should list the local storage of each connected node

## Installing Ansible on Windows

- Ansible does not support Windows. However, Windows has a feature called WLS
- WLS stands for Windows Linux Subsystem - It replicates a linux environment within windows and allows you to use many linux tools
- To turn on WLS, go into your windows search bar, and search 'Turn Windows features on or off', and press enter.
- From there on, scroll down until you see "Windows Linux Subsystem" and tick that checkbox.
- Next, launch the microsoft store (from the search bar) and search 'Ubuntu' within the store. It should be free - click on 'Get' to install the latest version.
  - If you do not have microsoft store enabled, Ubuntu can be installed via PowerShell instead. Enter the following commands sequentially to install Ubuntu on WLS:

    ````
    cd c:\
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
    Add-AppxPackage Ubuntu.appx
    ````
    And then use windows search to search 'Ubuntu'. Run the Ubuntu app you find on windows search, and follow the instructions on screen. Then, follow the instructions to install ansible on Linux above.
    
## Ansible Playbooks
- Playbooks save time
- They are YAML/YAML files that are used to implement configuration management
- They are also reusable 

### Creating a playbook:
  - file_name.yaml/yml
  - Starts with 3 dashes
  - Use spaces for indentation
  - Check logs by using `gather_facts: yes`
  - To get admin access, use `become: true`

  ```yaml
  # YAML/YML file to create a playbook to configure nginx in our web server 
---
# starts with 3 dashes

# add the name of the host/instace/vm
-  hosts: web

# collect logs or gather facts
   gather_facts: yes

# we need admin access to install anything
   become: true

# add instructions - install nginx - within the web server
   tasks:
   -  name: Installing nginx for our app server
      apt: pkg=nginx state=present
# be mindful of indentation
```
<br>

### Next, we will make a yml file to move the app folder into the web server, install all the dependencies required and then install and run the application:
```yaml
---

-  hosts: web
   gather_facts: yes
   become: true
   tasks:
   -  name: moving app folder in
      synchronize:
        src: /home/vagrant/app
        dest: ~/
   -  name: load a specific version of nodejs
      shell: curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

   -  name: install the required packages
      apt:
        pkg:
          - nginx
          - nodejs
          - npm
        update_cache: yes
   -  name: nginx configuration for reverse proxy
      synchronize:
        src: /home/vagrant/app/default
        dest: /etc/nginx/sites-available/default
        
   -  name: nginx restart
      service: name=nginx state=restarted
   -  name: nginx enable
      service: name=nginx enabled=yes
  
   -  name: install and run the app
      shell:
         cd app; npm install; screen -d -m npm start
```

## Migrating Ansible to Cloud (Python))

- To migrate ansible onto cloud, we need to create a .yml file that is able to launch new ec2 instances
- Also needs SSH permission and secret-key + access-key to gain access to AWS
- Following commands will show exactly how to set up an ansible vault password to ensure security with your secret and access key 
- Will also install all the dependencies required for launching and configuring the EC2 instances:
- `sudo apt-get update -y && sudo apt-get upgrade -y`
- `sudo apt install software-properties-common -y`
- `sudo add-apt-repository ppa:deadsnakes/ppa`
- `sudo apt install python3.10 -y`
- `sudo su`
- `update-alternatives --install /usr/bin/python python /usr/bin/python3 1`
- `python --version`
- `exit`
- `sudo apt-get install python3-pip -y`
- `sudo pip3 install awscli`
- `sudo pip3 install boto3`
- `sudo pip3 install boto`
- `sudo apt-add-repository ppa:ansible/ansible`
- `sudo apt-get install ansible -y`
- `cd /etc/ansible`
- `sudo mkdir group_vars`
- `sudo mkdir group_vars/all`
- `cd group_vars/all`
- `sudo apt-get update -y`
- `sudo apt install openjdk-8-jre -y`
- `wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -`
- `sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`
- `sudo apt-get update -y`
- `sudo apt-get install jenkins -y`
- `sudo systemctl start jenkins`
- Go to the site (port 8080)
- `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
- `sudo ansible-vault create pass.yml (aws_access_key: aws_secret_key:)`
- `sudo chown jenkins:jenkins pass.yml`
- `sudo ansible-galaxy collection install amazon.aws`
- `ssh-keygen -t rsa -b 4096`

From localhost (move app folder in):
`scp -i "~/.ssh/eng103a_zilamo.pem" -r app/ ubuntu@34.245.175.25:~/`
`scp -i "~/.ssh/keyname.pem" -r app/ ubuntu@ipaddress:~`

Commands I will use to launch the ec2 creation .yml playbook files:<br>
`sudo ansible-playbook launchapp.yml --ask-vault-pass --tags create_ec2 --tags=ec2-create -e "ansible_python_interpreter=/usr/bin/python3"`

Command I will use to configure the ec2 instances with .yml playbook files:<br>
`sudo ansible-playbook provisiondb.yml --ask-vault-pass`

How the hosts file will look:

```yaml
[local]
localhost ansible_python_interpreter=/usr/bin/python3

[awsapp]
54.154.172.13 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa

[awsdb]
54.220.140.176 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/zilamo_db
```

Command I will use to ping all the servers to make sure they're running and can be accessed:<br>
`sudo ansible awsapp,awsdb -m ping --ask-vault-pass`

## Installing Terraform

First we install choco: <br>
- Launch powershell with administrator rights:
`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`

Next we install terraform: <br>
`choco install terraform` <br>
Next, we restart the powershell instance to refresh the environment variables. We can use Terraform now.


installing docker (hyperv backend): https://docs.docker.com/desktop/windows/install/#wsl-2-backend

`docker run hello-world`
`docker login` <-- won't work, "non tty device"
`winpty docker login`
`docker run -p 2368:2368 ghost`
if port is in exclusion range: `net stop winnat`
To run in detached mode:
`docker run -d -p 2368:2368 ghost`
`docker ps`
`docker stop containerid`
`docker start containerid`
`docker rm containerid -f`
`docker run -d -p 80:80 nginx`
`docker rm nginx -f`
`docker run -d -p 80:2368 ghost`
`docker run -d -p 4000:4000 docs/docker.github.io`
Port mapping: left port is the one the container is mapped to on the server, right port is the 