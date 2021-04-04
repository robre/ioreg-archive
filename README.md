# Archive of ioreg outputs
What's running on Apple Devices? A directory archiving ioreg outputs on various Apple devices for research purposes.

## Contribute
to contribute to this collection, first check if an ioreg output file for your device type and ios version already exists, and if not continue by running the command below, renaming the file accordingly, and creating a pull request.
Before running the command, please make sure your device is in a default usage state: If possible, no hardware attached, not in airplane mode, etc.

### Command to run
To create such an output file, please run the following command on the device:
```
ioreg -i -w 0 | grep '+-o' | sed 's/, id.*//g' | sed 's/ <class /class: /g' | tee ioreg-DEVICETYPE-OSVER.txt
```
the output will be saved as `ioreg-DEVICETYPE-OSVER.txt`. Please rename the file as per our Naming Convention (substituting the DEVICETYPE and OSVER placeholders), and add it to this repository!

### Naming Convention
- Mobile devices: use https://gist.github.com/adamawolf/3048717 to determine the device code. 
- Desktop devices: find the model identifier as explained in https://support.apple.com/en-us/HT201581

then the name will be constructed as follows:
`ioreg-devicetype-iosversion.txt`
for an iPhone 11 on ios 14.4.2 the name would therefore be `ioreg-iPhone12,1-14.4.2.txt`

