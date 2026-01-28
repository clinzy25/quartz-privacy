```table-of-contents
```
# Overview
We want to backup all of our devices and documents in case they are lost, damaged, or corrupted. We should anticipate events of this type and try to reduce their affect on our lives, making them as painless to recover from as possible.
# Threat model
Secure backups mitigate two main types of risks -
- Sensitive personal information exposure
- Data loss and the work, inconvenience, or chaos that might follow

These risks come in many flavors -
- Lost or stolen devices - even if locked with pins or biometrics, unencrypted hard drives can be removed and read
- Home invasion - burglars will seek tech devices and sensitive documents
- Natural disaster - house fires, floods etc destroy documents and devices
- Cyber attacks - any number of different types of cyber attacks could compromise insecure devices, cloud services, or connections between them
- State-level actors - rouge or fascist governments with surveillance capabilities may seek your personal information for nefarious purposes
# Threat response
All important digital devices and documents should be backed up in a 3-2-1 strategy. This means you should keep 3 copies of your data. This applies to devices and physical documents.
1. The original data
	- Devices with full disk encryption (FDE)
	- Sensitive documents stored in a safe
2. One backup stored in a safe in your home
	- Encrypted snapshots of the devices
	- Encrypted scans of original documents
3. One backup stored offsite
	- Encrypted snapshots of the devices
	- Encrypted scans of original documents
	- Ideally more than a few miles from your house
	- With a trusted party's consent or hidden

All backups will be performed by wire, without the need for cloud services. We will handle all operations ourselves without any third parties. All drives will be encrypted.
# Backups
If you are concerned about your data privacy and security, I do not recommend using cloud backup services.
- You can't verify the integrity of the connections or the physical security of the cloud servers or the good-will of the providers
- You will have recurring storage costs, as opposed to one time costs for your own drives

Computers and phones can be backed up as a snapshot, an exact replica of the machine at the time of the snapshot. This is useful if your device gets stolen, lost, or has an irreparable technical issue.
- You don't lose as much data, only the amount that was generated between the last backup and the time of incident (assuming you backup regularly).
- You can restore customization and personalization of the device. You don't have to download all the software or replicate the settings again.

All backups will be fully encrypted and created by wire, meaning if someone else ends up with your backup drive without the encryption key, the drive will be useless and the data invisible.

Along with devices and documents, there are a few other things I like to backup.
- My password vault
- Email history
- Photos from my phone

I also like to perform routine maintenance on the devices which I will describe later.

## Backup Interval
How often to backup is a matter of debate. If you generate lots of important on-device data, you might want to backup more frequently. Some insist on backing up daily. The tighter the backup interval, the more useful an automated system becomes, which most backup programs offer

I opt to manually backup onsite backups once a month, and offsite backups every 3 months, but I also do not generate much important data. Choose an interval and make a recurring event in your calendar to remind you to perform the backups.
## Equipment
Many of these options are explained in more detail later
- [ ] [1TB USB SSD](https://www.newegg.com/crucial-x9-pro-1tb-usb-3-2-gen-2/p/N82E16820156374) - For onsite backup
- [ ] [1TB MicroSD](https://www.newegg.com/team-group-1tb-microsdxc/p/N82E16820985051?item=N82E16820985051&utm_source=transactional&utm_medium=email&cm_mmc=TEMC-Delivery-Notice-USA-_-101932&utm_campaign=TEMC-Delivery-Notice-USA-_-101932) - For offsite backup
- [ ] [MicroSD adapter](https://www.newegg.com/wavlink-cr3002-2-in-1/p/0DS-00AV-00004?item=9SIA6PFJ7F4702&utm_source=transactional&utm_medium=email&cm_mmc=TEMC-Shipping-Notice-USA-_-101929&utm_campaign=TEMC-Shipping-Notice-USA-_-101929) - to plug in offsite backup
- [ ] [Covert Coin](https://www.amazon.com/Micro-Card-Covert-Coin-Compartment/dp/B00CPSUXCK?th=1&psc=1) - If you prefer to hide your offsite backup
- [ ] [A backup hardware token](https://www.token2.com/shop/category/pin-plus-series)
- [ ] [A document scanner](https://www.usa.canon.com/shop/p/imageformula-p-208ii-personal-document-scanner) - can be acquired used
- [ ] A license for [VueScan](https://www.hamrick.com/purchase-vuescan.html?Version=9.8.50&Vendor=Video&Model=Integrated%20Camera&Type=5&Network=0&Driver=vid1) scanner software
- [ ] A [safe](https://www.sentrysafe.com/product/FPW082HTC) - this is my personal recommendation but your needs may differ
- [ ] A cross-cut shredder or firepit for document disposal
## Disk Preparation
We first need to format our backup drives to ensure they are of the correct file system type, named and encrypted. These operations are for Ubuntu Linux.
- Insert the drive into computer
- Open the Ubuntu "Disks" utility
- Find your external drive -> click the cog wheel in the bottom left ->  Click Format Partition
- Type a name for the volume, I recommend naming them as their purpose (onsite, offsite)
- For Type, choose Ext4 and Password protect volume (LUKS). This will encrypt the drive
- Go to your password manager and generate a sufficiently complex password, and save it to your password manager with a descriptive name
- Go back to the Disks utility and click next, input your password and click next
- Wait for the operation to complete
- Make sure to eject drives before unplugging them

Repeat this process for the both the onsite and offsite backup drives.
## Backup Process
This is a backup process that will backup your computer, phone, passwords, and email, all in one chain because the computer its the center of the operation.
1. I use backup day as an opportunity to clean my device. I run a script which is suited for Ubuntu 24.04. An AI tool can help you modify this script for your specific operating system. It will update the system and all of the applications at once. Paste the [[Maintenance Script]] into a terminal and run it. Optionally save it and run it as `sudo ./maintenence.sh` with a .sh extension.
2. Download the [BleachBit](https://www.bleachbit.org/download/file/t?file=bleachbit_5.0.2-0_all_ubuntu2404.deb) file system cleaner for Linux. See [link](https://www.bleachbit.org/) for details
	- Open BleachBit as administrator
	- Check every box except "Free disk space"
	- Click the "Clean" Button
3. Restart computer
4. Manual maintenance
	1. Sort and clear downloads folder
	2. Empty trash
	3. Close any browsers (with the setting to Delete cookies and site data when Firefox is closed)
	4. Open Disk Usage Analyzer and look for anything unexpected
5. Misc backups - This is probably not necessary every time, but I occasionally backup a couple of other things
	1. Export Bitwarden password vault
		1. Open Bitwarden -> Settings -> Vault Options -> Export Vault
		2. Choose json, provide your password and export
		3. Save to backup drive
	2. Export Protonmail email history with [export tool ](https://proton.me/support/proton-mail-export-tool)
		1. Download the export tool
		2. `tar -xvzf proton-mail-export-cli-linux_x86_64.tar.gz`
		3. `./proton-mail-export-cli` -> Follow the prompts
		4. Save the export to the backup drive
	3. Any new scanned documents (if this is your first backup process, refer to [[Secure Backups and Documents#Documents]] at this stage).
6. Backup the computer. From the Ubuntu App Center, download Timeshift
	1. First time setup
		- Plug in the onsite drive
		- Open Timeshift app
		- Select the external drive as the snapshot location
		- Uncheck all scheduled snapshot intervals
		- Include all files from user home directories
		- Finish setup
	2. Not first time
		- Plug in the first of 2 drives
		- Open Timeshift app
		- Click Create
		- Wait for the backup to complete, there should now be a directory called "Timeshift" on your external drive.
		- Verify the backup exists with the name that includes the current date, and delete old backup if desired.
7. Backup the phone. This process is for GrapheneOS. 
	1. I take this opportunity to move all photos from my phone's gallery to the  photos directory on the onsite drive. 
		1. Copy the photos from phone to drive - `adb pull /sdcard/DCIM/Camera/. /media/conner/Backups/'Conner Photos'`
		2. Delete photos from phone - 
			1. `adb shell "rm -r /sdcard/DCIM/Camera/*"`
			2. `adb shell "rm -r /sdcard/Pictures/Screenshots/*"`
	2. If this is your first time doing this on this computer, run the [[Android Debug Bridge Setup]] script on the computer.
	3. On your phone - Go to Settings -> About Phone -> Tap the Build number button over and over until developer mode is turned on
	4. Go back to Settings -> System -> Developer Options
	5. Turn on USB Debugging
	6. Go to Bitwarden on your phone and copy your encryption key, or if you don't have one, generate one and copy it.
	7. Plug the phone into your computer with a USB cable and run `adb backup -all -system -apk -keyvalue -obb -shared -f backup.ab`
	8. Unlock your device and confirm the backup operation
	9. This will create an encrypted backup image of your phone named backup.ab in the directory where you ran this script.
	10. Rename the file as you wish and move it onto the backup drive. Delete the previous backup
	11. On your phone, unplug from the computer and go to Settings -> System -> Developer options and turn off Use developer options 
8. If you are updating offsite backup - duplicate the onsite drive to the offsite drive
	1. Plug in both the onsite and offsite drive to the same computer. Unlock both drives with encryption password.
	2. Get the mountpoints of your two drives by running `lsblk -o NAME,SIZE,LABEL,UUID,MOUNTPOINT`
	3. Double check the names of the mountpoints, the first one should be the drive with the latest backups, the second the one with the older backups
	4. Run `sudo rsync -avh --progress --delete /media/user/Onsite/ /media/user/Offsite/`
	5. Unmount both drives and remove.

## Photos
This is my highly extremely custom approach to backing up photos.
1. All photos stored on encrypted desktop computer and accessible from a Jellyfin server
2. In the process above, I updated the onsite drive with new photos and copied them to the offsite drive
3. To update the desktop computer, plug in either drive and copy the photos directory and overwrite everything
4. To keep the photos secure over the network, create a Jellyfin user specifically for photo viewing. Assign photo library permissions to only this user
5. Threat model - if the desktop computer is stolen, the pictures are on an encrypted drive. If the phone is stolen which is connected to Jellyfin, the daily driver user that we are usually logged into for music does not have access to the photo libraries

## Backup Storage
We should consider how backups are physically stored.
### Safe
- Buy a safe. If you own your home, get one that bolts to the ground. If not, get one that is relatively heavy and can fit under your bed or in a closet with the goal of making it as difficult as possible to remove.
### Original data
Your computer or phone is the original data. To ensure it is secure do the following.
- GraphenOS devices - secure with a 6 digit pin. This encrypts the device.
- FDE Ubuntu Linux - Shut down the computer at night, or when it is not on your person outside of the home. This will encrypt the device.
- Original documents - stored in a safe
### Onsite data
While not completely necessary because of encryption, I prefer to store onsite backups in a safe.
- Onsite SSD
- Onsite backup Token2 device
### Offsite data
The offsite data is a small MicroSD and a token2 device.
- Choose a location more than a few miles away from your home, at the home of a person you trust, or hidden at another location.
- If you need to hide the microSD, put it inside of a covert coin. The token2 device will be useless if found.
## Recovering data
In the event of data loss, simply retrieve a backup drive and plug it into the new device. 
### Linux computer restore
- Open Timeshift and select "Restore"
- !TODO
### GrapheneOS phone restore
- Ensure you have purchased a [compatible device](https://grapheneos.org/faq#supported-devices)
- !TODO

# Documents
We should make scans of all important documents and store them safely. Any documents that contain personal information that need to be preserved should be scanned. The scanned documents should go in a folder on backup drives, and the original documents should be stored in a safe. Any documents with personal information that are not needed should be burned.

I choose not to keep important documents on mobile devices (laptops and phones). This is more secure and still follows the 3-2-1 backup protocol as the original documents are also stored in the safe.

## Scanners and software
Secure scanners and software have the following requirements for our purposes -
- Do not require proprietary software
- Have Linux supported drivers
- Do not sent usage telemetry
- (Ideally) do not require an internet connection

## Scanning process
- Purchase a compact document scanner like [this one](https://www.usa.canon.com/shop/p/imageformula-p-208ii-personal-document-scanner). They can be procured on Ebay for well under $100 used
- Download [VueScan](https://www.hamrick.com/purchase-vuescan.html?Version=9.8.50&Vendor=Video&Model=Integrated%20Camera&Type=5&Network=0&Driver=vid1) for Linux. This third party software offers drivers for practically every model of scanner and requires no internet connection to function. It costs a one-time fee of $89.95 at the time of writing
- A slightly paranoid recommendation is to put your computer in airplane mode to ensure no data about the sensitive documents you are about to scan leave your machine
- Connect the scanner to your computer, download the correct drivers for your scanner and and scan all your documents. Save them to any location on your computer
- Store each scanned document in a safe
- If you determine a document is not needed, put it in a separate stack 
- When you are done, create a folder in your onsite backup drive called "Documents" and move the files there. I prefer to ensure no sensitive documents are stored on devices
- Burn or cross-shred any unneeded documents that contain personal information
## Mail
Any mail you receive that contains personal information should be shredded with a cross-shredder or burned in a fire pit.

## Transporting physical documents
!TODO
- https://www.sentrysafe.com/product/CHW20201
- RFID wallet
- RFID passport sleeve
- https://store.ricksteves.com/shop/p/hidden-pocket
- Book rooms with safes