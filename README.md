# sc-task

#### OS used
PopOS 22.04 (Ubuntu)

## VirtualBox setup
```bash
sudo apt update
sudo apt install virtualbox
```

## Vagrant setup
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

### Initialize the Vagrant project
```bash
vagrant init
```

### Configure the Vagrant file
```ruby
vim Vagrantfile
```

### Running Vagrant
From the root of the repository run the following command
to provision and configure the Ubuntu-22.04 machine.

```bash
vagrant up
```

You might be promted to select a network interface when running
the command above.

## Applications

[Fetcher](./fetcher/README.md)

[Quoter](./quoter/README.md)

> Note: Mozda nije trebalo ali sam dodao da se quotes pisu u $HOME/quotes.txt
file na VM-u, da ne bih talozio zaustavljene container-e.
