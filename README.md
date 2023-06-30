# Locker
A simple application which locks the screen using i3lock with lock/unlock [hooks](#hooks).


## Requirements
* `feh`  
  Used to fetch the current wallpaper
* `i3lock`  
  Used as the locker
* `imagemagick`  
  Used to convert the image in to a pixelated version of the background.

## Hooks
The user defined hooks are located under `~/.config/locker.d`.  
The hooks are run in a [lexicographical order](https://en.wikipedia.org/wiki/Lexicographic_order).


### `example-hook.sh`
When the locker is started it will create an `example-hook.sh` and place in the `locker.d` directory.  
It will be regenerated whenever it is not found, but never executed.  
This file can be used to build upon by adding commands to run `on_lock` / `on_unlock`, then renaming it.  

The example-hook.sh file looks like the following.
```bash
#!/bin/bash

on_lock() {
    # Commands to run when locking
}

on_unlock() {
    # Commands to run when unlocking
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && on_$1
```


### Example Hooks
Coming Soon<sup>TM</sup>
