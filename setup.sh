#!/usr/bin/env bash

set -ex

if which brew > /dev/null; then
    echo "Homebrew already installed"
    echo
else
    echo "Installing homebrew..."
    echo
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed"
    echo
fi
echo "Installing homebrew packages"
echo
brew bundle install
echo "Installing rtx packages"
echo
rtx install -y
rtx reshim
export PATH="$HOME/.local/share/rtx/shims:$PATH"
env | sort
if grep -q 'rtx activate' ~/.bashrc; then
    echo "rtx activate already in .bashrc"
    echo
else
    echo "Adding rtx activate to .bashrc"
    echo
    # shellcheck disable=SC2016
    echo 'eval "$(rtx activate bash)"' >> ~/.bashrc
fi
# shellcheck disable=SC2016
if grep -q 'rtx/shims:$PATH'; then
    echo "rtx/shims already added to path"
    echo
else
    echo "Adding rtx/shims to path"
    echo
    # shellcheck disable=SC2016
    echo 'export PATH="$HOME/.local/share/rtx/shims:$PATH"' >> ~/.bashrc
fi
XCODE_VERSION='14.3.1'
if xcodes installed | grep "$XCODE_VERSION" > /dev/null; then
    echo "Xcode $XCODE_VERSION already installed"
    echo
else
    echo "Installing Xcode $XCODE_VERSION"
    echo
    xcodes install "$XCODE_VERSION"
    sudo xcode-select --switch "/Applications/Xcode-$$XCODE_VERSION.app"
fi

