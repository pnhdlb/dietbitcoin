// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef DIETBITCOIN_QT_DIETBITCOINADDRESSVALIDATOR_H
#define DIETBITCOIN_QT_DIETBITCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class DietBitcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit DietBitcoinAddressEntryValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

/** DietBitcoin address widget validator, checks for a valid dietbitcoin address.
 */
class DietBitcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit DietBitcoinAddressCheckValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

#endif // DIETBITCOIN_QT_DIETBITCOINADDRESSVALIDATOR_H
