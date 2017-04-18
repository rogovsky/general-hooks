[license]: /LICENSE
[license-image]: https://img.shields.io/github/license/petervanderdoes/general-hooks.svg?style=flat-square
[license-url]: /LICENSE
# General development git hooks
[![license][license-image]][license-url]
![GitHub release](https://img.shields.io/github/release/petervanderdoes/general-hooks.svg?style=flat-square)

This is a collection of git hooks to be used in conjunction with git-flow AVH
edition.

It also has some standard git hooks that were originally created by [Sitebase](https://github.com/Sitebase/git-hooks).
I just adjusted their code to make it work for me.

These hooks are used by me for development in general.

## Installation
* Clone the repository
* Install using `make`, by default the software will be installed
in `/opt/general-hooks`.
* Copy or link the /opt/general-hooks to .git/hooks directory in your git repository
* Copy the file hooks_config.sample to the .git directory, naming it hooks_config.
* Modify the hooks_config file as needed.

## Requirements
* git-flow AVH edition
* A changelog file as described below.
* Bash shell script.
* Use the [Semantic Versioning 2.0.0](http://semver.org/) specification.

## Information

* When you start a release you can omit the version number. The filter will grep
  the version set in the stable info of the master branch and increase the patch level.
* You can't commit on a master branch.
* You can't commit files with merge markers.
* Commit messages shorter than 8 are not allowed.

## hooks_config file
This file has the function for updating the version number in your project.

* If you keep track of your version somewhere else than the changelog file, you need to add the changing of the version to the `_update_version` function.
* There is no need to change the version for the production tag in this file. This
  will be taking care of when you finish a release or hotfix.

## Changelog file
You can change the name of the changelog in the hooks_config file, default it
looks for CHANGELOG.md

The changelog file set up is as follows
```
# Changelog

### 0.0.0
* Start of the changelog
```

After you added another version you can edit or remove the 0.0.0 entry

## Pre Commit modules

There are several pre commit modules included which you can activate by adding them to the variable `PRE_COMMIT_MODULES` in the `hooks_config` file.

Included modules:
- prevent-master-commit.sh  
Prevent committing on master branch.
- prevent-merge-marker-commits.sh  
Prevent committing files containing merge markers.
