# Anonymous Purchasing

# VoIP with VoIP.ms
- VoIP allows you to never use your root phone number and maintain various alias phone numbers for different purposes. These can be turned on and off and have custom notification settings.
- To sign up and avoid ID verification. Do not perform ID verification through Persona, they have a history of data/privacy violations
	- Ensure you are away from your home on public wifi
	- VPN disconnected
	- Location services on
	- Use a root (non-alias) email address for sign up
- Go to voip.ms and create an account
- Use your real name and root phone number, use previous address, root email
- After creating account, decide how many numbers you will need and their purpose. For example:
	- Trusted communications (friends and family)
	- Junk
	- Employer
	- Job applications
- You will need to add minimum $15 to the account via Finances -> Add funds 
### Create VoIP Numbers (repeat for each number)
- After signing in, go to DID Numbers -> Order DID(s)
- Choose United States -> Your state
- Choose a city where availability is "Available" -> View Numbers
- Choose a number, understand fees. Some numbers you might prefer Flat Rate or per minute depending on usage levels
- Choose a server closest to you
- Order DID
- Next you will need to create a sub-account for the number. Each number should have its own sub-account mostly for organizational purposes explained later
- Go to Sub Accounts -> Create Sub Account
- For Authentication Type, ensure User/Password Authentication
- For username append the title (purpse) of the account
- Choose a password
- Save the username and password to your password manager, title it according to its purpose (Junk, etc)
- For CallerID Number -> Use  Use one of my DIDs -> Choose the number you want to associate with this subaccount
- Account name or description -> Add the title
- Create Sub Account
- Go back to DID Numbers -> Manage DID(s) and select the number you just created
- Ensure  SIP/IAX is set to the sub account you just created
- Click the yellow edit button
- For Message Service (SMS/MMS) -> check the box, understand the fees
- Link the SMS received to this DID to a SIP Account -> Link to the sub account you just created

### Create Voicemail (only once, then apply to all numbers)
- Go to "DID Numbers" > "Voicemail"
- Click "Create new voicemail account"
- Enter random 10 digit number for Voicemail Number
- Enter a name
- Enter a 4-digit numeric password and enter an email address if you want notifications of voicemails
- Navigate to "DID Numbers" > "Manage DID(s)".
- Select your number and click "Edit Selection-All Settings at Once".
- Change "Voicemail associated with DID" to the mailbox of your number.
- Apply all changes.
### Set up MMS (only once)
- Log in to your VoIP.ms portal within a web browser.
- Navigate to "Main Menu" then "SOAP and REST JSON API".
- Enter a unique API password and click "Save API Password".
- Click "Enable/Disable API" until "Enabled" is displayed.
- Enter "0.0.0.0" as the IP Address and click "Save IP Address".
- Navigate to "DID Numbers" > "Manage DID(s)".
- Select your number and click "Edit Selection-All Settings at Once".
- Enable "Message Service" and "Link the SMS received to this DID..."
- Select your Sub Account next to "Link the SMS..." and apply changes.
### On the phone
- Download Sipnetic from Aurora Store
- For the SIP server, input the server name
- Allow all permissions
- Go to Settings
- Auto-start on launch
- Uncheck Unregister on exit
- Tap the menu icon, and tap the dropdown arrow
- Select "Manage accounts" then tap the "+" icon
- Choose "List of VoIP Providers" and select "VoIP.ms"
- Choose the server which matches your account settings and click "Next"
- Enter your Sub Account username previously created
- Enter the password configured for the Sub Account
- Click Advanced Mode, and set Display Name to the title of the phone number according to its purpose
- Set Default transport to TCP
- Click Finish
- Sipnetic is now set up and is best used for calls. For better control over texting, download voip.ms SMS from F-Droid app store
- Enter your account email address and new API password from the previous task.
- Tap the three dots and choose "Settings".
- Tap "Phone Numbers" and enable the account.
- Unfortunately I have not figured out how to title the numbers like you can in Sipnetic
- You can set number-specific notifications in Settings -> Phone Numbers
- You will want to disable "New messages" notifications from Sipnetic if you use this app

## Voip.ms sms
- Download the Voip.ms SMS app from the Aurora Store
- Open the app and input your account email address for Voip.ms and the API password. To generate an API password
	- !TODO
- Allow access to contacts and notifications
- All of your accounts should sync automatically
- For push notifications, go to Settings -> Phone Numbers
- App battery usage unrestricted
- Info message at the bottom shows a url for the callback feature, input this url in the settings for each phone number
	- In Voip.ms, go to Manage DIDs
	- Edit a DID number
	- Scroll down to SMS/MMS URL Callback, enable it and input the URL in the text field
	- Do the same for all phone numbers
### Port your old number
- You shouldn't leave your old number, it could get assigned to someone else and they could assume your identity, and other reasons.
- Guide https://wiki.voip.ms/article/Porting_a_Number
- If that number was messy with spam and such you can disable notifications for it.
### Use
- These phone numbers are ephemeral. You can create and delete at will.
- You can text and call on any number if you follow the above procedures
- You can configure notifications for individual numbers separately


109 214 155