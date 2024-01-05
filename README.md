# sc-task

#### OS used
PopOS 22.04 (Ubuntu)

### VirtualBox setup
```bash
sudo apt update
sudo apt install virtualbox
```

### Vagrant setup
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

### Running Vagrant
From the root of the repository run the following command
to provision and configure the Ubuntu-22.04 machine.

```bash
vagrant up
```

You might be promted to select a network interface when running
the command above if you have more than one.

## Applications

By default when the above commands are executed successfully you
should get an Ubuntu VM with a fixed IP address, installed Docker engine,
configured cronjobs for both getting the JSON quote each hour on the hour 
and for outputing the latest quote as plain text in container's standard
output each hour on the 15th minute.

You can find the application documentation below.

[Fetcher](./fetcher/README.md) docs
> You can edit the default variables for the fetcher by
making changes to the following file:
`./provisioning/roles/fetcher/defaults/main.yml`

[Quoter](./quoter/README.md) docs
> You can edit the default variables for the quoter by
making changes to the following file:
`./provisioning/roles/quoter/defaults/main.yml`
