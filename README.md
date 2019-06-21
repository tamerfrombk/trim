# trim

A simple command line utility that trims each line of `stdin` and echoes the trimmed line to `stdout`. The system-standard line delimiter is used to parse new lines.

## Features
* Small executable: < 20 lines of source code and 14K executable
* Only depends on `libstdc++`
* Supports unicode and multi-line sources

## Building

`trim` uses a standard `Makefile` for building and installing. A version of `g++` supporting C++11 is required.

Navigate to the directory where you downloaded the sources and run `make`. This will build the executable named `trim` into that directory.

## Installing

To install the executable on your system, type `sudo make install`. This will place the `trim` executable in your
`/opt/bin` directory and install the man page.

**NOTE**: In order to access `trim` without using the full path `/opt/bin/trim`, you may need to add `/opt/bin` to your `PATH`.

## Uninstalling

To uninstall, simply run `sudo make uninstall`. This will remove the `trim` executable and man page from the system.

## Examples
**NOTE**: python is not a required dependency of `trim`. It is only used to generate space-padded strings for the examples.

```sh
# Remove leading spaces
> python -c "print('   leading')" | trim | xargs printf "'%s'\n"
'leading'

# Remove trailing spaces
> python -c "print('trailing   ')" | trim | xargs printf "'%s'\n"
'trailing'

# Remove leading __and__ trailing spaces
> python -c "print('   leading and trailing   ')" | trim | xargs -d '\n' printf "'%s'\n"
'leading and trailing'

# The empty string
> python -c "print('')" | trim | xargs printf "'%s'\n"
''

# Multiline example
> python -c "print('a \nb \n c')" | trim | xargs printf "'%s'\n"
'a'
'b'
'c'

# Unicode
> python3 -c "print(u'\u2713')" | trim | xargs printf "'%s'\n"
'✓'
```
