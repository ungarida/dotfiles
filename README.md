# Dotfiles repository
This is my personal repository to be able to bootstrap a fresh installation of Manjaro Openbox with all my preferences.

## Configs
There a bunch of cofig files in order to customize various applications. Main changes are about look and feel using the following colors:

* Black Pearl #050526

### LXDM
[LXDM](https://wiki.archlinux.org/index.php/LXDM) is a lightweight display manager used in the login page.

## Packages installed
It installs only open source software, I need some basic web development applications:

* [Chromium](https://github.com/chromium/chromium)
* [Visual Studio Code - Open Source ("Code - OSS")](https://github.com/microsoft/vscode)

### Fonts
Several fonts:

* [Fira](https://github.com/mozilla/Fira)
* [Hermit](https://github.com/pcaro90/hermit)

### Terminal
And `zsh` configuration framework:

* [Zim](https://github.com/zimfw/zimfw)

## Run
To run this ansible playbook use the `boostrap` script:

```
➜ ./bootstrap.sh
```