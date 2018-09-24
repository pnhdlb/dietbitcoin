Shared Libraries
================

## dietbitcoinconsensus

The purpose of this library is to make the verification functionality that is critical to DietBitcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `dietbitcoinconsensus.h` located in  `src/script/dietbitcoinconsensus.h`.

#### Version

`dietbitcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`dietbitcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `dietbitcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` s
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` 
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` 
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` 
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` 
- `dietbitcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` 

##### Errors
- `dietbitcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `dietbitcoinconsensus_verify_script` for the verification status)*
- `dietbitcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `dietbitcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `dietbitcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `dietbitcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

