# archiveplus

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with archiveplus](#setup)
    * [What archiveplus affects](#what-archiveplus-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with archiveplus](#beginning-with-archiveplus)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module has been built to manage installation of applications from external
sources at AON. Primarily, the external source will be Artifactory. This
module handles cases where the application is stored in a format that 
cannot be handled by the `package` resource type. 

This module leverages the [archive module](https://github.com/voxpupuli/puppet-archive).
It is intended to replace the existing `decompress` module that was written 
internally for AON.

## Requirements 

This module should only need to be included in your Puppet Master's modulepath,
after which point the `archiveplus` defined type will be available for use
elsewhere in Puppet code. 

## Usage

Most of the parameters that can be passed into archiveplus have a one-to-one
relationship with the archive module. The extra functionality that archiveplus
provides (at this point) is the ability to pass an arbitrary command to an
exec on Windows nodes, which will install the application and clean up after
itself. 

## Limitations

Supports RedHat Linux derivatives, including CentOS 6, CentOS 7, RHEL 6, 
and RHEL 7.

## Reference

archiveplus

