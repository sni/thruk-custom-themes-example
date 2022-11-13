# Thruk Custom Themes

This repository contains two examples on how to create a custom theme for [Thruk](https://www.thruk.org).

Get more information about Thruk themes here: https://www.thruk.org/documentation/themes.html

## Build Requirements

  - git
  - npm
  - make
  - internet connection

## Usage

This example uses `CustomLight` template, but you can replace the commands with
`CustomDark` if you want to build a theme based on the Dark theme. Replace
`MyTheme` with the name of your theme.

  - `%> cd themes`
  - `%> cp -rp CustomLight MyTheme` # or use `CustomDark` if your theme should be based on the Dark mode
  - `cd MyTheme`
  - `vi src/theme.css`  # adjust css to your liking
  - `ls images`         # replace images if required
  - `make`              # rebuild the theme
  - copy `dest/MyTheme/` onto your Thruk into `/etc/thruk/themes-enabled/`


## Development

During development of your theme you can run the `make watch` instead of `make`
to update the theme whenever the css file changes.

Instead of copying the dest folder, you can then symlink the `theme/MyTheme` to `/etc/thruk/themes-enabled/`.


Have a look at the `https://.../thruk/cgi-bin/themes.cgi` page to get a quick overview of available components to style.
