# AnsibleMyEC2


### Automate your EC2 instances with clean/simple Ansible:

### Create, Setup, Deploy, Operate: Containerized Full Stack Apps.

### Perfect for teams to run a dev environment for containerized apps.

### Academically straightforwad implementation of Ansible - Great for learning!
----

## Overview

Ansible running locally in a Python virtual environment, set up in the simplest and cleanest possible way to empower developers who use AWS EC2 instances for straightforward, containerized full stack deployments.

I develop The Nucleus Stack, full stack starter kit and complete application stack with modular component/enhancement stacks.

This is the Ansible set up I use to work with a handful of t2.micro to t2.medium instances to run different projects and different configurations of Nucleus and variants .. or anything at all I need to run.

Docker and Docker Compose are installed on Amazon Linux. The Linux environment is very nicely configured. Your VM is ready for development or single instance production hosting.

I'll keep this project simple. I have another project for a containerized Ansible stack which can be used in the same small team development context, or for enterprise DevOps deployment.

----

## Pyenv

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
TODO: Write these instructions properly. For now, here is the quick summary:

Now at this point your Pyenv Virtual Environment will be automatically activated any time your shell session or the executing context is "inside" the project, anywhere underneath the parent .python-version file. See how that works? Absolutely elegant, isn't it. Pyenv is so great. (This is not a paid endorsement lol! It is open source!)

You just type "python" and you get the correct Python!

You just type "pip" and you get the right Pip!

(No need to over-complicate things with stuff like "pip3" or "python3". Those days are past us IMHO.)

    pip install --upgrade pip

    pip install --upgrade setuptools

    pip install --upgrade wheel

    pip install -r requirements.txt


----

That is pretty much it for project and environment setup. There are now some steps to configure keys here in the project and on each of your EC2 hosts you want to manage. Super simple classic SSH stuff with id_rsa.pub, authorized_keys etc. We'll simply add the pub key from the local project side to the authorized_keys of each managed node and then configure the host addresses and username (ec2-user probably) for all your targets and then we can start running playbooks. Oh! Let's not forget about the AWS CLI credentials.

TODO: Continue the missing instructions here. We're almost there!

----



