# AnsibleMyEC2


### Automate your EC2 instances with clean/simple Ansible.

### Create, setup, deploy and operate containerized full stack apps.

### Create, setup, deploy and operate containerized full stack apps.

#### *NEW: Network Device Automation (will soon be moved into a new project):*

AnsibleMyEC2 will stay simple and focused on EC2. The new  playbooks I am adding for automating Networking  devices will be moved to a new project after I use that work to further improve AnsibleMyEC2 and leverage and develop the design patterns here, to benefit both projects.

Goals for the new Network Device Automation playbooks: Manage firewall rules for rapid/frequent response to threat activity. Control Load Balancer configuration for blue/green software deployment. Enable general automation of Cisco IOS devices and those of the most popular vendors. The name and scope of the resulting project is still being planned.

----

## Overview

Ansible running locally in a Python virtual environment, set up in the simplest and cleanest possible way to empower developers who use AWS EC2 instances for straightforward, containerized full stack deployments.

I develop The Nucleus Stack, a full stack starter kit and complete application stack with modular enhancement stacks like REST vs GraphQL backends and many more future stack module plans in areas like Big Data and ML.

This is the Ansible set up I use to work with a handful of t2.micro to t2.medium instances to run different projects and different configurations of Nucleus and variants .. or anything at all I need to run.

Docker and Docker Compose are installed on Amazon Linux. The Linux environment is very nicely configured. Your VM is ready for development or single instance production hosting.

I'll keep this project simple. I have another project for a containerized Ansible stack which can be used in the same small team development context, or for enterprise DevOps deployment.

----

## Project Setup and Dependency Installation

### Pyenv, Pyenv Virtualenv, Python and Required Modules

I enthusiastically promote the use of Pyenv for complete, flawless management of multiple Python versions and your perfectly-version-matched Python Virtual Environments.

I've used all strategies and this is the best way. Having said that, you can easily adapt the related instructions to use your favorite Python environment strategy.

The project includes the Pyenv .python-version file for the virtual environment that will be named "ve.ansimy". (People with fancy git-enabled ZSH prompts like short VE names.)

----
Install Pyenv if you don't already have it. If you are on macOS, use HomeBrew:

    brew install pyenv

Install Pyenv Virtualenv

    brew install pyenv-virtualenv

See what Python versions are currently available for Pyenv to install. I love that Pyenv builds from the official Python source code! For this reason, the latest Pyenv version available usually lags behind other sources by a week or two. No big deal. The list is long and will go flying by. The numbers you want to look for are actually at the beginning, so scroll up. Look for the plain numbers by themselves: 3.11.1, 3.11.2 etc. Those are the main Python source versions that everything else in the world is based upon. Cool! Show the list:

    pyenv install --list

After you have Pyenv installed and selected your desired version (the latest one), install the latest official Python 3. For me at the time of writing, this is 3.11.2, but the actual version is not important for this project. Use the latest.

    IMPORTANT! - Your mac might need a few installs and minor adjustments to allow compilation of C code. Hey, you are a serious dev, you can handle it. I'll put links or add the instructions here. You probably already have this set up. It usually involves little more than installing XCode command-line tools and maybe one other brew package.

    pyenv install 3.11.2

Create the virtual environment with the required name. This name will match the value in the .python-version file included in this project.

    pyenv virtualenv 3.11.2 ve.ansimy

----

Now at this point your Pyenv Virtual Environment will be automatically activated any time your shell session or the executing context is "inside" the project, anywhere underneath the parent .python-version file. See how that works? Absolutely elegant, isn't it. Pyenv is so great. (This is not a paid endorsement lol! It is open source!)

You just type "python" and you get the correct Python!

You just type "pip" and you get the right Pip!

(No need to over-complicate things with stuff like "pip3" or "python3". Those days are past us IMHO.)

    pip install --upgrade pip

    pip install --upgrade setuptools

    pip install --upgrade wheel

    pip install -r requirements.txt


----


## Authentication Configuration for SSH and AWS CLI


### How to configure the all-important ssh  key

You will either be using the private key (.pem file) from your AWS account's main key pair or another AWS key pair
in your AWS account which you specify when creating resources like EC2 instances, OR .. you will be using a local
public key which you generated yourself.

In this second case, such local keys will have to have been installed on
each managed node manually. Only AWS account keys, usually your main/default key, can be automatically installed on a
potential managed node EC2 instance ahead of time (at the time of instance creation); hence why it is the
preferred method. See below for details.


----


### A. Preferred Key Strategy - AWS Main Key Pair - Private Key (.pem file)

The below path for 'ansible_ssh_private_key_file' shows an example placeholder key, illustrating how to use the
secrets directory in this project. The /secrets/ directory prevents all contents from being added to a git
repository, thanks to the project .gitignore file.

A private key from your AWS account, possibly your main private key (.pem file) from your main AWS account Key Pair,
is a preferred key to use, because when you create resources like EC2 instances, only a private key from your
AWS account can be assigned to work out of the box for Ansible authentication. Any other key will require
additional manual steps. This is the simplest scenario to enable authentication to new managed nodes.

#### *Notice that the variable name is unique to this strategy:* (ansible_ssh_private_key_file)

     ansible_ssh_private_key_file = secrets/aws_account_main_key_pair_private_key.pem


----


### B. Alternate Key Strategy - Locally-Generated, Manually-Installed Public Key (.pub file)

The below path for 'private_key_file' shows an example placeholder key, illustrating how to use the secrets
directory in this project. The /secrets/ directory will prevent all contents from being added to a git repository,
thanks to the project .gitignore file.
This might be the public key you generated yourself locally, using the ssk-keygen command. In this scenario, you
would copy this locally-generated public key from it's default location at ~/.ssh/id_rsa.pub (or similar) to a
descriptive pathname, living inside the /secrets/ directory.

NOTE: This key will work on your EC2 hosts exactly like the default AWS account key pair private key. HOWEVER, you
will have to ssh into the host manually (or use some other automation) and ADD this locally-generated key to
the EC2's ec2-user authorized_keys file, usually located at ~/.ssh/authorized_keys

#### *Notice that the variable name is different for this approach and the variation below:* (private_key_file)

     private_key_file = secrets/ssh_local_pub_key_authorized_on_managed_nodes.pub

----


#### Variation of the Alternate (local) Key Strategy

This is the same as the above strategy, just without copying the key to /secrets/ with a descriptive name.
If you also authorized your local default pub key on your managed hosts, this should work for most people on
a macOS or Linux workstation or control node, under the relevant user account:

     private_key_file = ~/.ssh/id_rsa.pub

----

## AWS CLI Authentication

Some of the playbooks in this project do not operate on managed nodes over SSH, but rather they operate on
the local (control node) installed and configured AWS CLI. An example is for the creation of an EC2
instance, which will be a new managed node.

All that is required for AnsibleMyEC2 to use your local AWS CLI is that you yourself can use it locally and
that is has been congiured as such and is working to connect to and authenticate with your AWS account.

----

