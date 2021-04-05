# Archive of ioreg outputs
What's running on Apple Devices? A directory archiving ioreg outputs on various Apple devices for research purposes.

## Contribute
To contribute to this collection, first check if an ioreg output file for your device type and ios version already exists, and if not continue by running the command below, renaming the file accordingly, and creating a pull request.
Before running the command, please make sure your device is in a default usage state: If possible, no hardware attached, not in airplane mode, etc.

### Command to run
To create such an output file, please run the following command on the device:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robre/ioreg-archive/master/archiver.sh)"
```
The script will automatically generate the correct filename.
Alternatively you can do it manually:

```
ioreg -i -w 0 | grep '+-o' | sed 's/, id.*//g' | sed 's/ <class /class: /g' | tee ioreg-DEVICETYPE-OSVER.txt
```
the output will be saved as `ioreg-DEVICETYPE-OSVER.txt`. Please rename the file as per our Naming Convention (substituting the DEVICETYPE and OSVER placeholders), and add it to this repository!

### Naming Convention
- Mobile devices: use https://gist.github.com/adamawolf/3048717 to determine the device code. 
- Desktop devices: find the model identifier as explained in https://support.apple.com/en-us/HT201581
- (Alternative resource: https://www.theiphonewiki.com/wiki/Models )

Then the name will be constructed as follows:
`ioreg-devicetype-iosversion.txt`
for an iPhone 11 on ios 14.4.2 the name would therefore be `ioreg-iPhone12,1-14.4.2.txt`. You may also include the "A"-Number in the name, between the devicetype and os version.

## How to use this
To use this repository, first clone it:
```
git clone https://github.com/robre/ioreg-archive.git
cd ioreg-archive/
```

##### Grep for Service Name
Find out what of what class services with a specific name are across Apple devices 
```
grep 'o wlan' ioreg*
```

##### Grep for a Class Name
Find out on which Apple devices a service of a specific class is loaded
```
grep ':IOPlatformExpertDevice' ioreg*
```

##### Diff Devices
Whats the difference between two device versions? Or between two OS versions?
```
diff ioreg-A.txt ioreg-B.txt
```

