#!/usr/bin/env bash

# reference: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

key_type="ed25519"

ssh-keygen -t $key_type -C "santiago.mok@gmail.com"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add the SSH private key to the ssh-agent and store your passphrase in the keychain (-K arg).
# ~/.ssh/config contains:
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_ed25519
ssh-add -K ~/.ssh/id_${key_type}

# Copy the SSH public key
pbcopy < ~/.ssh/id_${key_type}.pub

