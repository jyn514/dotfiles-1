# My Dotfiles & Provisioning Scripts

<!-- vim-markdown-toc GFM -->
* [How to Use It](#how-to-use-it)
	* [Requirements](#requirements)
* [General Documentation](#general-documentation)
	* [`provision-user.sh`](#provision-usersh)
		* [Overlay](#overlay)
		* [Third-Party Software](#third-party-software)
		* [Platform-Specific Configuration](#platform-specific-configuration)

<!-- vim-markdown-toc -->

This repository contains my dotfiles, a number of scripts which I find useful,
and some scripts to provision machines to my liking.

**ATTENTION**: Some of these scripts may delete your stuff without asking. You
should read them before running on a system you care about. I have carefully
written these to avoid borking my particular systems, but I make no guarantees
about yours.

## How to Use It

There are two main scripts that do the heavy lifting:

`provision-user.sh` - sets up my user account with all the configurations and
scripts that I like to have available. Does not do anything that writes outside
of `$HOME` and `/tmp`, or which requires root access.

`provision-system.sh` - sets up the whole system the way I like it. Different
behaviors are defined on a per-platform basis. This script requires root
access.

### Requirements

Both scripts are aggressively defensive, and shouldn't run at all on
unsupported systems. In general, the common UNIX utilities readily found on
contemporary UNIX systems are all that is required.

## General Documentation

### `provision-user.sh`

#### Overlay

The *overlay* directory is the bread and butter of the user provisioning script
It can be found in `provision/overlay`.

For every file in this directory:

* If a corresponding file or symlink exists in `$HOME`, it is deleted.
* The corresponding parent directory in `$HOME` where the file would go is
  deleted if it exists.
* The file is symbolically linked into the appropriate location in `$HOME`

The overlay system does not symlink directories to handle cases such as
`$HOME/bin` where it is conceivable that overlay scripts, and scripts from
other locations might be mixed - deleting `$HOME/bin` and symlinking the
overlay version would make this impossible.

The end result is somewhat similar to GNU stow, but requires no dependencies.

#### Third-Party Software

A number of scripts and utilities are installed as part of the un-privileged
provisioning process. They are located in the `3rdparty/` directory. These
software packackages are installed by simply iterating over
`3rdparty/*.include` and running each such script in sequence. These `.include`
files are written by me and are part of this repo. Pretty much everything else
in this directory is arbitrary code written by other people, structured in
arbitrary ways.

The `3rdparty` directory contains a number of git submodules, so be sure
to clone this repository with `--recursive`.

#### Platform-Specific Configuration

Platform specific configuration is handled by using platform-specific code in
`provison-user.sh` to figure out which platform we are running on, then doing
something specific based on that information. The usual convention is to run
`provision/platformname/provision-user.platformname.include`.
