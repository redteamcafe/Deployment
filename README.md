# Deployment

This is a script I run to setup virtual machines in my home environment. I wrote this to automate the task and save myself the time.

You can run the script by downloading the git repository locally with git

`git clone https://github.com/bobafett2010/Deployment.git`

Then you need to change all of the shell files to be executable

`sudo chmod +x *.sh`

Then run the deployment script

`./deploy`

or you can use bash to automatically complete these steps

`bash -c "$(curl -fsSL https://raw.githubusercontent.com/redteamcafe/Deployment/main/download.sh)"`
