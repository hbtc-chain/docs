# Overview of the Main Modules

## Custodian unit module
The Custodian unit module is responsible for user and operational custodian units (no private keys, and no one can operate) management, and also user-related information storage. 

The main features includes:

1. Data storage and management of the user and operational custodian units
2. Data queries related to the assets of user and operational custodian units, and sequence records

## Transfer Module

The transfer module carries all asset transactions and flows of the on-chain custodian unit, and the operational custodian unit of the system is responsible for the cross-chain assets collection.

The main features includes:

1. Asset transactions, all types of asset transactions between custodian units.
2. Cross-chain token deposit, users submit the cross-chain token deposit information to their own custodian unit, which will be added to the user's assets after consensus .
3. Cross-chain asset collection and withdrawal of the cross-chain assets deposited by users will be automatically collected into the corresponding operational custodian unit by certain policy, and users can withdraw the cross-chain tokens they deposited or traded to their accordingly addresses.

## Key Generation Module

The key generation module is responsible for interacting with Settle, generating public-private key pairs of the accordingly public chains for the user and the operational custodian units, and managing cross-chain assets.

## Token Module

The token module is mainly designed to maintain the tokens that are currently supported by various public chains and its related properties, such as the corresponding chains and whether they are the main chain tokens, etc, and only tokens in this module can be custodied traded. Currently the btc, eth, erc20, trx tokens are supported by HBTC, and other public chain tokens can be listed by future proposals.订单模块

## Order Module

The order module mainly maintains the processes that users need to confirm asynchronously , such as the creation of cross-chain asset addresses, deposits, and withdrawals, etc. It allows a transparent view of status transition processes of the user's on-chain operations

## Governance Module

HBTC Chain adopts the concept of on-chain governance by proposal approach, where all HBC holders can participate in Bluehlix's governance by initiating the proposal, pledging, and voting on the proposal (which requires pledging HBC).

## Swap Module

OpenSwap module mainly maintains on-chain assets transactions, facilitate transactions by AMM with Orderbook, and provide the accordingly incentives for liquidity providers. 

## Asset Mapping Module

Mapping module is mainly reponsible for mapping the public chain assets to another public chain at the 1:1 ratio, which can  facilitate users to transfer in/out their asset from/to another public chain, to promote the fast circulation of the assets and all mapping will be excuted and realized by proposals. 