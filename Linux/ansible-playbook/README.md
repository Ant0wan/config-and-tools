<br />
<p align="center">
  <a href="https://github.com/Ant0wan/config-script">
    <img src="logo.png" alt="Logo" width="90" height="80">
  </a>

  <h1 align="center">Config</h1>

  <p align="center">
     Configure environment from yaml file.
    <br />
    <a href="https://github.com/Ant0wan/config-script/issues">Report Bug or Request Feature</a>
  </p>
</p>



## Table of Contents

* [About the Project](#about-the-project)
* [Installation](#installation)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Acknowledgements](#acknowledgements)



## About The Project

Aims at quickly configuring fresh RHEL of Debian install with needed tools.



## Installation

  1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

     1. Upgrade Pip: `sudo pip3 install --upgrade pip`
     2. Install Ansible: `pip3 install ansible`

  2. Clone or download this repository to your local drive.
  3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  4. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your user account password when prompted for the 'BECOME' password.

or run `execute.sh`

You can install this via the command-line with either `curl` or `wget`.

#### via curl

```shell
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Ant0wan/config/master/execute.sh)"
```

#### via wget

```shell
bash -c "$(wget https://raw.githubusercontent.com/Ant0wan/config/master/execute.sh -O -)"
```


## Getting Started

Before executing the playbook, your preferences need to be set in `default.config.yaml` file.

### Prerequisites

Only Bash > 4.4.

Ansible >= 2.0.

Python >= 3.8.



## Usage

After cloning repository, edit `default.config.yaml` depending on your needs.

Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
then, run `ansible-playbook main.yml -i inventory --ask-become-pass` inside this directory. Enter your user account password when prompted for the 'BECOME' password.

Done !



## Roadmap

See the [open issues](https://github.com/Ant0wan/config/issues) for a list of proposed features (and known issues).



## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



## License

No License



## Acknowledgements

Thanks to [geerlingguy](https://github.com/geerlingguy/mac-dev-playbook/) who gave me the idea.
