# yaml-tomato.el

The simple tool to copy or show the yaml path currently under cursor

## Naming

My initial thought was to name it `yaml-automation` but `yaml-tomato` reads and looks better

### Installation

I would like to put it on Melpa soon. For now you need to dump `yaml-tomato.el` into your load path somewhere. `init.el` might be a good starting point.

## Functions

**yaml-tomato** provides two functions you could use while working with yaml file:

`yaml-tomato/show-current-path` displays current yaml path under cursor in message box

`yaml-tomato/copy` copies the current yaml path under cursor to kill-ring and clipboard

### Pitfals

The multiline values in yaml file might sometimes cause some problems to `yaml-tomato` especialy when there are plenty of whitespaces in the beginning of the line. "Normal" multiline values shouldn't cause problems.
