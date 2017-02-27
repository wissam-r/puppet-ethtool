# ethtool

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with ethtool](#setup)
    * [Beginning with ethtool](#beginning-with-ethtool)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

This is a puppet module that install and give the ability to change the ring value of the interfaces on the server.

## Setup

### Beginning with ethtool

`include '::ethtool'` is enough to get you up and running. To pass in parameters specifying which the value of the ring for interface:

	class { ethtool: }

	ethtool::set_ring { 'eth0':
	  interface => 'eth0',
	  rx        => 2048,
	  tx        => 2048,
	}

## Usage

There are tow new facters that this module count on:

1. `real_interfaces`: it return array of interfaces that have mac address
2. `interfaces_buffers`: it's count on real_interfaces facter and it get the maximum and the current ring value for each real interface

The most usage for this module is to set all rings values for all real interfaces to maximum

	each ($::real_interfaces) |$interface| {
	  ethtool::set_ring { $interface:
	    interface => $interface,
	    rx        => $::interfaces_buffers[$interface]['RX']['max_buffer'],
	    tx        => $::interfaces_buffers[$interface]['TX']['max_buffer'],
	  }
	}

## Reference

### Classes

#### Public classes

	ethtool: Main class, includes all other classes.

#### Private classes

	ethtool::params: Handles the parameters
	ethtool::install: Handles the packages

#### Public defines

	ethtool::set_ring: change the value of the current ring for interface 

## Limitations

This module is still inder development and only provide one feture wich is changing the ring value of the interface
