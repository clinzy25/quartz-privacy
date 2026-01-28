#privacy
```table-of-contents
```
# Overview
This is a guide for maintaining online accounts securely and anonymously with aliases, password managers and 2 factor authentication. There is also a guide for sterilizing existing accounts.
# Threat Model
We want to use trust-worthy online services without the possibility of our real personal information being leaked, sold, or abused in any way. We want to simplify the process of maintaining many online accounts, while making each one as secure as possible. When your data is leaked or sold, ensure it is not useful to anyone and will not impact your life in any way.

**Untrustworthy online services** -
- Transport and store your unencrypted personal and behavioral information
- Sell your data to third parties
- Have unknown resilience to data breaches or cyber incidents
- Have unknown numbers of employees with read privileges for your personal information
**Exposed credentials** -
- Can lead to identity theft or fraud
- Can be used to take over your online accounts to view / expose personal information or otherwise disturb your life
- Must be changed. An compromised email address should never be used again, and changing your email is a huge task if it is used for many accounts
# Threat Response
Regardless of a service's reputation or what their privacy policy says, assume they are incompetent because you cannot verify that they are. Assume any information you provide online will be exposed and act accordingly:
* Create a new email address with a private and secure provider
* Provide alias credentials and alias personal information
* Use a password manager to store and manage credentials
* Reign in our digital presence by identifying online accounts we hold, closing unnecessary accounts and requested data deletions
* Harden accounts with 2FA
# Tools
* Protonmail - secure and encrypted email service based in Switzerland
* Bitwarden password manager - a program that securely stores and manages all your passwords in one encrypted vault, protected by a single master password
* SimpleLogin email aliases - quickly generate random alias email addresses that are forwarded to your root email
* Token2 security keys - a physical device used for 2 factor authentication
* Proton Authenticator - a TOTP 2 factor authentication app
# Email
If you've used your current email address to sign up for many services, you can assume it has been exposed in a data breach. Known breaches can be searched [here](https://haveibeenpwned.com/), but companies often don't know if they've been attacked, may not have proper detection systems, or simply won't follow the law that says they must report them.

Other reasons you may want a new email account -
- You probably get a lot of spam
- You may have reluctantly provided your email because it was necessary to accomplish something
- Many email providers, like Gmail, scan your private emails and sell the information to third parties, and monitor your activity for behavioral surplus or AI training data
- Many email providers do not use end-to-end encryption, meaning your personal information can be exposed by traditional attack vectors like man-in-the-middle, packet sniffing, or unauthorized access to mail servers
- If you use a US-based email provider, your emails can be obtained by the NSA or FBI via court order
## Protonmail
**Use [Protonmail](https://proton.me/mail)** - a secure and encrypted email service based in Switzerland. A free account is usually not sufficient, but a paid account gives you access to SimpleLogin, a VPN, cloud storage, a password manager, and a calendar. It is a good ecosystem choice for people who want to move away from big tech but still remain within a stable, secure and interconnected app ecosystem. 

If you don't like the idea of paying for an email account, consider that generally, free services are free because their true customers are data brokers to whom they sell your personal and behavioral data that you generate while using the service. Services that respect your privacy cost money.

**Proton features** -
* Full encryption. Even Proton employees can't read your emails
* No ads, no tracking - They don't monetize your data
* Swiss jurisdiction - Outside US/EU surveillance agreements
* Self-destructing and password protected email options
* Anonymous signup - No personal info required
* Integrated ecosystem - VPN, Drive, Calendar, Pass all encrypted
* Free access to SimpleLogin - unlimited email aliases

**Protonmail setup** -
- Create an account with Protonmail - for the account email address, create a random email address with no identifying information. This address will only be used to log into the email account. We will create your main personal email address in a subsequent step. We do not want to make public an email address that is also a login credential to your email account.
- Click the gear icon -> All Settings
- In Account and Password -> Two-factor authentication - after you have set up [[Accounts and Passwords#2 Factor Authentication]] security keys and TOTP, enable and set up both
- Security and Privacy -> Enable Proton Sentinel, Enable dark web monitoring
- Email privacy -> Block email tracking
- Identity and addresses -> My Addresses
	- Now, create your personal email address. This one can include your name. Use this email for personal communication with trusted parties, and do not use it to sign up for any services because it identifies you
## SimpleLogin
[SimpleLogin](https://simplelogin.io/) allows you to generate unlimited random alias email addresses and auto-forwards them to your root email. Since SimpleLogin makes the process so easy, our goal will be to use a different email alias for every account that we sign up for, and **never provide your root email address to anyone**, as explained above. This may sound like a headache, but is made very simple using password managers explained later.

This functionality is useful for when email addresses are compromised. You can simply turn off the affected email alias within SimpleLogin. If the same had happened to your root email address, you would need a new email account and to change all of your online account credentials that use the email address. Crucially, since each email address is different, this approach completely mitigates credential stuffing attacks (where attackers try the same email/password on other sites).

Sign up for SimpleLogin -
* After signing up for ProtonMail, sign up for SimpleLogin using the "Sign up with proton" link
* In Account Settings -> Two-factor authentication - after you have set up [[Accounts and Passwords#2 Factor Authentication]] security keys and TOTP, enable and set up both
* In Account Settings -> Account Email, ensure this is the same email you use to log into ProtonMail
* I recommend using a specific ProtonMail alias as the default mailbox for SimpleLogin aliases. This ensures the primary mailbox is sterile and only used for this purpose
	* In ProtonMail, in All Settings -> Identity and Addresses -> My Addresses, click Add Proton Address
	* Make an alias like "simpleloginmailbox841" and save it
	* In SimpleLogin Mailbox settings -> Change Mailbox Address, change the address to the one you just created
	* Now, all aliases you created will forward mail to this address
* In SimpleLogin, top right, click your name and click API Keys in the dropdown. Create an API key and store it in Bitwarden
* I recommend creating around 5 random aliases and storing them in a notes app or something easily accessible for the situations where you need to quickly generate an email alias. Instead of logging into the application and generating one, a list of available ones will be close at hand. 

Aliases can be generated within SimpleLogin web view or within Bitwarden as part of the credential creation process. This process uses the API key we just saved. Refer to [[Accounts and Passwords#Creating new accounts]] for instructions on creating within Bitwarden.

*Some hyper-vigilant services refuse SimpleLogin email addresses. In this case, make an alias within Protonmail manually.

!TODO - reverse aliasing
# Passwords
Password managers securely store all of your passwords make it easy to create and manage secure credentials. After setting this up, the only password you will ever need to remember is the one that unlocks your vault. All other passwords are randomly generated according to user-defined complexity rules.
## Bitwarden
Despite the fact that ProtonPass is free with your Proton account, I do not recommend it. With Proton, one password and 2FA combo unlocks both your email and password manager at the same time. We want separate credentials for these critical accounts, and for this reason we will use Bitwarden.

Bitwarden is an open-source, end-to-end encrypted (E2EE) program that stores your passwords in an encrypted vault on their cloud servers, but all encryption happens locally on your device before any data is transmitted, meaning Bitwarden itself cannot read your passwords. Your master password is never sent to or stored on their servers. A local encrypted copy is also cached on each device you use for offline access. Bitwarden also offers a self-hosted option where all data stays on your own infrastructure.

We will set up the Bitwarden browser extension on a computer and the Bitwarden Android app.
* Start on the Bitwarden website and create a free account
* Choose and memorize a very complex and long master password to lock the vault. This should be the only credential you will need to memorize. It is useful to take a real phrase and replace characters with upper/lower-case and numbers and special characters.
* Write this password down and store it in a safe, supply beneficiary with safe combination. Explain the purpose of the master password. Remember that if no beneficiary has access to your master password, your accounts could be locked upon death.
* Download the Bitwarden browser extension on your computer
* Download the Bitwarden app and/or the browser extension on your phone
* Enable two step login (2FA) to the vault with a security token
	* Enabling this feature reduces your attack surface from the entire planet to an exact location. An attacker would need to forcefully obtain a physical token, know the token pin, and know your master password to access your vault
	* This feature requires Bitwarden Premium which is $10 / year
	* Obtain and setup **three** security keys - [[Accounts and Passwords#Token2 Security Keys]]
	* In Bitwarden web, log in and go to settings -> security -> two-step login
	* Under "two step login", click "View recovery code". Write this down and store it in the safe with the master password.
	* Under "Providers", "Passkey" click Manage button
	* Plug your token into the computer and follow the prompts
	* Test the setup by logging out and back in to Bitwarden website. It should prompt you to use the security key
	* Repeat this process with the two other keys, make sure you name them logically and follow the naming convention for subsequent uses.
* Now log into the app on your phone, and the browser extension. These should all prompt you to use the token.
### Bitwarden app states
The Bitwarden applications and extensions have 3 states it is important to understand -
* Unlocked - vault is unlocked
* Locked - requires only master password to unlock
* Logged out - requires master password AND 2FA to unlock

By these definitions, and the work we will do to secure the account with 2FA, we will prefer the logged out state when we are done using the app. This has some inconveniences discussed later, but it is worth the added security.
### Bitwarden App Settings
Set the following settings in ALL Bitwarden environments (apps, extensions, web)
* You can check "remember email" to skip a login step
* Go to Account Settings and set vault timeout to 5 minutes, and the action to "Log out"
* Autofill options
	* Your own preferences
	* Clear clipboard after 1 minute
### Unlocking your vault
At this point, the process of unlocking your vault should now look like this -
* Plug in the security token to the phone / computer
* Open the app / extension, your email will be autofilled, click continue
* Type your master password
* The "Verify your identity" screen will either auto open a browser tab or require you to click "open in new tab" button
* In the browser tab, click "Read security key", note in the android app there will be a popup that states there are "No passkeys available". You can tap "Use a different device", which will move the process forward.
* Type the token pin number
* Touch the gold plated portion of the security key with your finger
* Unplug the token

If you have auto-fill enabled, the browser extension will attempt to fill usernames and passwords for you while the vault is unlocked. It will automatically lock itself again after 5 minutes.
## Password manager tips
* Password managers can be used to store any kind of credential, not just passwords, for instance:
	* API keys
	* Answers to security questions
	* Pins
	* Recovery codes
	* Credit cards (will autofill)
	* Alias info
	* Product codes
* Even short 4-digit pins should be stored, upon death these may be needed by your beneficiary
* You can have folders within your password manager. I have one for sensitive accounts and one for work
* You can share credentials securely with the "Send" feature in Bitwarden. Never share passwords through any other channel.

A final note on passwords, once you have set up a password manager and [[Accounts and Passwords#Cleaning Old Accounts]], destroy any other permutations of passwords or credentials that exist in your physical or digital world. Any passwords stored in your browsers should be deleted. If that browser was Chrome or Safari, request the data to be deleted from Google or Apple. Digital documents should be deleted and physical papers should be burned. Passwords saved by your phone should be deleted. Any external autofill services should be disabled as they can become annoying and serve no purpose. All things passwords are now Bitwarden.
# 2 Factor Authentication
2FA should be enabled for any account that has it available, but at minimum for sensitive accounts. I define sensitive accounts as:
* Password managers
* Email accounts
* Accounts that deal with finances (credit cards, banks, investment accounts)
* Accounts that have your government ID or social security number
* Accounts that must have your true name and address
* Contain personal health data - usually also need your true name / address

Below are different types of 2FA in order of most to least secure. Many online services offer 2FA for their accounts. For each one, simply choose the highest type offered and configure it.
1. Hardware security keys (FIDO2/U2F)
2. Biometric authentication (use discretion when offering this data to services)
3. Time-Based One-Time Passwords (TOTP) (Authy, Proton Authenticator)
4. Backup codes
5. Text message one time codes
6. Email one time codes
## Time-Based One-Time Passwords (TOTP)
TOTP is a 2FA strategy that is more secure than one time text and email codes, but still less secure than a hardware token. More services offer this than hardware keys, so you should have it available.
* Download Proton Authenticator app on your phone
* Go to Settings -> App Lock and select Biometric. This will lock the app with the same authentication used to unlock your phone, not always biometric as it is inappropriately named
* In a browser, go to a service that offers TOTP and configure it, you will likely be asked to scan a QR code with the Proton Authenticator app and enter codes shown on the site
* After configuring many services, it becomes apparent that if you were to lose your phone, you would lose access to these 2FA codes, locking you out of accounts. You can backup these codes -
	* Go to Settings -> Backups
	* Toggle Automatic Backups, this will prompt you to choose a folder in your phone to store the backups, choose one and set an encryption key.
	* Save the encryption key in your password manager
	* If you follow [[Secure Backups and Documents]], the codes will be copied to a disc when we make a snapshot of the phone. Otherwise, navigate to the folder and copy it to your computer and store safely.
### Using TOTP
When logging in to the service protected with TOTP, it will ask you for a TOTP code, simply open Proton Authenticator, unlock it, and go to the entry for that service and type in the code. These codes refresh every 30 seconds so be aware if the cycle is almost up you will need to wait for the next code.
## Token2 Security Keys
These are hardware security tokens used for 2FA. This is the most secure form of 2FA and I recommend using it to secure sensitive accounts that offer compatibility with it. At minimum it should secure your password manager application and Protonmail account.

Purchase no less than three [Token2 devices](https://www.token2.com/shop/category/pin-plus-series). I recommend a model you can plug into your phone and PC, check your ports to inform this decision. You will need one on your person (key ring), one backup in your house, and one backup off-site at a trusted location.

**To reiterate, do not buy one single token. If you lose this single token, you lose access to ALL of your accounts.**
### Setup
You will need to set a pin for each Token2 key using a computer. The following steps are for Linux, but you will need to follow your operating [system's guide](https://www.token2.com/site/page/tools-for-fido-security-keys) for setting the token's pin.
* Install the token management software - 
* Start a terminal session and paste the following script and run it
```
cd ~/Documents

sudo apt install git

git clone https://github.com/Token2/fido2-manage.git

cd fido2-manage

sudo apt install -y zlib1g-dev pkg-config

sudo apt install -y libudev-dev cmake libcbor-dev libpcsclite-dev libssl-dev

rm -rf build && mkdir build && cd build && cmake -USE_PCSC=ON ..

cd ..

make -C build

sudo make -C build install

sudo ldconfig

chmod 755 fido2-manage.sh
```
* Plug the Token2 device into your computer, and run the following command `./fido2-manage.sh -setPIN -device 1`
* Follow the prompts and set the pin. The pin should be 6 digits for PIN+ models, 4 for other models (this is not specified, so saved you a headache).
* Set the pin for _each subsequent token_, just plug in the pin and run `./fido2-manage.sh -setPIN -device 1`
## Using Security Keys
* For an online service that offers 2FA with tokens, enable it and register each of the 3 keys with the service. **Ensure all 3 keys are registered**.
* Keep a list of all services that are secured with the keys. You will refer to this list if a token is lost and you need to replicate it.
* Log into the service with your password, you will be prompted to insert the security key.
* Insert it into the phone or computer, input the token pin, and touch the gold plated portion of the key with your finger. This will authenticate you.
* You can unplug the token after authentication.
# Alias Credentials
Aside from email addresses, we can alias other types of information that services request from us for different degrees of anonymity. Generally, we should follow the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege), meaning only supply necessary information. Additionally, I prefer to default to alias information unless real information is absolutely required, and the service meets my standards of trust, privacy, and security.

Some of these topics have a much broader scope and require case-by-case judgement. For more a more robust guide, see [inteltechniques](https://inteltechniques.com/book7.html).
## Name
You often do not need to provide your real name. I recommend creating an alias name and offering it to any service that requires a name but has no real use for it. Obviously there are exceptions to this, like financial, medical, and government accounts.
## Address
You will need to provide your real address for shipping to your home, but in this case ensure you use an alias name. Your credit cards can have a PO box as the billing address. In all other cases I recommend using the address of a nearby hotel in the same zip code (to pay correct taxes). Generally I try to avoid giving my real name and real address to any service. This does not fully conceal where you live, but it is reasonable to try to reduce the number of these associations that exist in cyberspace.
## Usernames
Randomly generate different usernames for each service. This can be done quickly with Bitwarden.
## Phone Numbers
Instead of your real phone number, provide [[Anonymous Smart Phones#VoIP with VoIP.ms]] numbers from a service like Voip.ms. Running a reverse phone lookup on a VoIP number will reveal little to no personal information about you, whereas phone numbers from your service provider can reveal name, address, and email addresses. Additionally, if a number is leaked in a data breach or becomes inundated with spam, you can simply deactivate it and get a new one.
## Credit Cards
Use a masked credit card service like [IronVest](https://www.getivy.ai/) for online payments. You can link a real credit card or bank account to these services and they will fund aliased burner cards for one-time or merchant-locked use. There are many advantages to this.
- Credit card companies often sell your personal information and transaction data to third parties. Masked card services offer ways hide the details of your transactions from your financial institution, rendering this data useless, and your spending habits and location hidden
- Merchants don't get your real card or bank info to misuse or store unsafely. A leak of your real credit card number can result in fraud. A leak of a masked card number is no problem at all, especially for merchant-locked or one-time use cards. Just deactivate the card
- Close merchant accounts and resolve disputes by simply closing the associated card

More info and other strategies can be found in [[Private Payments]].
## Biometric Data
I do not recommend providing biometric data to any company even for 2FA. This data can not be aliased and if compromised, cannot be changed. A deeper discussion could be had on fitness and wellness products that harvest biometric data, as well as fitness trackers like Strava and Alltrails that monitor your location. I simply recommend avoiding these entirely.
# Identity Verification
Some services will require you to provide copious personal information to "verify your identity" and "protect against fraud". This is a difficult and deeply political problem, but I will focus on practical advise related to account and data security.

You may be asked for - 
- Your real name and address
- Social security number
- Social security card
- Government ID
- Biometric data

This is all extremely sensitive information that cannot be aliased and can be used to perform identity theft and fraud. You should use high level of discretion before performing identity verification processes online.

Some services absolutely require your government ID due to Know Your Consumer laws in the US - 
- Banks & financial institutions
- Government services
- Employers
- Healthcare
- Legal contracts (mortgage, loans, insurance)

In these cases, consider the following -
- Choose institutions with strong security track records
- Read their privacy policy
- Ensure they verify identity in-house and without third parties like Persona or Jumio, who send data to many [third parties](https://withpersona.com/legal/subprocessors)
- Opt to open these accounts in person at brick and mortar locations to avoid sending these documents over the web
- When verifying in person, ask if they need to make copies of your ID. Some institutions only need to view it, not retain a copy.
- Ask about their encryption levels and retention policies
- Enable strong 2FA on the account
- When providing the documents, provide a marked-up scan with language like "For identity verification only for X company". If such a document was leaked and used for anything else it would draw scrutiny
- Set a reminder to request deletion after verification is complete

If any other type of service tries to enforce identity or age verification, I highly recommend you stop using the service and find a more privacy-respecting alternative. If that's not possible, perform a risk-value analysis -
- Consider what exactly they ask for. There's a hierarchy of sensitivity: email < phone < address < SSN < government ID < biometrics. Each step up dramatically increases your exposure
- Why do they need it? Is verification legally required for their service, or is it a policy choice?
- Determine their encryption level and retention policy
- Do they verify in-house or with third parties like Persona or Jumio?
- What's the company's track record? Have they had breaches?

I've personally provided my Social Security number to a privacy-focused company that claimed to delete it immediately after verification. I accepted this tradeoff because the service provided significant value and SSN verification is harder to abuse without supporting documents. However, I would not have completed the process if they had asked for government ID or biometric data. A photo of your driver's license or passport is the holy grail for identity theft, and I consider no subscription service to be worth that risk.

When in doubt, trust your instincts. If a company's verification requirements feel disproportionate to the service they provide, they probably are.
# Creating New Accounts
Using the tools described above, we can now make anonymous and secure online accounts for most services -
* On the sign up page for new service, click the Bitwarden extension icon
* Sign into your vault
* Search the SimpleLogin API key in your vault and copy it
* Click New -> Login
* Under **Login Credentials** click generate username
* In the next window, click the generate button
* For Type, select **Forwarded Email address**
* For Service, select **SimpleLogin**
* For API key, paste your SimpleLogin API key
* Click **Use this email**
* Under **Login Credentials** click generate password
* Under **Options**, set length to 21, and check all special characters, 4 for minimums
* Click **Use this password**
* Click **Save**
* Input the saved credentials for the service
* Supply any other required information aliased as needed
* Configure [[Accounts and Passwords#2 Factor Authentication]] within the service
* On future visits to the site, clicking any of the sign up fields should prompt to autofill the Bitwarden credentials

Many of these settings will be saved if you _lock_ your Bitwarden account instead of _logging out_. But we've decided above that logging out is the preferential, so we accept the inconvenience of filling these every time.
# Cleaning Old Accounts
Most of us start here -
- Have a gazillion online accounts, and would not be able list them from memory
- Used the same email for all of them
- Used the same or similar or simple password(s) for all of them
- Get spam emails and calls from services you don't even remember signing up for
- Tremble at the thought of how many people have access to your information

The next section details how to reign in and secure your existing online presence. It is possible to identify all of these rouge accounts, and either harden them or shut them down. It can be a long and tedious process, but very rewarding. 

## Identifying held accounts
You should make an effort to locate every service you have ever signed up for. There are a few ways to do this.
* Search your current and previous emails for "welcome", or "account created", or similar phrases. This should produce a decent list.
* If you have saved passwords in your browser (when the browser asks you to save passwords), there will be a list of them in your browser settings
* If you have saved passwords in your device (when your phone or computer asks you to save passwords), there will be a list of them in your device settings

Once you have these lists, go through them one by one and ask yourself if you need this account anymore. Scrutinize each one and look for reasons to close them, or find more trustworthy alternatives.

Then make the following decision for each account:
### Do not need the account
Congrats, you have the opportunity to reduce your digital footprint.
1. Delete data - If this is a data heavy service, or the service is a known abuser of data (social media, google etc), request to have your data deleted. Go to the privacy policy for the service (usually in the footer), and press Ctrl+F and search "delet", or "@". This will usually bring you to the section on deleting your data, or directly to an email address to facilitate this. Send them a brief email from the account that you used to register.
> 	Hello, please delete my account and all data associated with this email.
2. Delete the account - this button might be in the account settings, but if not, send an email like the above.
3. The email process takes time, so keep a list of any requests in flight and check them off when you receive confirmation of delete.
### Need the account
Change the credentials and store them in your password manager.
1. Starting from the bitwarden "new login" screen generate a SimpleLogin email alias (see the process for creating new accounts)
2. Set the password to a randomly generated one with high complexity (see the process for creating new accounts)
3. If the site requires a username or any other credentials, save it in the notes section of the entry
4. Save the login to Bitwarden
5. Go to the service's account settings and change the email and password
6. Check for other credentials that you have given and change them to aliases
7. Configure [[Accounts and Passwords#2 Factor Authentication]]
8. Since you are here, check the email notification section and disable everything

## Notes on the process
- Sometimes, if I have to keep an account and  I feel the service has collected enough sensitive information about me, and that information was not aliased, I might feel compelled to close the account and create a new aliased one. Companies likely keep a record of account changes and know previous credentials. Ultimately this comes down to gut feeling.
- This entire process will frustratingly generate spam for a brief period of time. My guess is that services reset your email preferences when you change it, so I found myself getting lots of spam from accounts that I had for a while that were previously quiet.
- Some companies will make you go to ridiculous lengths to delete your account. Follow through with the entire process and don't give up no matter how long it takes.
# Online Shopping
We can employ these strategies when ordering stuff online.
* Whenever possible, checkout as a guest
* Uncheck any boxes that automatically sign you up for a Shop account or a merchant account
* Uncheck any boxes that automatically sign you up for newsletters or any other communications
* Never pay with Paypal, Stripe or similar services, they are known abusers of transaction data
* Unlock Bitwarden and generate a random email alias with SimpleLogin as described above. You do not need to save this login, simply generating the address with the API key is enough. Use this email address to place the order.
* In Bitwarden you can save identities. I have one called "shipping to home". It has an alias name, alias username, junk username, and my real home address. Clicking this in your vault will autofill some of these credentials for you.
* Do not provide a phone number, or if required, use a junk VIOP number.
* Provide an alias name
* Important note - with this strategy, if the package requires a signature, and they miss the delivery, you can't collect the package from the post office because the name on your ID would not match that on the package. Instead, provide your real name have it sent to a PO box and the carrier will hold it, you can sign for it at the PO box.
* Pay with a masked credit card. Set the card as "one time use". If the card is ever leaked it will be useless.
* If you were required to create an account to order something, and you will never order again, set a reminder to close the account after the package is received.
