# yaml-tomato.el

[![MELPA](http://melpa.org/packages/yaml-tomato-badge.svg)](http://melpa.org/#/yaml-tomato) [![Build Status](https://travis-ci.org/RadekMolenda/yaml-tomato.svg)](https://travis-ci.org/RadekMolenda/yaml-tomato)

The simple tool to copy or show the yaml path currently under cursor

## Naming

My initial thought was to name it `yaml-automation` but `yaml-tomato` reads and looks better

### Installation

Put `yaml-tomato.el' in your Emacs load-path and add the line below to your .emacs file:

```
(require 'yaml-tomato)
```

## Functions

**yaml-tomato** provides two functions you could use while working with yaml file:

`yaml-tomato-show-current-path` displays current yaml path under cursor in message box

`yaml-tomato-copy` copies the current yaml path under cursor to kill-ring and clipboard

## Testing
You will need to have [cask](https://github.com/cask/cask) installed to run tests. Once it is installed:

```
git clone git@github.com:RadekMolenda/yaml-tomato.git
cd yaml-tomato

# install dependencies
cask

# run unit tests
cask exec ert-runner

# run integration tests
cask exec ecukes
```
### Pitfals

The multiline values in yaml file might sometimes cause some problems to `yaml-tomato` especialy when there are plenty of whitespaces in the beginning of the line. "Normal" multiline values shouldn't cause problems.
