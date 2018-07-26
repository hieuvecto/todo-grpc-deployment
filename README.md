# deploy-mock-project

## requirements
- Git
- Vangrant

## Steps

1. clone this project
2. In the project directory, run the following commands:

```bash
# Clone mock-project and alias it
git clone https://github.com/hieuvecto/MockProject.git app

# Create vagrant boxes (ci, apps, db)
vagrant up

# After vagrant boxes created, ssh into ci box
vagrant ssh ci

# Run ansible provision
cd ansible-playbook

# Install ansible roles
ansible-galaxy install -r requirements.yml

# Provisioning to install package in apps and db boxes
ansible-playbook provision.yml

# Init apps in apps box
ansible-playbook init_apps.yml

# Init database in db box
ansible-playbook init_database.yml

# Exit ci box
exit
```

3. Insert the following lines into /etc/hosts file to support social authentication (optional)

```
192.168.33.26 app-frontend.com
192.168.33.26 app-backend.com
```
4. That's it. Navigate the following urls to see my mock project

```
# If you skipped step 3
https://192.168.33.26

# If you did step 3
https://app-frontend.com