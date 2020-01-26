# Creating and Enabling a Static Swapfile
#### Tip: There is no reason you can't have both a swap partition and a swapfile. This is an easy way to add more swap without repartitioning


First create and intialize the file to hold the swap. For example, to create a 4GB swapfile, you could use the command:
```
sudo fallocate -l 16G /swapfile
sudo mkswap /swapfile
```

Set the appropriate permissions on the file. It should be readable and writable only by root. This can be done with the command:
```
sudo chmod u=rw,go= /swapfile
```

Next we need to enable the swapfile with the swapon command. Following our example above this could be done with:
```
sudo swapon /swapfile
```

In order to ensure that the swap is enabled at boot we can add an entry to /etc/fstab. You can add the line to ftab manually or using the command:
```
sudo bash -c "echo /swapfile none swap defaults 0 0 >> /etc/fstab"
```

Source: https://wiki.manjaro.org/index.php?title=Swap