# xvfb

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with xvfb](#setup)
    * [What xvfb affects](#what-xvfb-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xvfb](#beginning-with-xvfb)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module installs the Xvfb package, the X11 virtual frame buffer. It creates a service 
running a xvfb display on :0 using a unix socket with no authentication.

Edit the config file if you need to change the startup options for Xvfb.

## Setup

### What xvfb affects

* Installs a systemd service named xvfb
* Defaults are managed via the xvfb config file.

### Setup Requirements

* Extra Packages for Enterprise Linux (EPEL) repository required to install package on CentOS.
* Systemd required for service configuration

### Beginning with xvfb

```include ::xvfb```

## Usage

Edit the config file, `xvfb`, if you need to run the display on a different number.

## Reference

man Xvfb

## Limitations

Unknown

## Development

Submit merge requests.

## Release Notes/Contributors/Etc.

Initial release.
