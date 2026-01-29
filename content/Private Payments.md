# Overview
This section discusses the privacy and security risks associated with different payment methods and various mitigation strategies.
# Threat Model
Digital transactions leak personal information and provide attack vectors for fraud. When paying for services with a normal credit card, the following things may occur.
- Personal information attached to the credit card, including your name and billing address, is collected and stored by the merchants payment processing service (Stripe, Square, etc) and their business accounting suite (Intuit, QuickBooks, Google Drive, paper records, etc) and possibly by the merchant themselves. You have no control over the information after the transaction, and no privacy or security standards are presented or agreed to. It may be stored insecurely or shared with third parties. It may be printed onto paper and discarded without shredding.
- Transaction metadata, including location, merchant, and price is returned to your credit card company who will use it to build a spending profile on you and sell it to third parties in a behavioral futures market. This data will bounce from third party to third party, cross-referenced with other sources and used to expand your profile. You could see ad on Facebook for something informed by your transaction data, even though Meta has no official affiliation with a credit card company. This information will also go to credit bureaus which is considered a source of truth in markets like these.
- Personal information and transaction data is likely sent over insecure connections during online and in-person transactions.
- If you use tap-to-pay services with a smart phone (Google Pay, Apple Pay), Google / Apple also gets all of your transaction data.

The most obvious and serious threat associated with all of this data sharing is a leaked credit card number. We obviously do not want this in anyone else's hands, and when it is, we are at the mercy of your credit card provider's fraud prevention systems, which are capable but not bulletproof. Regardless of the outcome, this event is always a major disruption in one's life.

Additionally, digital payments are one of the most common ways our home address is exposed to networks. Credit card data gives data brokers powerful insights into your location and spending habits, enabling richly targeted advertisement campaigns directly to your home mailbox in the form of junk mail and the websites you visit. 

Your location data can easily be aggregated from credit, debit, and prepaid card usage, offering unsettling insights into your daily routine, the general location of your home, and when you are out of town. This data is commonly accessed by law enforcement to locate people.

Given the number of entities involved in a transaction, the fact that third party data sharing is fractal (third parties share to third parties), we can say that a single credit card transaction may result in greater-than-one permutations of our data shared between greater-than-one entity, traversing greater-than-one insecure digital network paths to greater-than-one unencrypted server owned by an unknown persons who likely have profit motives. Using a credit card is like sending out a giant radar pulse to a network that says, "I am here, I like this kind of stuff, this is where I live, please analyze my behavior and show me ads".
# Threat Response
We should assume that all digital transactions will engage in personal data sharing in both directions - 
- **OUT** to the merchant -> on to third parties
- **IN** to the credit card company -> on to third parties. 

We should assume every entity in this chain is incompetent and is under no obligation to keep my personal information and credit card number. Therefore, we will try to limit the use of credit cards, hide our personal information from both merchants and credit card companies when we use them, and mask our real credit card number to the greatest degree possible.

To do this, I generally follow this cascade of payment options -
## In-person transactions
1. Cash - most private
2. If cash not accepted - aliased credit card
3. If cash and AMEX not accepted - Prepaid VISA bought with cash
4. If I run out of cash - Prepaid VISA bought with cash
## Online transactions
1. One-time purchase - One-time use masked card
2. Recurring purchase - Merchant-locked masked card
3. Flights, rental cars and hotels (or any other ID sensitive service) - aliased credit card
## Protecting personal information
All of these transaction methods are designed to reduce the amount of personal information given to merchants, your credit card company, and third-parties.
- Cash - cash is the only fully anonymous payment method aside from bitcoin. We can split hairs though - it can be traced by fingerprint and surveillance footage, but I believe this is beyond a typical threat model.
- Aliased credit card - A credit card containing only your first and middle name, with a PO box as the billing address. Data aggregators and third parties usually index people by last name, and using a card with only your first and middle is harder to trace. Additionally your home address is never exposed if the billing address is a PO box.
- Masked card - Masked cards are ephemeral credit cards generated by a masked card service, funded by your bank account or a real credit card. These cards contain no personal information. You can use an alias name and the address of a nearby hotel. Further, some of these services offer the ability to mask the payment details from your funding source rendering the data useless if sold to third parties. Even further, these cards protect against fraud with "one-time use" and "merchant-locked" features, meaning the card number is invalid after one use for the former and invalid for all but one merchant for the latter.
- Prepaid cards - Prepaid cards can be bought in cash and contain no personal information when used, with one big caveat - the location of each transaction can be easily looked up. Simply avoid using these near your home and try to spread out usage over a wide geographical area, similar to ATM withdraw strategy.
# Caveats
I want to note that this part privacy process specifically is the most challenging and frustrating. You will be dealing with companies who are lawfully obligated to verify you under Know Your Consumer (KYC) laws in the US. You will have to fight identity verification procedures and carefully spoonfeed various levels of personal information until you are successful in obtaining services. The methods are often obtuse and tedious, might require correspondence with the companies, and might ultimately fail for reasons you will never know. For this reason I provide multiple service recommendations in case you are unable to acquire the service without verifying. Risks associated with modern identity verification practices can be found in [[Accounts and Passwords#Identity Verification]].
# Withdrawing cash
Debit cards cannot be aliased so we simply want to distribute ATM withdraws over a wide geographical area to ensure transaction data is noisy and gives no information about where we live or our daily routine. I try to withdraw cash whenever I am far away from home. In a pinch, you can visit your physical bank location and withdraw from the teller inside, which is a more private transaction that avoids ATM networks.
# Prepaid Cards
You can use prepaid visa cards as a backup for when you run out of cash or when merchants do not accept cash or AMEX. These cards should be purchased in cash at random locations so the card number cannot be traced to you. The card number can be queried to reveal a map of every location the card was used, so ideally we should use these cards over wide and random geographical areas to create noisy data that does not reveal anything about your habits or physical address. 

A few notes on prepaid cards -
- They cannot be used for online transactions without registering them with your social security number
- Since the transaction data lives for ever, be sure to shred or keep these cards after use to keep the information private
- Cards with more money on them usually have lower transaction fees
- These cards expire so be sure to set a reminder to use the remaining balance
# Secondary Credit Cards
Fully anonymous credit card usage is not possible, but there are steps we can take to achieve various degrees of private transactions. All credit card providers must verify your identity, so when registering, you will provide true, non-aliased information. This requires a degree of trust between you and the credit card company, so your choice of provider will need to be a "lesser evil" calculation. We can obtain some anonymity from the merchant and protection from credit card company data sharing by using aliased credit cards.

To alias our transactions, we want to obtain secondary cards with only our first and middle name. A first and middle alias is sufficient for our threat model -
- Merchants, data aggregators, and third parties who receive your purchase data see "First Middle" and they can't easily link this to other records filed under your full legal name
- People-search sites and data brokers primarily index by last name. Purchases linked to "John Michael" are much harder to connect back to "John Michael Smith" in their databases
- A higher level of hotel anonymity - records don't contain your last name

We do not want to use a full alias name for a few reasons -
- Hotel check-In or rental cars - these entities are required to check your ID and credit card for a name match. A partial name match should be sufficient in these scenarios. You can simply say you go by your first and middle name. If questioned further, say you are a victim of stalking and you don't want your last name on record for the stay.
- Legal proceedings - a completely fake name could be seen as evidence of fraudulent intent in a litigation involving the card
- Law enforcement - a wallet with many different alias names could look suspicious
## Using secondary cards
When you use this secondary card, there is very little personal information attached to it. Your home address is masked, and your true last name is never exposed. Further, you can use this "First Middle" alias when registering for hotel stays and rental cars. This works best if you have a US Passport card to provide as identification, because passport cards display your name in the following way:

**Surname:**
Last
**Given Names:**
First Middle

The given name should match your credit card, and as the clerk quickly scans the ID for a match, this should suffice. If questioned, say that "First Middle" is my given religious name but the passport card requires a surname.

I do not recommend using this card for online purchases or subscriptions aside from ID sensitive ones. Masked cards are better for these scenarios.
## American Express
American Express (AMEX) is the most privacy-conscious credit card, offering the ability to turn off third-party data sharing - a feature that Chase and Capital One lack.

Some downsides of AMEX are that their high transaction fees result in many merchants refusing AMEX cards, for these situations we can simply keep backup payment methods of cash and prepaid cards. Additionally, they have the highest credit score requirements of all credit card providers.
### Open an account
- Open an AMEX account. Financial institutions are required to verify your identity, so use your real name and home address, you can change this to a PO box after verification. The card you apply for is inconsequential with regard to privacy, but if you want no annual fee I recommend the Delta Blue Card. This card also offers rental car accident protection (not liability insurance) and the lowest tier of Sky Miles accumulation. 
- I recommend using a SimpleLogin email address and 2FA VOIP number for any online account
- Turn on Two-Step Verification using the 2FA VOIP number
- A card will be shipped to your home with your real name, put this card away and do not use it. We will obtain a secondary card for regular use.
- Once your account is established, change your home and mailing addresses to a PO box. There may be a warning against using PO boxes, but you can ignore it. They do not check.
- Make an entry in your password manager for the card. Note the home address in case you need to reference it, since you may accidentally try to use other ones.
### Turn off data sharing
AMEX is one of the only major card holders that allows you to turn off third party data sharing.
- Go to Account Services -> Security and Privacy -> Privacy Preferences
- Under Data Use and Sharing Choices, uncheck all boxes and save preferences
### Obtain a secondary card
Note that this action may trigger a soft credit pull, so ensure your credit is not frozen. Note that this process may trigger an identity verification procedure from AMEX, where they ask for a scan of your social security card. If this happens, consider it the end of the process for AMEX. You should never upload or allow scanning of your social security card. A backup option with Capital One is explained later.

 **Process -**
- Log in to AMEX and go to Account Services -> Manage Other Members
- Click Add Someone to Account
- Fill out the form, for first name put your real first name, for last name put your middle name
- All other information should be real. Email address can be the account SimpleLogin email. Address should be your true physical address.

Once you obtain the secondary card, activate it. You can now change the address to a PO box.
- Now that you have more than one card, you need to ensure you are managing the correct card with the dropdown in the top left. Select the root card.
- Go to Account Services -> Manage Other Members
- Click the ellipsis icon for your secondary card and select manage profile
- Edit the address to a PO box.

Note that your new card will have a completely different card number than the root card. This is a plus, especially if you already have an AMEX card and have used it. When using it at merchants you have already patroned, you will effectively have a new identity with no attachment to your old.
## Capital One
Capital One (C1) is not an ideal choice for privacy because they sell all of your transaction data to third parties. It is however, much easier to obtain secondary cards, and they have a built in virtual card feature which is a sufficient replacement for [[Private Payments#Masked Cards]] if you are unable to register for them without identity verification. While we cannot stop their data sharing, there are some ways we can use the service with some safeguards.
### Open an account
- Open an C1 account. Financial institutions are required to verify your identity, so use your real name and home address, you can change this to a PO box after verification.
- I recommend using a SimpleLogin email address and 2FA VOIP number for any online account
- Turn on Two-Step Verification using the 2FA VOIP number
- A card will be shipped to your home with your real name, put this card away and do not use it. We will obtain a secondary card for regular use.
- Once your account is established, change your mailing address to a PO box. For your home address, change it to a previous address that you have a history with. This should not throw any red flags to Capital One and crucially hide your real address from the third party data market.
- Make an entry in your password manager for the card. Note the home address in case you need to reference it, since you may accidentally try to use other ones.
### Privacy settings
C1 does not have any privacy settings. They do however, respect browser GPC signals described in [[Private Browsers]]. This setting will tell C1 to "stop sharing personal information for *certain* targeted advertising purposes", which vaguely translates to "slightly better" privacy standards. We'll take what we can get, so ensure this is enabled in your browser.

Further, you can ask C1 to permanently delete "some of your data". You will find later in the process that this translates to "Non-Account Data", which is described as - "Data we collected from your interactions with us or collected from third parties. This includes marketing data and Capital One product interaction data that can be associated with you." Let's delete this -
- Go to https://mydata.capitalone.com/ -> How to manage your data -> Get started
- Under Download Requests -> Request a copy of your data. Not necessary but might be an interesting read
- Under Delete Requests -> Request to delete your data

I recommend creating a recurring event in your calendar to manually perform this operation on an interval of 1 -2 months.

### Obtain a secondary card
Call the number on the back of your credit card and ask to obtain an "Authorized User" card using your first and middle name, per the wording on C1's website.

> "An authorized user is someone you add to your account without any additional application or credit check. They'll get a card with their name on it and share your line of credit. As the primary cardholder, you'll still be responsible for all charges and, if you have a rewards card, you'll earn on every dollar they spend."

At the time of writing there is no resistance or verification process for this method. If questioned, you can say that you no longer identify with your birth name and that this is your "preferred name". They may assume you are LGBTQ+ and will likely not inquire further.

The downside of this method is the card number is the same. So if you already have a C1 card and have used it, you do not get a new identity with previously patroned merchants like you do with the AMEX card.
### Capital One virtual cards
If you have failed at obtaining a masked card service, or do not wish to go through the trouble of obtaining them, C1's virtual card service will meet our needs with the only downside being that C1 gets to sell the transaction data. These cards are merchant locked, and can be set to one-time use.

To create a virtual card -
- Log into C1 and go to Manage Virtual Cards
- Click Create a Virtual Card
- Name it the service you are going to use it for, for your own reference
- You will be presented with the virtual card number

The first time these cards are used, you may be emailed and asked to approve the transaction.
# Masked Cards
Also known as virtual cards, masked cards are ephemeral credit card numbers. These cards offer completely private transactions and greater fraud protection with a smaller-than-credit-card-company degree of trust between you and the service provider. I prefer to relegate them to online transactions but they can be used in person with varied success.

The key advantages to masked cards are as follows -
- You can create "one-time-use" cards that become invalid after a single transaction rendering any leaked card numbers a non-issue
- You can create "merchant-locked" cards for recurring transactions and subscription services. These cards cannot be used with any other merchant and are thus highly fraud resistant
- Cards that are not of the above types can be easily paused and closed
- Many disputes can be resolved simply by closing the card
- You don't have to use your real address as the billing address
- Some offer the ability to mask transaction details from the funding source rendering that data useless to your credit card company or bank

Disadvantages -
- Applying without identity verification is a toss up and a non-trivial process with many steps
- Some of the services cost money
- Some services limit the number of cards that can be generated for a given period
- Some merchants refuse masked card numbers on account of fraud-protection
## Applying for masked card services
Applying for masked cards is extremely difficult at the time of writing. These services are required to verify users under Know Your Customer (KYC) laws and have become more stringent with this over time. 

I recommend three masked card services ONLY up to the point where they may or may not require identity verification with a government ID. If they request this type of verification, we should cancel the application, request that all provided data be deleted, and move on to the next provider. This request may come *after* the account has been established. If you are unable to obtain any of these services [[Private Payments#Capital One virtual cards]] are a sufficient alternative.

There are things we can do to try to bypass identity verification.
- Connect to the internet on a public wifi network
- Disable your VPN
- Disable any custom DNS connections or firewalls
- Use a fresh Google Chrome browser with default settings, do not use uBlock Origin or any other privacy extensions
- Enter your real name exactly as it appears on your ID
- When providing your address, look at the version associated with a credit bureau like TransUnion or Experian. Ensure you enter it exactly the same way, with the same capitalization.

Once you are verified, continue to administer the account by the same rules for a period of time. Once you have completed some successful transactions, your account will become more trusted and you can re-enable the privacy tools above.

## Privacy.com
[Privacy.com](https://www.privacy.com/pricing) is my first recommendation due to the fact that it is free for our purposes. You can create up to 12 new cards per month on the free plan with no domestic transaction fees. It offers both one-time and merchant-locked cards, as well transaction masking for your funding source. The funding source can be an ACH bank account or a credit card. It is well established with responsive customer service.

The downside is that if you trigger the verification system, you will be required to upload your government ID and be verified by Persona, a third party verification service that shares data to numerous [third parties](https://withpersona.com/legal/subprocessors).
## IronVest
[IronVest](https://getivy.ai/pricing) has various pros and cons compared to Privacy.com. The first con is the cost - it's lowest tier is $39 / month, and transactions costs 2.9% + $0.30. It is obviously more expensive but you get some other goodies like masked emails, masked phone numbers, and a password manager. There is a hard limit of 35 masked cards, and they do not yet offer ACH bank account funding sources.

The upside of IronVest is that their first and mandatory tier of identity verification is minimally invasive. They require your true name, address, and social security number. They inform you that they verify in-house and delete the social immediately after verification, and they provide details about encryption.

The second tier of verification may or may not be triggered. In this tier they will ask for your government ID. In my experience, this came after I had established the account and likely because I did not follow the rules I listed above.
## Klutch
Klutch is a similar option to Privacy.com where the free tier would meet most needs within this threat model, however I find their privacy policy dubious at best. Additionally, they use a third party for verification. You get 10 free masked cards per month, single use and merchant.
## Using masked cards
Masked cards can be used just like a normal credit card, except for billing address.
- Privacy.com cards - use any address
- For IronVest - 228 Park Ave S, Suite 97601 New York, NY, 10003
- Klutch - use any address

If a card number ever becomes compromised, or you experience issues with the merchant, such as unapproved charges, you can turn the card off which invalidates the credentials.
# Banks and ACH transactions
You cannot expect any real level of privacy or anonymity with banks, therefore I don't have any particular bank recommendations. I do have some generic advice - 
- Prefer banks with good account 2FA options
- Prefer banks with built in support for Zelle, which is an alternative to ACH transactions that only requires your email or phone number to approve the transaction and not your actual account number. For Zelle transactions, create a SimpleLogin email alias specifically for Zelle transactions and don't use it for anything else.
- Check your institution for privacy settings. Read the privacy policy and data share opt-outs and deletion methods. 
## ACH Transactions
Generally we should avoid ACH transactions whenever possible. We can prefer options like Zelle or aliased credit cards where we do not need to give out our bank account number, which is a very sensitive credential that cannot be aliased or changed. Zelle is an alternative to ACH transactions that only requires your email or phone number to approve the transaction and not your actual account number. For Zelle transactions, create a SimpleLogin email alias specifically for Zelle transactions and don't use it for anything else.

In the event that you need to make ACH transactions, you can protect yourself by creating an "ACH Firewall". This is a separate checking or savings account specifically for ACH transactions. Ensure this account does **not** have overdraft protection enabled - the core feature of this method is that it will decline transactions when there are no funds in the account. To use, before you make an ACH transaction, transfer the exact amount of money for the transaction to the ACH Firewall account, and initiate the transaction with the credentials for that account. After the transaction, the account balance will be zero, and any nefarious withdraw using the account number will fail.

Some banks like Ally offer recurring transfer which you can use for recurring ACH transactions. You can set one of these transfers to occur one day before the recurring transaction for automated handling of this method.
# Credit freeze
A credit freeze is an identity protection method that prevents new lines of credit from being opened in your name. This stops credit bureaus from responding to credit pulls initiated by opening credit cards, bank accounts, and loans. Additionally, companies cannot gain access to your credit report and cannot identify you as a pre-approved credit recipient, eliminating mailed credit card offers and removing you from certain databases.

Below are the three primary credit bureaus and contact information for initiating the freeze - 
- Equifax
	- Online: https://www.equifax.com/personal/credit-report-services/credit-freeze/
	- By Phone: 800-685-1111
	- By Mail: Equifax Security Freeze, PO Box 105788, Atlanta, Georgia 30348-5788
- Experian
	- Online: https://www.experian.com/freeze/center.html
	- By Phone: 888-397-3742
	- By Mail: Experian Security Freeze, PO Box 9554, Allen, TX 75013
- TransUnion
	- Online: https://service.transunion.com/dss/orderStep1_form.page
	- By Phone: 888-909-8872
	- By Mail: TransUnion LLC, PO Box 2000, Chester, PA 19016
	
Usually a PIN number will be requested that will secure the freeze and be required to un-freeze it. Make sure to save this in your password manager.
# Opt Out of Pre-Approved Credit Offers
Under the Fair Credit Reporting Act, credit bureaus can include you on marketing lists for unsolicited credit/insurance offers. These mailed offers are frequently stolen and used for identity theft. You can opt-out at https://www.optoutprescreen.com/. Choose the Permanent Opt-Out by Mail option and follow the instructions.
# Cleaning Accounts
If you are on a quest like [[Accounts and Passwords#Cleaning Old Accounts]], and would like to transition all of your existing accounts to these new payment methods, here are some tips -
- If you have a list of your subscription services (you should), change their payment methods to masked cards, delete any other cards with your real name or address
- Go through your existing accounts and delete any payment methods with your real name and address
- If you want to be very thorough you can search your email messages for phrases like "Thank you", or "Order", which may reveal purchases you have made without an account. You can contact these services and request data deletions
# Physical Protections
Physical payment protections are mostly common sense but worth discussing.
- Don't carry large amounts of cash on your person
- Store reserve cash and root credit cards in a safe in your home
- Carry cards in an RFID wallet, which protects them from unwarranted EM scans
- Shred physical receipts
- Do not read card numbers aloud in public places
- Inspect card readers before use - look for loose components, unusual overlays, or hidden cameras that indicate skimmers, especially at gas stations
- Prefer chip/contactless payment over magnetic stripe. Chip data is harder to clone than mag stripe
- Use a locking mailbox or P.O. Box to prevent theft of new cards, statements and other personal information
- Opt-in to paperless billing whenever possible
- Destroy old cards by cutting through the mag stripe and the chip
