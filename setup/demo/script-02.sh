#!/usr/bin/bash


# Improve readability of output
echo "========================================================================================="
echo "===>"
echo "===> Running $0"
echo "===> Add second storage pool to filesystem fs1"
echo "===>"
echo "========================================================================================="

# Print commands and their arguments as they are executed
set -x

# Exit script immediately, if one of the commands returns error code
set -e


# Show storage pools of filesystem fs1
echo "===> Show storage pools of filesystem fs1"
mmlspool fs1

# Add NSDs to new capacity storage pool
echo "===> Add NSDs to new capacity storage pool"
sudo mmadddisk fs1 -F /vagrant/files/spectrumscale/stanza-fs1-capacity

# Show the local mount status on the current node
echo "===> Show the local mount status on the current node"
mount | grep /ibm/

# Show content of all Spectrum Scale filesystems
echo "===> Show content of all Spectrum Scale filesystems"
find /ibm/

# Show usage of filesystem fs1
echo "===> Show usage of filesystem fs1"
mmdf fs1

# Show storage pools of filesystem fs1
echo "===> Show storage pools of filesystem fs1"
mmlspool fs1


# Exit successfully
echo "===> Script completed successfully!"
exit 0
