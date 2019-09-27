# deployment of todo-grpc

## requirements
- Git
- Vangrant

## Steps

### 1. 

```bash
# clone this deployment
git clone https://github.com/hieuvecto/todo-grpc-deployment.git

# cd to the deployment directory
cd todo-grpc-deployment
```

### 2. In its directory, run the following commands:

```bash
# Clone todo-grpc and alias it
git clone https://github.com/hieuvecto/todo-grpc.git app

# Create vagrant boxes (ci, client, grpc-server)
vagrant up

# After vagrant boxes created, ssh into ci box
vagrant ssh ci

# cd into ansible provision
cd ansible-playbook

# Provisioning to install packages in client and grpc server 
ansible-playbook -i hosts.local provision.yml --become

# Deploy both client and grpc server
ansible-playbook -i hosts.local deploy.yml --become

```

### 3. Wait until all of the containers are ready (around 2 minutes for building go codes, 1 minute for initting mysql) 

navigate 192.168.33.26:8080 to see the web app (client)

### 4. If one of the containers was down, you could re-deploy them

```bash
# Deploy both client and grpc server
ansible-playbook -i hosts.local deploy.yml --become
```