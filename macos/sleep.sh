# Useful to prevent Macbooks to go to sleep when closing the lid instead of running tools that requires a Kernel Extension (e.g. InsomniaX) and more

# Before doing anything, save your current configuration using
pmset -g

# To disable sleep
sudo pmset -a sleep 0; sudo pmset -a hibernatemode 0; sudo pmset -a disablesleep 1;

# And to go back to normal
# sudo pmset -a sleep 1; sudo pmset -a hibernatemode [original hibernatemode value]; sudo pmset -a disablesleep 0;
