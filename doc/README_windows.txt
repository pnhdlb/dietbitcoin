DietBitcoin Core
=============

Intro
-----
DietBitcoin is a free open source peer-to-peer electronic cash system that is
completely decentralized, without the need for a central server or trusted
parties.  Users hold the crypto keys to their own money and transact directly
with each other, with the help of a P2P network to check for double-spending.


Setup
-----
Unpack the files into a directory and run dietbitcoin-qt.exe.

***YOU MAY NEED A SEED NODE IN ORDER TO DOWNLOAD THE BLOCKCHAIN***

Seednodes for the dietbitcoin.conf (configuration file) can be found at dietbitcoin.org

After running dietbitcoin core for the first time, the dietbitcoin.conf file can be found
in your data folder path.

The dietbitcoin.conf file can be found in your data folder path.

dietbitcoin core uses a seed server. If you have issues bootstrapping, you may try adding the following to your dietbitcoin.conf file:

addnode=seed1.dietbitcoin.org
addnode=seed2.dietbitcoin.org

Issues connecting to the network for the first time, can typically be corrected by adding
the reindex flag in the dietbitcoin.conf file.

reindex=1




DietBitcoin Core is the original DietBitcoin client and it builds the backbone of the network.
However, it downloads and stores the entire history of DietBitcoin transactions;
depending on the speed of your computer and network connection, the synchronization
process can take anywhere from a few hours to a day or more.

