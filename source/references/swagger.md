# HBTCChain API
## HBTCChain API v1.0

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

A REST interface for state queries, transaction generation and broadcasting.

## Transactions

Search, encode, or broadcast transactions.

### get__txs_{hash}

`GET /txs/{hash}`

*Get a Tx by hash*

Retrieve a transaction using its hash.

<h3 id="get__txs_{hash}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|hash|path|string|true|Tx hash|

> Example responses

> 200 Response

```json
{
  "hash": "D085138D913993919295FF4B0A9107F1F2CDE0D37A87CE0644E217CBF3B49656",
  "height": 368,
  "tx": {
    "msg": [
      "string"
    ],
    "fee": {
      "gas": "string",
      "amount": []
    },
    "memo": "string",
    "signature": {
      "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
      "pub_key": {
        "type": "tendermint/PubKeySecp256k1",
        "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
      },
      "account_number": "0",
      "sequence": "0"
    }
  },
  "result": {
    "log": "string",
    "gas_wanted": "200000",
    "gas_used": "26354",
    "tags": [
      {
        "key": "string",
        "value": "string"
      }
    ]
  }
}
```

<h3 id="get__txs_{hash}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Tx with the provided hash|[TxQuery](#schematxquery)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### post__txs

`POST /txs`

*Broadcast a signed tx*

Broadcast a signed tx to a full node

> Body parameter

```json
{
  "tx": {
    "msg": [
      "string"
    ],
    "fee": {
      "gas": "string",
      "amount": []
    },
    "memo": "string",
    "signature": {
      "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
      "pub_key": {
        "type": "tendermint/PubKeySecp256k1",
        "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
      },
      "account_number": "0",
      "sequence": "0"
    }
  },
  "mode": "block"
}
```

<h3 id="post__txs-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» tx|body|[StdTx](#schemastdtx)|false|none|
|»» msg|body|[[Msg](#schemamsg)]|false|none|
|»» fee|body|object|false|none|
|»»» gas|body|string|false|none|
|»»» amount|body|array|false|none|
|»»»» *anonymous*|body|any|false|none|
|»» memo|body|string|false|none|
|»» signature|body|object|false|none|
|»»» signature|body|string|false|none|
|»»» pub_key|body|object|false|none|
|»»»» type|body|string|false|none|
|»»»» value|body|string|false|none|
|»»» account_number|body|string|false|none|
|»»» sequence|body|string|false|none|
|» mode|body|string|false|none|

> Example responses

> 200 Response

```json
{
  "check_tx": {
    "code": 0,
    "data": "data",
    "log": "log",
    "gas_used": 5000,
    "gas_wanted": 10000,
    "info": "info",
    "tags": [
      "",
      ""
    ]
  },
  "deliver_tx": {
    "code": 5,
    "data": "data",
    "log": "log",
    "gas_used": 5000,
    "gas_wanted": 10000,
    "info": "info",
    "tags": [
      "",
      ""
    ]
  },
  "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "height": 0
}
```

<h3 id="post__txs-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Tx broadcasting result|[BroadcastTxCommitResult](#schemabroadcasttxcommitresult)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### post__txs_encode

`POST /txs/encode`

*Encode a transaction to the Amino wire format*

Encode a transaction (signed or not) from JSON to base64-encoded Amino serialized bytes

> Body parameter

```json
{
  "tx": {
    "msg": [
      "string"
    ],
    "fee": {
      "gas": "string",
      "amount": []
    },
    "memo": "string",
    "signature": {
      "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
      "pub_key": {
        "type": "tendermint/PubKeySecp256k1",
        "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
      },
      "account_number": "0",
      "sequence": "0"
    }
  }
}
```

<h3 id="post__txs_encode-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» tx|body|[StdTx](#schemastdtx)|false|none|
|»» msg|body|[[Msg](#schemamsg)]|false|none|
|»» fee|body|object|false|none|
|»»» gas|body|string|false|none|
|»»» amount|body|array|false|none|
|»»»» *anonymous*|body|any|false|none|
|»» memo|body|string|false|none|
|»» signature|body|object|false|none|
|»»» signature|body|string|false|none|
|»»» pub_key|body|object|false|none|
|»»»» type|body|string|false|none|
|»»»» value|body|string|false|none|
|»»» account_number|body|string|false|none|
|»»» sequence|body|string|false|none|

> Example responses

> 200 Response

```json
{
  "tx": "The base64-encoded Amino-serialized bytes for the tx"
}
```

<h3 id="post__txs_encode-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The tx was successfully decoded and re-encoded|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|The tx was malformated|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<h3 id="post__txs_encode-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» tx|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Tendermint RPC

Tendermint APIs, such as query blocks, transactions and validatorset

### get__node_info

`GET /node_info`

*The properties of the connected node*

Information about the connected node

> Example responses

> 200 Response

```json
{
  "application_version": {
    "build_tags": "string",
    "client_name": "string",
    "commit": "string",
    "go": "string",
    "name": "string",
    "server_name": "string",
    "version": "string"
  },
  "node_info": {
    "id": "string",
    "moniker": "validator-name",
    "protocol_version": {
      "p2p": 7,
      "block": 10,
      "app": 0
    },
    "network": "gaia-2",
    "channels": "string",
    "listen_addr": "192.168.56.1:26656",
    "version": "0.15.0",
    "other": {
      "tx_index": "on",
      "rpc_address": "tcp://0.0.0.0:26657"
    }
  }
}
```

<h3 id="get__node_info-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Node status|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Failed to query node status|None|

<h3 id="get__node_info-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» application_version|object|false|none|none|
|»» build_tags|string|false|none|none|
|»» client_name|string|false|none|none|
|»» commit|string|false|none|none|
|»» go|string|false|none|none|
|»» name|string|false|none|none|
|»» server_name|string|false|none|none|
|»» version|string|false|none|none|
|» node_info|object|false|none|none|
|»» id|string|false|none|none|
|»» moniker|string|false|none|none|
|»» protocol_version|object|false|none|none|
|»»» p2p|string|false|none|none|
|»»» block|string|false|none|none|
|»»» app|string|false|none|none|
|»» network|string|false|none|none|
|»» channels|string|false|none|none|
|»» listen_addr|string|false|none|none|
|»» version|string|false|none|Tendermint version|
|»» other|object|false|none|more information on versions|
|»»» tx_index|string|false|none|none|
|»»» rpc_address|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__syncing

`GET /syncing`

*Syncing state of node*

Get if the node is currently syning with other nodes

> Example responses

> 200 Response

```json
{
  "syncing": true
}
```

<h3 id="get__syncing-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Node syncing status|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<h3 id="get__syncing-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» syncing|boolean|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__blocks_latest

`GET /blocks/latest`

*Get the latest block*

> Example responses

> 200 Response

```json
{
  "block_meta": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "block_id": {
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "parts": {
        "total": 0,
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
      }
    }
  },
  "block": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "txs": [
      "string"
    ],
    "evidence": [
      "string"
    ],
    "last_commit": {
      "block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "precommits": [
        {
          "validator_address": "string",
          "validator_index": "0",
          "height": "0",
          "round": "0",
          "timestamp": "2017-12-30T05:53:09.287+01:00",
          "type": 2,
          "block_id": {
            "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
            "parts": {
              "total": 0,
              "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
            }
          },
          "signature": "7uTC74QlknqYWEwg7Vn6M8Om7FuZ0EO4bjvuj6rwH1mTUJrRuMMZvAAqT9VjNgP0RA/TDp6u/92AqrZfXJSpBQ=="
        }
      ]
    }
  }
}
```

<h3 id="get__blocks_latest-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The latest block|[BlockQuery](#schemablockquery)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__blocks_{height}

`GET /blocks/{height}`

*Get a block at a certain height*

<h3 id="get__blocks_{height}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|height|path|number|true|Block height|

> Example responses

> 200 Response

```json
{
  "block_meta": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "block_id": {
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "parts": {
        "total": 0,
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
      }
    }
  },
  "block": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "txs": [
      "string"
    ],
    "evidence": [
      "string"
    ],
    "last_commit": {
      "block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "precommits": [
        {
          "validator_address": "string",
          "validator_index": "0",
          "height": "0",
          "round": "0",
          "timestamp": "2017-12-30T05:53:09.287+01:00",
          "type": 2,
          "block_id": {
            "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
            "parts": {
              "total": 0,
              "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
            }
          },
          "signature": "7uTC74QlknqYWEwg7Vn6M8Om7FuZ0EO4bjvuj6rwH1mTUJrRuMMZvAAqT9VjNgP0RA/TDp6u/92AqrZfXJSpBQ=="
        }
      ]
    }
  }
}
```

<h3 id="get__blocks_{height}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The block at a specific height|[BlockQuery](#schemablockquery)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid height|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Request block height doesn't|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__validatorsets_latest

`GET /validatorsets/latest`

*Get the latest validator set*

> Example responses

> 200 Response

```json
{
  "block_height": "string",
  "validators": [
    {
      "address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
      "pub_key": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
      "voting_power": "1000",
      "proposer_priority": "1000"
    }
  ]
}
```

<h3 id="get__validatorsets_latest-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The validator set at the latest block height|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<h3 id="get__validatorsets_latest-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» block_height|string|false|none|none|
|» validators|[[TendermintValidator](#schematendermintvalidator)]|false|none|none|
|»» address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|»» pub_key|string|false|none|none|
|»» voting_power|string|false|none|none|
|»» proposer_priority|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__validatorsets_{height}

`GET /validatorsets/{height}`

*Get a validator set a certain height*

<h3 id="get__validatorsets_{height}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|height|path|number|true|Block height|

> Example responses

> 200 Response

```json
{
  "block_height": "string",
  "validators": [
    {
      "address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
      "pub_key": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
      "voting_power": "1000",
      "proposer_priority": "1000"
    }
  ]
}
```

<h3 id="get__validatorsets_{height}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The validator set at a specific block height|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid height|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Block at height not available|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internal error|None|

<h3 id="get__validatorsets_{height}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» block_height|string|false|none|none|
|» validators|[[TendermintValidator](#schematendermintvalidator)]|false|none|none|
|»» address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|»» pub_key|string|false|none|none|
|»» voting_power|string|false|none|none|
|»» proposer_priority|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Cu

Custodian unit module APIs

### get__cu_cus_{address}

`GET /cu/cus/{address}`

*Get the custodian unit information on blockchain*

<h3 id="get__cu_cus_{address}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|address|path|string|true|Account address|

> Example responses

> 200 Response

```json
{
  "type": "string",
  "value": {
    "cu_type": "string",
    "address": "string",
    "migration_status": "string",
    "asset_pubkey": "string",
    "asset_pubkey_epoch": "string",
    "assets": [
      {
        "address": 5.8306492960253865e+47,
        "denom": "eth",
        "enable_sendtx": true,
        "epoch": 1,
        "gas_remained": 0,
        "nonce": 0
      }
    ],
    "asset_coins_hold": [],
    "asset_coins": [],
    "coins_hold": [],
    "coins": [],
    "gas_received": [],
    "gas_used": [],
    "public_key": {
      "type": "string",
      "value": "string"
    },
    "sequence": "string"
  }
}
```

<h3 id="get__cu_cus_{address}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Account information on the blockchain|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internel error|None|

<h3 id="get__cu_cus_{address}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» type|string|false|none|none|
|» value|object|false|none|none|
|»» cu_type|string|false|none|none|
|»» address|string|false|none|none|
|»» migration_status|string|false|none|none|
|»» asset_pubkey|string|false|none|none|
|»» asset_pubkey_epoch|string|false|none|none|
|»» assets|[[Asset](#schemaasset)]|false|none|none|
|»»» address|string|false|none|none|
|»»» denom|string|false|none|none|
|»»» enable_sendtx|boolean|false|none|none|
|»»» epoch|string|false|none|none|
|»»» gas_remained|string|false|none|none|
|»»» nonce|string|false|none|none|
|»» asset_coins_hold|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» asset_coins|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» coins_hold|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» coins|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» gas_received|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» gas_used|array|false|none|none|
|»»» *anonymous*|any|false|none|none|
|»» public_key|[PublicKey](#schemapublickey)|false|none|none|
|»»» type|string|false|none|none|
|»»» value|string|false|none|none|
|»» sequence|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__cu_pending_deposit_{address}

`GET /cu/pending_deposit/{address}`

*Get the custodian unit pending deposit list*

<h3 id="get__cu_pending_deposit_{address}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|address|path|string|true|Account address|

> Example responses

> 200 Response

```json
{
  "property1": {
    "hash": "string",
    "index": "string",
    "ext_address": "string",
    "amount": "string",
    "memo": "string",
    "status": 0
  },
  "property2": {
    "hash": "string",
    "index": "string",
    "ext_address": "string",
    "amount": "string",
    "memo": "string",
    "status": 0
  }
}
```

<h3 id="get__cu_pending_deposit_{address}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|pending deposit list of address|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|invalid address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Server internel error|None|

<h3 id="get__cu_pending_deposit_{address}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» **additionalProperties**|object|false|none|none|
|»» hash|string|false|none|none|
|»» index|string|false|none|none|
|»» ext_address|string|false|none|none|
|»» amount|string|false|none|none|
|»» memo|string|false|none|none|
|»» status|number|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Staking

Stake module APIs

### get__staking_delegators_{delegatorAddr}_delegations

`GET /staking/delegators/{delegatorAddr}/delegations`

*Get all delegations from a delegator*

<h3 id="get__staking_delegators_{delegatoraddr}_delegations-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|

> Example responses

> 200 Response

```json
[
  {
    "delegator_address": "string",
    "validator_address": "string",
    "shares": "string",
    "height": 0
  }
]
```

<h3 id="get__staking_delegators_{delegatoraddr}_delegations-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_delegators_{delegatoraddr}_delegations-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Delegation](#schemadelegation)]|false|none|none|
|» delegator_address|string|false|none|none|
|» validator_address|string|false|none|none|
|» shares|string|false|none|none|
|» height|integer|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_delegators_{delegatorAddr}_delegations_{validatorAddr}

`GET /staking/delegators/{delegatorAddr}/delegations/{validatorAddr}`

*Query the current delegation between a delegator and a validator*

<h3 id="get__staking_delegators_{delegatoraddr}_delegations_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
{
  "delegator_address": "string",
  "validator_address": "string",
  "shares": "string",
  "height": 0
}
```

<h3 id="get__staking_delegators_{delegatoraddr}_delegations_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Delegation](#schemadelegation)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address or validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_delegators_{delegatorAddr}_unbonding_delegations

`GET /staking/delegators/{delegatorAddr}/unbonding_delegations`

*Get all unbonding delegations from a delegator*

<h3 id="get__staking_delegators_{delegatoraddr}_unbonding_delegations-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|

> Example responses

> 200 Response

```json
[
  {
    "delegator_address": "string",
    "validator_address": "string",
    "initial_balance": "string",
    "balance": "string",
    "creation_height": 0,
    "min_time": 0
  }
]
```

<h3 id="get__staking_delegators_{delegatoraddr}_unbonding_delegations-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_delegators_{delegatoraddr}_unbonding_delegations-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[UnbondingDelegation](#schemaunbondingdelegation)]|false|none|none|
|» delegator_address|string|false|none|none|
|» validator_address|string|false|none|none|
|» initial_balance|string|false|none|none|
|» balance|string|false|none|none|
|» creation_height|integer|false|none|none|
|» min_time|integer|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_delegators_{delegatorAddr}_unbonding_delegations_{validatorAddr}

`GET /staking/delegators/{delegatorAddr}/unbonding_delegations/{validatorAddr}`

*Query all unbonding delegations between a delegator and a validator*

<h3 id="get__staking_delegators_{delegatoraddr}_unbonding_delegations_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
{
  "delegator_address": "string",
  "validator_address": "string",
  "entries": [
    {
      "initial_balance": "string",
      "balance": "string",
      "creation_height": "string",
      "min_time": "string"
    }
  ]
}
```

<h3 id="get__staking_delegators_{delegatoraddr}_unbonding_delegations_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[UnbondingDelegationPair](#schemaunbondingdelegationpair)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address or validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_redelegations

`GET /staking/redelegations`

*Get all redelegations (filter by query params)*

<h3 id="get__staking_redelegations-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegator|query|string|false|Bech32 AccAddress of Delegator|
|validator_from|query|string|false|Bech32 ValAddress of SrcValidator|
|validator_to|query|string|false|Bech32 ValAddress of DstValidator|

> Example responses

> 200 Response

```json
[
  {
    "delegator_address": "string",
    "validator_src_address": "string",
    "validator_dst_address": "string",
    "entries": [
      {}
    ]
  }
]
```

<h3 id="get__staking_redelegations-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_redelegations-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Redelegation](#schemaredelegation)]|false|none|none|
|» delegator_address|string|false|none|none|
|» validator_src_address|string|false|none|none|
|» validator_dst_address|string|false|none|none|
|» entries|[[Redelegation](#schemaredelegation)]|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_delegators_{delegatorAddr}_validators

`GET /staking/delegators/{delegatorAddr}/validators`

*Query all validators that a delegator is bonded to*

<h3 id="get__staking_delegators_{delegatoraddr}_validators-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|

> Example responses

> 200 Response

```json
[
  {
    "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
    "consensus_pubkey": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
    "jailed": true,
    "is_key_node": true,
    "min_self_delegation": "string",
    "last_key_node_heartbeat_height": "string",
    "status": 0,
    "tokens": "string",
    "delegator_shares": "string",
    "description": {
      "moniker": "string",
      "identity": "string",
      "website": "string",
      "details": "string"
    },
    "bond_height": "0",
    "bond_intra_tx_counter": 0,
    "unbonding_height": "0",
    "unbonding_time": "1970-01-01T00:00:00Z",
    "commission": {
      "rate": "0",
      "max_rate": "0",
      "max_change_rate": "0",
      "update_time": "1970-01-01T00:00:00Z"
    }
  }
]
```

<h3 id="get__staking_delegators_{delegatoraddr}_validators-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_delegators_{delegatoraddr}_validators-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Validator](#schemavalidator)]|false|none|none|
|» operator_address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|» consensus_pubkey|string|false|none|none|
|» jailed|boolean|false|none|none|
|» is_key_node|boolean|false|none|none|
|» min_self_delegation|string|false|none|none|
|» last_key_node_heartbeat_height|string|false|none|none|
|» status|integer|false|none|none|
|» tokens|string|false|none|none|
|» delegator_shares|string|false|none|none|
|» description|object|false|none|none|
|»» moniker|string|false|none|none|
|»» identity|string|false|none|none|
|»» website|string|false|none|none|
|»» details|string|false|none|none|
|» bond_height|string|false|none|none|
|» bond_intra_tx_counter|integer|false|none|none|
|» unbonding_height|string|false|none|none|
|» unbonding_time|string|false|none|none|
|» commission|object|false|none|none|
|»» rate|string|false|none|none|
|»» max_rate|string|false|none|none|
|»» max_change_rate|string|false|none|none|
|»» update_time|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_delegators_{delegatorAddr}_validators_{validatorAddr}

`GET /staking/delegators/{delegatorAddr}/validators/{validatorAddr}`

*Query a validator that a delegator is bonded to*

<h3 id="get__staking_delegators_{delegatoraddr}_validators_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|
|validatorAddr|path|string|true|Bech32 ValAddress of Delegator|

> Example responses

> 200 Response

```json
{
  "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "consensus_pubkey": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
  "jailed": true,
  "is_key_node": true,
  "min_self_delegation": "string",
  "last_key_node_heartbeat_height": "string",
  "status": 0,
  "tokens": "string",
  "delegator_shares": "string",
  "description": {
    "moniker": "string",
    "identity": "string",
    "website": "string",
    "details": "string"
  },
  "bond_height": "0",
  "bond_intra_tx_counter": 0,
  "unbonding_height": "0",
  "unbonding_time": "1970-01-01T00:00:00Z",
  "commission": {
    "rate": "0",
    "max_rate": "0",
    "max_change_rate": "0",
    "update_time": "1970-01-01T00:00:00Z"
  }
}
```

<h3 id="get__staking_delegators_{delegatoraddr}_validators_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Validator](#schemavalidator)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address or validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_validators

`GET /staking/validators`

*Get all validator candidates. By default it returns only the bonded validators.*

<h3 id="get__staking_validators-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|status|query|string|false|The validator bond status. Must be either 'bonded', 'unbonded', or 'unbonding'.|
|page|query|integer|false|The page number.|
|limit|query|integer|false|The maximum number of items per page.|

> Example responses

> 200 Response

```json
[
  {
    "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
    "consensus_pubkey": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
    "jailed": true,
    "is_key_node": true,
    "min_self_delegation": "string",
    "last_key_node_heartbeat_height": "string",
    "status": 0,
    "tokens": "string",
    "delegator_shares": "string",
    "description": {
      "moniker": "string",
      "identity": "string",
      "website": "string",
      "details": "string"
    },
    "bond_height": "0",
    "bond_intra_tx_counter": 0,
    "unbonding_height": "0",
    "unbonding_time": "1970-01-01T00:00:00Z",
    "commission": {
      "rate": "0",
      "max_rate": "0",
      "max_change_rate": "0",
      "update_time": "1970-01-01T00:00:00Z"
    }
  }
]
```

<h3 id="get__staking_validators-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_validators-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Validator](#schemavalidator)]|false|none|none|
|» operator_address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|» consensus_pubkey|string|false|none|none|
|» jailed|boolean|false|none|none|
|» is_key_node|boolean|false|none|none|
|» min_self_delegation|string|false|none|none|
|» last_key_node_heartbeat_height|string|false|none|none|
|» status|integer|false|none|none|
|» tokens|string|false|none|none|
|» delegator_shares|string|false|none|none|
|» description|object|false|none|none|
|»» moniker|string|false|none|none|
|»» identity|string|false|none|none|
|»» website|string|false|none|none|
|»» details|string|false|none|none|
|» bond_height|string|false|none|none|
|» bond_intra_tx_counter|integer|false|none|none|
|» unbonding_height|string|false|none|none|
|» unbonding_time|string|false|none|none|
|» commission|object|false|none|none|
|»» rate|string|false|none|none|
|»» max_rate|string|false|none|none|
|»» max_change_rate|string|false|none|none|
|»» update_time|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_validators_{validatorAddr}

`GET /staking/validators/{validatorAddr}`

*Query the information from a single validator*

<h3 id="get__staking_validators_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
{
  "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "consensus_pubkey": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
  "jailed": true,
  "is_key_node": true,
  "min_self_delegation": "string",
  "last_key_node_heartbeat_height": "string",
  "status": 0,
  "tokens": "string",
  "delegator_shares": "string",
  "description": {
    "moniker": "string",
    "identity": "string",
    "website": "string",
    "details": "string"
  },
  "bond_height": "0",
  "bond_intra_tx_counter": 0,
  "unbonding_height": "0",
  "unbonding_time": "1970-01-01T00:00:00Z",
  "commission": {
    "rate": "0",
    "max_rate": "0",
    "max_change_rate": "0",
    "update_time": "1970-01-01T00:00:00Z"
  }
}
```

<h3 id="get__staking_validators_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Validator](#schemavalidator)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_validators_{validatorAddr}_delegations

`GET /staking/validators/{validatorAddr}/delegations`

*Get all delegations from a validator*

<h3 id="get__staking_validators_{validatoraddr}_delegations-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
[
  {
    "delegator_address": "string",
    "validator_address": "string",
    "shares": "string",
    "height": 0
  }
]
```

<h3 id="get__staking_validators_{validatoraddr}_delegations-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_validators_{validatoraddr}_delegations-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Delegation](#schemadelegation)]|false|none|none|
|» delegator_address|string|false|none|none|
|» validator_address|string|false|none|none|
|» shares|string|false|none|none|
|» height|integer|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_validators_{validatorAddr}_unbonding_delegations

`GET /staking/validators/{validatorAddr}/unbonding_delegations`

*Get all unbonding delegations from a validator*

<h3 id="get__staking_validators_{validatoraddr}_unbonding_delegations-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
[
  {
    "delegator_address": "string",
    "validator_address": "string",
    "initial_balance": "string",
    "balance": "string",
    "creation_height": 0,
    "min_time": 0
  }
]
```

<h3 id="get__staking_validators_{validatoraddr}_unbonding_delegations-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_validators_{validatoraddr}_unbonding_delegations-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[UnbondingDelegation](#schemaunbondingdelegation)]|false|none|none|
|» delegator_address|string|false|none|none|
|» validator_address|string|false|none|none|
|» initial_balance|string|false|none|none|
|» balance|string|false|none|none|
|» creation_height|integer|false|none|none|
|» min_time|integer|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_pool

`GET /staking/pool`

*Get the current state of the staking pool*

> Example responses

> 200 Response

```json
{
  "loose_tokens": "string",
  "bonded_tokens": "string",
  "inflation_last_time": "string",
  "inflation": "string",
  "date_last_commission_reset": "string",
  "prev_bonded_shares": "string"
}
```

<h3 id="get__staking_pool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_pool-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» loose_tokens|string|false|none|none|
|» bonded_tokens|string|false|none|none|
|» inflation_last_time|string|false|none|none|
|» inflation|string|false|none|none|
|» date_last_commission_reset|string|false|none|none|
|» prev_bonded_shares|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__staking_parameters

`GET /staking/parameters`

*Get the current staking parameter values*

> Example responses

> 200 Response

```json
{
  "max_entries": "string",
  "election_period": "string",
  "min_validator_delegation": "string",
  "min_key_node_delegation": "string",
  "max_key_node_heartbeat_interval": "string",
  "max_candidate_key_node_heartbeat_interval": "string",
  "unbonding_time": "string",
  "max_validators": 0,
  "max_key_nodes": 0,
  "bond_denom": "string"
}
```

<h3 id="get__staking_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__staking_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» max_entries|string|false|none|none|
|» election_period|string|false|none|none|
|» min_validator_delegation|string|false|none|none|
|» min_key_node_delegation|string|false|none|none|
|» max_key_node_heartbeat_interval|string|false|none|none|
|» max_candidate_key_node_heartbeat_interval|string|false|none|none|
|» unbonding_time|string|false|none|none|
|» max_validators|integer|false|none|none|
|» max_key_nodes|integer|false|none|none|
|» bond_denom|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Governance

Governance module APIs

### get__gov_proposals

`GET /gov/proposals`

*Query proposals*

Query proposals information with parameters

<h3 id="get__gov_proposals-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|voter|query|string|false|voter address|
|depositor|query|string|false|depositor address|
|status|query|string|false|proposal status, valid values can be `"deposit_period"`, `"voting_period"`, `"passed"`, `"rejected"`|

> Example responses

> 200 Response

```json
[
  {
    "proposal_id": 0,
    "title": "string",
    "description": "string",
    "proposal_type": "string",
    "proposal_status": "string",
    "final_tally_result": {
      "yes": "0.0000000000",
      "abstain": "0.0000000000",
      "no": "0.0000000000",
      "no_with_veto": "0.0000000000"
    },
    "submit_time": "string",
    "total_deposit": [],
    "voting_start_time": "string"
  }
]
```

<h3 id="get__gov_proposals-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid query parameters|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_proposals-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[TextProposal](#schematextproposal)]|false|none|none|
|» proposal_id|integer|false|none|none|
|» title|string|false|none|none|
|» description|string|false|none|none|
|» proposal_type|string|false|none|none|
|» proposal_status|string|false|none|none|
|» final_tally_result|[TallyResult](#schematallyresult)|false|none|none|
|»» yes|string|false|none|none|
|»» abstain|string|false|none|none|
|»» no|string|false|none|none|
|»» no_with_veto|string|false|none|none|
|» submit_time|string|false|none|none|
|» total_deposit|array|false|none|none|
|»» *anonymous*|any|false|none|none|
|» voting_start_time|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}

`GET /gov/proposals/{proposalId}`

*Query a proposal*

Query a proposal by id

<h3 id="get__gov_proposals_{proposalid}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|none|

> Example responses

> 200 Response

```json
{
  "proposal_id": 0,
  "title": "string",
  "description": "string",
  "proposal_type": "string",
  "proposal_status": "string",
  "final_tally_result": {
    "yes": "0.0000000000",
    "abstain": "0.0000000000",
    "no": "0.0000000000",
    "no_with_veto": "0.0000000000"
  },
  "submit_time": "string",
  "total_deposit": [],
  "voting_start_time": "string"
}
```

<h3 id="get__gov_proposals_{proposalid}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[TextProposal](#schematextproposal)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_proposer

`GET /gov/proposals/{proposalId}/proposer`

*Query proposer*

Query for the proposer for a proposal

<h3 id="get__gov_proposals_{proposalid}_proposer-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|none|

> Example responses

> 200 Response

```json
{
  "proposal_id": "string",
  "proposer": "string"
}
```

<h3 id="get__gov_proposals_{proposalid}_proposer-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Proposer](#schemaproposer)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal ID|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_deposits

`GET /gov/proposals/{proposalId}/deposits`

*Query deposits*

Query deposits by proposalId

<h3 id="get__gov_proposals_{proposalid}_deposits-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|none|

> Example responses

> 200 Response

```json
[
  {
    "amount": [],
    "proposal_id": "string",
    "depositor": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa"
  }
]
```

<h3 id="get__gov_proposals_{proposalid}_deposits-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_proposals_{proposalid}_deposits-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Deposit](#schemadeposit)]|false|none|none|
|» amount|array|false|none|none|
|»» *anonymous*|any|false|none|none|
|» proposal_id|string|false|none|none|
|» depositor|[Address](#schemaaddress)|false|none|base58 encoded address|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_deposits_{depositor}

`GET /gov/proposals/{proposalId}/deposits/{depositor}`

*Query deposit*

Query deposit by proposalId and depositor address

<h3 id="get__gov_proposals_{proposalid}_deposits_{depositor}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|proposal id|
|depositor|path|string|true|depositor account address|

> Example responses

> 200 Response

```json
{
  "amount": [],
  "proposal_id": "string",
  "depositor": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa"
}
```

<h3 id="get__gov_proposals_{proposalid}_deposits_{depositor}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Deposit](#schemadeposit)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id or depositor address|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Found no deposit|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_votes

`GET /gov/proposals/{proposalId}/votes`

*Query voters*

Query voters information by proposalId

<h3 id="get__gov_proposals_{proposalid}_votes-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|proposal id|

> Example responses

> 200 Response

```json
[
  {
    "voter": "string",
    "proposal_id": "string",
    "option": "string"
  }
]
```

<h3 id="get__gov_proposals_{proposalid}_votes-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_proposals_{proposalid}_votes-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Vote](#schemavote)]|false|none|none|
|» voter|string|false|none|none|
|» proposal_id|string|false|none|none|
|» option|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_votes_{voter}

`GET /gov/proposals/{proposalId}/votes/{voter}`

*Query vote*

Query vote information by proposal Id and voter address

<h3 id="get__gov_proposals_{proposalid}_votes_{voter}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|proposal id|
|voter|path|string|true|voter account address|

> Example responses

> 200 Response

```json
{
  "voter": "string",
  "proposal_id": "string",
  "option": "string"
}
```

<h3 id="get__gov_proposals_{proposalid}_votes_{voter}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Vote](#schemavote)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id or voter address|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Found no vote|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_proposals_{proposalId}_tally

`GET /gov/proposals/{proposalId}/tally`

*Get a proposal's tally result at the current time*

Gets a proposal's tally result at the current time. If the proposal is pending deposits (i.e status 'DepositPeriod') it returns an empty tally result.

<h3 id="get__gov_proposals_{proposalid}_tally-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|proposalId|path|string|true|proposal id|

> Example responses

> 200 Response

```json
{
  "yes": "0.0000000000",
  "abstain": "0.0000000000",
  "no": "0.0000000000",
  "no_with_veto": "0.0000000000"
}
```

<h3 id="get__gov_proposals_{proposalid}_tally-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[TallyResult](#schematallyresult)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid proposal id|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_parameters_deposit

`GET /gov/parameters/deposit`

*Query governance deposit parameters*

Query governance deposit parameters. The max_deposit_period units are in nanoseconds.

> Example responses

> 200 Response

```json
{
  "min_deposit": [],
  "max_deposit_period": "86400000000000"
}
```

<h3 id="get__gov_parameters_deposit-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|<other_path> is not a valid query request path|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Found no deposit parameters|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_parameters_deposit-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» min_deposit|array|false|none|none|
|»» *anonymous*|any|false|none|none|
|» max_deposit_period|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_parameters_tallying

`GET /gov/parameters/tallying`

*Query governance tally parameters*

Query governance tally parameters

> Example responses

> 200 Response

```json
{
  "threshold": "0.5000000000",
  "veto": "0.3340000000",
  "governance_penalty": "0.0100000000"
}
```

<h3 id="get__gov_parameters_tallying-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|<other_path> is not a valid query request path|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Found no tally parameters|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_parameters_tallying-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» threshold|string|false|none|none|
|» veto|string|false|none|none|
|» governance_penalty|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__gov_parameters_voting

`GET /gov/parameters/voting`

*Query governance voting parameters*

Query governance voting parameters. The voting_period units are in nanoseconds.

> Example responses

> 200 Response

```json
{
  "voting_period": "86400000000000"
}
```

<h3 id="get__gov_parameters_voting-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|<other_path> is not a valid query request path|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Found no voting parameters|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__gov_parameters_voting-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» voting_period|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Distribution

Fee distribution module APIs

### get__distribution_delegators_{delegatorAddr}_rewards

`GET /distribution/delegators/{delegatorAddr}/rewards`

*Get the total rewards balance from all delegations*

Get the sum of all the rewards earned by delegations by a single delegator

<h3 id="get__distribution_delegators_{delegatoraddr}_rewards-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|

> Example responses

> 200 Response

```json
{
  "rewards": [
    {
      "validator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
      "reward": []
    }
  ],
  "total": []
}
```

<h3 id="get__distribution_delegators_{delegatoraddr}_rewards-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[DelegatorTotalRewards](#schemadelegatortotalrewards)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_delegators_{delegatorAddr}_rewards_{validatorAddr}

`GET /distribution/delegators/{delegatorAddr}/rewards/{validatorAddr}`

*Query a delegation reward*

Query a single delegation reward by a delegator

<h3 id="get__distribution_delegators_{delegatoraddr}_rewards_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
[]
```

<h3 id="get__distribution_delegators_{delegatoraddr}_rewards_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__distribution_delegators_{delegatoraddr}_rewards_{validatoraddr}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» *anonymous*|any|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_delegators_{delegatorAddr}_withdraw_address

`GET /distribution/delegators/{delegatorAddr}/withdraw_address`

*Get the rewards withdrawal address*

Get the delegations' rewards withdrawal address. This is the address in which the user will receive the reward funds

<h3 id="get__distribution_delegators_{delegatoraddr}_withdraw_address-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|delegatorAddr|path|string|true|Account Address of Delegator|

> Example responses

> 200 Response

```json
"HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa"
```

<h3 id="get__distribution_delegators_{delegatoraddr}_withdraw_address-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Address](#schemaaddress)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid delegator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_validators_{validatorAddr}

`GET /distribution/validators/{validatorAddr}`

*Validator distribution information*

Query the distribution information of a single validator

<h3 id="get__distribution_validators_{validatoraddr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
{
  "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "self_bond_rewards": [],
  "val_commission": []
}
```

<h3 id="get__distribution_validators_{validatoraddr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ValidatorDistInfo](#schemavalidatordistinfo)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_validators_{validatorAddr}_outstanding_rewards

`GET /distribution/validators/{validatorAddr}/outstanding_rewards`

*Fee distribution outstanding rewards of a single validator*

<h3 id="get__distribution_validators_{validatoraddr}_outstanding_rewards-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
[]
```

<h3 id="get__distribution_validators_{validatoraddr}_outstanding_rewards-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__distribution_validators_{validatoraddr}_outstanding_rewards-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» *anonymous*|any|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_validators_{validatorAddr}_rewards

`GET /distribution/validators/{validatorAddr}/rewards`

*Commission and self-delegation rewards of a single validator*

Query the commission and self-delegation rewards of validator.

<h3 id="get__distribution_validators_{validatoraddr}_rewards-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|validatorAddr|path|string|true|Bech32 OperatorAddress of validator|

> Example responses

> 200 Response

```json
[]
```

<h3 id="get__distribution_validators_{validatoraddr}_rewards-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__distribution_validators_{validatoraddr}_rewards-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» *anonymous*|any|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_community_pool

`GET /distribution/community_pool`

*Community pool parameters*

> Example responses

> 200 Response

```json
[]
```

<h3 id="get__distribution_community_pool-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__distribution_community_pool-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» *anonymous*|any|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__distribution_parameters

`GET /distribution/parameters`

*Fee distribution parameters*

> Example responses

> 200 Response

```json
{
  "base_proposer_reward": "string",
  "bonus_proposer_reward": "string",
  "community_tax": "string"
}
```

<h3 id="get__distribution_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__distribution_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» base_proposer_reward|string|false|none|none|
|» bonus_proposer_reward|string|false|none|none|
|» community_tax|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Supply

Supply module APIs

### get__supply_total

`GET /supply/total`

*Total supply of coins in the chain*

> Example responses

> 200 Response

```json
{
  "total": []
}
```

<h3 id="get__supply_total-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Supply](#schemasupply)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__supply_total_{denomination}

`GET /supply/total/{denomination}`

*Total supply of a single coin denomination*

<h3 id="get__supply_total_{denomination}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|denomination|path|string|true|Coin denomination|

> Example responses

> 200 Response

```json
"string"
```

<h3 id="get__supply_total_{denomination}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid coin denomination|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__supply_burned

`GET /supply/burned`

*Amount of burned coins in the chain*

> Example responses

> 200 Response

```json
{
  "total": []
}
```

<h3 id="get__supply_burned-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Supply](#schemasupply)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__supply_burned_{denomination}

`GET /supply/burned/{denomination}`

*Burned amount of a single coin denomination*

<h3 id="get__supply_burned_{denomination}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|denomination|path|string|true|Coin denomination|

> Example responses

> 200 Response

```json
"string"
```

<h3 id="get__supply_burned_{denomination}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid coin denomination|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

## Slashing

Slashing module APIs

### get__slashing_signing_infos

`GET /slashing/signing_infos`

*Get sign info of given all validators*

Get sign info of all validators

<h3 id="get__slashing_signing_infos-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer|true|Page number|
|limit|query|integer|true|Maximum number of items per page|

> Example responses

> 200 Response

```json
[
  {
    "start_height": "string",
    "index_offset": "string",
    "jailed_until": "string",
    "missed_blocks_counter": "string"
  }
]
```

<h3 id="get__slashing_signing_infos-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid validator public key for one of the validators|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__slashing_signing_infos-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[SigningInfo](#schemasigninginfo)]|false|none|none|
|» start_height|string|false|none|none|
|» index_offset|string|false|none|none|
|» jailed_until|string|false|none|none|
|» missed_blocks_counter|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__slashing_parameters

`GET /slashing/parameters`

*Get the current slashing parameters*

> Example responses

> 200 Response

```json
{
  "max_evidence_age": "string",
  "signed_blocks_window": "string",
  "min_signed_per_window": "string",
  "double_sign_unbond_duration": "string",
  "downtime_unbond_duration": "string",
  "slash_fraction_double_sign": "string",
  "slash_fraction_downtime": "string"
}
```

<h3 id="get__slashing_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__slashing_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» max_evidence_age|string|false|none|none|
|» signed_blocks_window|string|false|none|none|
|» min_signed_per_window|string|false|none|none|
|» double_sign_unbond_duration|string|false|none|none|
|» downtime_unbond_duration|string|false|none|none|
|» slash_fraction_double_sign|string|false|none|none|
|» slash_fraction_downtime|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Mint

Minting module APIs

### get__minting_parameters

`GET /minting/parameters`

*Minting module parameters*

> Example responses

> 200 Response

```json
{
  "mint_denom": "string",
  "inflation": "string",
  "mint_per_block": "string"
}
```

<h3 id="get__minting_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__minting_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» mint_denom|string|false|none|none|
|» inflation|string|false|none|none|
|» mint_per_block|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Misc

Miscellaneous APIs

### get__gas_price

`GET /gas_price`

*Suggest a gas price*

Suggest for a reasonable gas price from the last [count] blocks

<h3 id="get__gas_price-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|count|query|number|false|How many block to consider for suggesting gas price. Default to 12|

> Example responses

> 200 Response

```json
[
  {
    "denom": "string",
    "amount": "string"
  }
]
```

<h3 id="get__gas_price-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The suggested gas price|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid count|None|

<h3 id="get__gas_price-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» denom|string|false|none|none|
|» amount|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Token

Token module APIs

### get__token_info_{denom}

`GET /token/info/{denom}`

*Information about a token denomination*

<h3 id="get__token_info_{denom}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|denom|path|string|true|Token denomination|

> Example responses

> 200 Response

```json
{
  "block_height": "string",
  "result": {
    "symbol": "hbc",
    "issuer": "",
    "chain": "hbc",
    "type": "2",
    "is_send_enabled": true,
    "is_deposit_enabled": false,
    "is_withdrawal_enabled": false,
    "decimals": "18",
    "total_supply": "0",
    "collect_threshold": "0",
    "deposit_threshold": "0",
    "open_fee": "1000000000000000000",
    "sys_open_fee": "1000000000000000000",
    "withdrawal_fee_rate": "2.0",
    "max_op_cu_number": "3",
    "sys_transfer_num": "0",
    "op_cu_sys_transfer_num": "0",
    "gas_limit": "1000000",
    "gas_price": "1",
    "confirmations": "1",
    "is_nonce_based": false
  }
}
```

<h3 id="get__token_info_{denom}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid token denomination|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__token_info_{denom}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» block_height|string|false|none|none|
|» result|[Token](#schematoken)|false|none|none|
|»» symbol|string|false|none|none|
|»» issuer|string|false|none|none|
|»» chain|string|false|none|none|
|»» type|string|false|none|none|
|»» is_send_enabled|boolean|false|none|none|
|»» is_deposit_enabled|boolean|false|none|none|
|»» is_withdrawal_enabled|boolean|false|none|none|
|»» decimals|string|false|none|none|
|»» total_supply|string|false|none|none|
|»» collect_threshold|string|false|none|none|
|»» deposit_threshold|string|false|none|none|
|»» open_fee|string|false|none|none|
|»» sys_open_fee|string|false|none|none|
|»» withdrawal_fee_rate|string|false|none|none|
|»» max_op_cu_number|string|false|none|none|
|»» sys_transfer_num|string|false|none|none|
|»» op_cu_sys_transfer_num|string|false|none|none|
|»» gas_limit|string|false|none|none|
|»» gas_price|string|false|none|none|
|»» confirmations|string|false|none|none|
|»» is_nonce_based|boolean|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__token_tokens

`GET /token/tokens`

*Query all tokens.*

> Example responses

> 200 Response

```json
[
  {
    "symbol": "hbc",
    "issuer": "",
    "chain": "hbc",
    "type": "2",
    "is_send_enabled": true,
    "is_deposit_enabled": false,
    "is_withdrawal_enabled": false,
    "decimals": "18",
    "total_supply": "0",
    "collect_threshold": "0",
    "deposit_threshold": "0",
    "open_fee": "1000000000000000000",
    "sys_open_fee": "1000000000000000000",
    "withdrawal_fee_rate": "2.0",
    "max_op_cu_number": "3",
    "sys_transfer_num": "0",
    "op_cu_sys_transfer_num": "0",
    "gas_limit": "1000000",
    "gas_price": "1",
    "confirmations": "1",
    "is_nonce_based": false
  }
]
```

<h3 id="get__token_tokens-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__token_tokens-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Token](#schematoken)]|false|none|none|
|» symbol|string|false|none|none|
|» issuer|string|false|none|none|
|» chain|string|false|none|none|
|» type|string|false|none|none|
|» is_send_enabled|boolean|false|none|none|
|» is_deposit_enabled|boolean|false|none|none|
|» is_withdrawal_enabled|boolean|false|none|none|
|» decimals|string|false|none|none|
|» total_supply|string|false|none|none|
|» collect_threshold|string|false|none|none|
|» deposit_threshold|string|false|none|none|
|» open_fee|string|false|none|none|
|» sys_open_fee|string|false|none|none|
|» withdrawal_fee_rate|string|false|none|none|
|» max_op_cu_number|string|false|none|none|
|» sys_transfer_num|string|false|none|none|
|» op_cu_sys_transfer_num|string|false|none|none|
|» gas_limit|string|false|none|none|
|» gas_price|string|false|none|none|
|» confirmations|string|false|none|none|
|» is_nonce_based|boolean|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Order

Order module APIs

### get__order_info_{orderId}

`GET /order/info/{orderId}`

*Information of an order*

<h3 id="get__order_info_{orderid}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|orderId|path|string|true|order ID|

> Example responses

> 200 Response

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "key_nodes": [
    "string"
  ],
  "sign_threshold": 0,
  "to": "string",
  "open_fee": [],
  "multi_sign_address": "string",
  "pubkey": "string",
  "epoch": "string"
}
```

<h3 id="get__order_info_{orderid}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid order ID|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__order_process_list

`GET /order/process_list`

*List of process order id*

> Example responses

> 200 Response

```json
[
  "string"
]
```

<h3 id="get__order_process_list-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__order_process_list-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication
</aside>

## Mapping

Mapping module APIs

### get__mapping

`GET /mapping`

*Query list of mappings*

<h3 id="get__mapping-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|integer|false|The page number.|
|limit|query|integer|false|The maximum number of items per page.|

> Example responses

> 200 Response

```json
{
  "block_height": "string",
  "result": [
    {
      "issue_symbol": "cbtc",
      "target_symbol": "btc",
      "total_supply": "2100000000000000",
      "issue_pool": "2099999900000000",
      "enabled": true
    }
  ]
}
```

<h3 id="get__mapping-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__mapping-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» block_height|string|false|none|none|
|» result|[[MappingInfo](#schemamappinginfo)]|false|none|none|
|»» issue_symbol|string|false|none|issue symbol as mapping source|
|»» target_symbol|string|false|none|target symbol as mapping target|
|»» total_supply|string|false|none|total supply for both issue and target symbols|
|»» issue_pool|string|false|none|current amount locked in the issue pool|
|»» enabled|boolean|false|none|whether the mapping is enabled|

<aside class="success">
This operation does not require authentication
</aside>

### get__mapping_{issue-symbol}

`GET /mapping/{issue-symbol}`

*Query mapping info specified by an issue symbol.*

<h3 id="get__mapping_{issue-symbol}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|issue-symbol|path|string|true|The issue symbol of the mapping info to query.|

> Example responses

> 200 Response

```json
{
  "block_height": "string",
  "result": {
    "issue_symbol": "cbtc",
    "target_symbol": "btc",
    "total_supply": "2100000000000000",
    "issue_pool": "2099999900000000",
    "enabled": true
  }
}
```

<h3 id="get__mapping_{issue-symbol}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid token denomination|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__mapping_{issue-symbol}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» block_height|string|false|none|none|
|» result|[MappingInfo](#schemamappinginfo)|false|none|none|
|»» issue_symbol|string|false|none|issue symbol as mapping source|
|»» target_symbol|string|false|none|target symbol as mapping target|
|»» total_supply|string|false|none|total supply for both issue and target symbols|
|»» issue_pool|string|false|none|current amount locked in the issue pool|
|»» enabled|boolean|false|none|whether the mapping is enabled|

<aside class="success">
This operation does not require authentication
</aside>

## Keygen

Keygen module APIs

### get__keygen_wait_assign

`GET /keygen/wait_assign`

*Query all wait assign keygen order ids.*

> Example responses

> 200 Response

```json
[
  "string"
]
```

<h3 id="get__keygen_wait_assign-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__keygen_wait_assign-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication
</aside>

## Openswap

Openswap module APIs

### get__openswap_pair_{tokenA}_{tokenB}

`GET /openswap/pair/{tokenA}/{tokenB}`

*Query openswap trading pair by tokens*

<h3 id="get__openswap_pair_{tokena}_{tokenb}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|tokenA|path|string|true|Trading pair Token A|
|tokenB|path|string|true|Trading pair Token B|

> Example responses

> 200 Response

```json
{
  "token_a": "btc",
  "token_b": "usdt",
  "token_a_amount": "100",
  "token_b_amount": "10000",
  "total_liquidity": "1000"
}
```

<h3 id="get__openswap_pair_{tokena}_{tokenb}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid token name|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_pair_{tokena}_{tokenb}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» token_a|string|false|none|none|
|» token_b|string|false|none|none|
|» token_a_amount|string|false|none|none|
|» token_b_amount|string|false|none|none|
|» total_liquidity|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_pairs

`GET /openswap/pairs`

*Query openswap all trading pair*

> Example responses

> 200 Response

```json
[
  {
    "token_a": "btc",
    "token_b": "usdt",
    "token_a_amount": "100",
    "token_b_amount": "10000",
    "total_liquidity": "1000"
  }
]
```

<h3 id="get__openswap_pairs-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_pairs-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» token_a|string|false|none|none|
|» token_b|string|false|none|none|
|» token_a_amount|string|false|none|none|
|» token_b_amount|string|false|none|none|
|» total_liquidity|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_liquidity_{addr}

`GET /openswap/liquidity/{addr}`

*Query openswap liquidity by account address*

<h3 id="get__openswap_liquidity_{addr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|addr|path|string|true|Account address|

> Example responses

> 200 Response

```json
[
  {
    "trading_pair": {
      "token_a": "btc",
      "token_b": "usdt",
      "token_a_amount": "100",
      "token_b_amount": "10000",
      "total_liquidity": "1000"
    },
    "liquidity": "100",
    "liquidity_share": "0.1"
  }
]
```

<h3 id="get__openswap_liquidity_{addr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_liquidity_{addr}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» trading_pair|object|false|none|none|
|»» token_a|string|false|none|none|
|»» token_b|string|false|none|none|
|»» token_a_amount|string|false|none|none|
|»» token_b_amount|string|false|none|none|
|»» total_liquidity|string|false|none|none|
|» liquidity|string|false|none|none|
|» liquidity_share|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_orderbook_{pair}

`GET /openswap/orderbook/{pair}`

*Query orderbook of a trading pair*

<h3 id="get__openswap_orderbook_{pair}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|pair|path|string|true|token pair|
|merge|query|boolean|false|whether to merge the orderbook|

> Example responses

> 200 Response

```json
{
  "buy": [
    {
      "order_id": "eba67e0b-e4d7-4584-af5a-4e9f58a484d9",
      "from": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "referer": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "receiver": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "created_time": 1602661457,
      "expired_time": -1,
      "finished_time": 1602661857,
      "status": "string",
      "side": "string",
      "base_symbol": "btc",
      "quote_symbol": "usdt",
      "price": 172.323,
      "amount_int": 1000,
      "locked_fund": 1000
    }
  ],
  "sell": [
    {
      "order_id": "eba67e0b-e4d7-4584-af5a-4e9f58a484d9",
      "from": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "referer": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "receiver": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
      "created_time": 1602661457,
      "expired_time": -1,
      "finished_time": 1602661857,
      "status": "string",
      "side": "string",
      "base_symbol": "btc",
      "quote_symbol": "usdt",
      "price": 172.323,
      "amount_int": 1000,
      "locked_fund": 1000
    }
  ]
}
```

<h3 id="get__openswap_orderbook_{pair}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid trading pair|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_orderbook_{pair}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» buy|[[OpenswapOrder](#schemaopenswaporder)]|false|none|none|
|»» order_id|string|false|none|none|
|»» from|string|false|none|none|
|»» referer|string|false|none|none|
|»» receiver|string|false|none|none|
|»» created_time|string|false|none|none|
|»» expired_time|string|false|none|none|
|»» finished_time|string|false|none|none|
|»» status|string|false|none|none|
|»» side|string|false|none|none|
|»» base_symbol|string|false|none|none|
|»» quote_symbol|string|false|none|none|
|»» price|string|false|none|none|
|»» amount_int|string|false|none|none|
|»» locked_fund|string|false|none|none|
|» sell|[[OpenswapOrder](#schemaopenswaporder)]|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_order_{orderID}

`GET /openswap/order/{orderID}`

*Query a limit-price order information*

<h3 id="get__openswap_order_{orderid}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|orderID|path|string|true|none|

> Example responses

> 200 Response

```json
{
  "order_id": "eba67e0b-e4d7-4584-af5a-4e9f58a484d9",
  "from": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "referer": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "receiver": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "created_time": 1602661457,
  "expired_time": -1,
  "finished_time": 1602661857,
  "status": "string",
  "side": "string",
  "base_symbol": "btc",
  "quote_symbol": "usdt",
  "price": 172.323,
  "amount_int": 1000,
  "locked_fund": 1000
}
```

<h3 id="get__openswap_order_{orderid}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[OpenswapOrder](#schemaopenswaporder)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_pending_orders_{pair}_{addr}

`GET /openswap/pending_orders/{pair}/{addr}`

*Query a pending orders of an address*

<h3 id="get__openswap_pending_orders_{pair}_{addr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|pair|path|string|true|token pair|
|addr|path|string|true|address|

> Example responses

> 200 Response

```json
[
  {
    "order_id": "eba67e0b-e4d7-4584-af5a-4e9f58a484d9",
    "from": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
    "referer": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
    "receiver": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
    "created_time": 1602661457,
    "expired_time": -1,
    "finished_time": 1602661857,
    "status": "string",
    "side": "string",
    "base_symbol": "btc",
    "quote_symbol": "usdt",
    "price": 172.323,
    "amount_int": 1000,
    "locked_fund": 1000
  }
]
```

<h3 id="get__openswap_pending_orders_{pair}_{addr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid trading pair|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_pending_orders_{pair}_{addr}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[OpenswapOrder](#schemaopenswaporder)]|false|none|none|
|» order_id|string|false|none|none|
|» from|string|false|none|none|
|» referer|string|false|none|none|
|» receiver|string|false|none|none|
|» created_time|string|false|none|none|
|» expired_time|string|false|none|none|
|» finished_time|string|false|none|none|
|» status|string|false|none|none|
|» side|string|false|none|none|
|» base_symbol|string|false|none|none|
|» quote_symbol|string|false|none|none|
|» price|string|false|none|none|
|» amount_int|string|false|none|none|
|» locked_fund|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_earnings_{addr}

`GET /openswap/earnings/{addr}`

*Query unclaimed earnings of an address*

<h3 id="get__openswap_earnings_{addr}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|addr|path|string|true|address|

> Example responses

> 200 Response

```json
[
  {
    "token_a": "btc",
    "token_b": "usdt",
    "amount": 1000.121
  }
]
```

<h3 id="get__openswap_earnings_{addr}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_earnings_{addr}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» token_a|string|false|none|none|
|» token_b|string|false|none|none|
|» amount|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__openswap_parameters

`GET /openswap/parameters`

*Query parameters of openswap module*

> Example responses

> 200 Response

```json
{
  "minimum_liquidity": "string",
  "fee_rate": "string",
  "repurchase_rate": "string",
  "referer_transaction_bonus_rate": "string",
  "referer_mining_bonus_rate": "string",
  "mining_weights": [
    {
      "token_a": "string",
      "token_b": "string",
      "weight": "string"
    }
  ],
  "mining_plans": [
    {
      "start_height": "string",
      "mining_per_block": "string"
    }
  ]
}
```

<h3 id="get__openswap_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__openswap_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» minimum_liquidity|string|false|none|none|
|» fee_rate|string|false|none|none|
|» repurchase_rate|string|false|none|none|
|» referer_transaction_bonus_rate|string|false|none|none|
|» referer_mining_bonus_rate|string|false|none|none|
|» mining_weights|[object]|false|none|none|
|»» token_a|string|false|none|none|
|»» token_b|string|false|none|none|
|»» weight|string|false|none|none|
|» mining_plans|[object]|false|none|none|
|»» start_height|string|false|none|none|
|»» mining_per_block|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Hrc20

### get__hrc20_parameters

`GET /hrc20/parameters`

*Query the hrc20 module's parameters*

> Example responses

> 200 Response

```json
{
  "issue_token_fee": "string"
}
```

<h3 id="get__hrc20_parameters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__hrc20_parameters-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» issue_token_fee|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Transfer

### post__transfer_accounts_{address}_transfers

`POST /transfer/accounts/{address}/transfers`

*Send coins to a address*

> Body parameter

```json
{
  "base_req": {
    "from": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
    "memo": "Sent via hbtcchain 🚀",
    "chain_id": "hbtc-testnet",
    "account_number": "0",
    "sequence": "1",
    "gas": "200000",
    "gas_adjustment": "1.2",
    "fees": [],
    "simulate": false
  },
  "amount": "0.0100000000"
}
```

<h3 id="post__transfer_accounts_{address}_transfers-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» base_req|body|[BaseReq](#schemabasereq)|false|none|
|»» from|body|string|false|Sender address or Keybase name to generate a transaction|
|»» memo|body|string|false|none|
|»» chain_id|body|string|false|none|
|»» account_number|body|string|false|none|
|»» sequence|body|string|false|none|
|»» gas|body|string|false|none|
|»» gas_adjustment|body|string|false|none|
|»» fees|body|array|false|none|
|»»» *anonymous*|body|any|false|none|
|»» simulate|body|boolean|false|Estimate gas for a transaction (cannot be used in conjunction with generate_only)|
|» amount|body|string|false|none|
|address|path|string|true|Account address|

> Example responses

> 200 Response

```json
{
  "msg": [
    "string"
  ],
  "fee": {
    "gas": "string",
    "amount": []
  },
  "memo": "string",
  "signature": {
    "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
    "pub_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
    },
    "account_number": "0",
    "sequence": "0"
  }
}
```

<h3 id="post__transfer_accounts_{address}_transfers-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|The transaction was succesfully generated|[StdTx](#schemastdtx)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid account address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

### get__transfer_balances_{address}

`GET /transfer/balances/{address}`

*Query account balance info*

<h3 id="get__transfer_balances_{address}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|address|path|string|true|Account address|

> Example responses

> 200 Response

```json
{
  "coins": []
}
```

<h3 id="get__transfer_balances_{address}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid account address|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__transfer_balances_{address}-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» coins|array|false|none|none|
|»» *anonymous*|any|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Upgrade

### get__upgrade_current

`GET /upgrade/current`

*Query currently scheduled upgrade plan*

> Example responses

> 200 Response

```json
{
  "name": "string",
  "time": "string",
  "height": 0,
  "info": "string"
}
```

<h3 id="get__upgrade_current-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<h3 id="get__upgrade_current-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» name|string|false|none|none|
|» time|string|false|none|none|
|» height|number|false|none|none|
|» info|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

### get__upgrade_applied_{name}

`GET /upgrade/applied/{name}`

*Query height at which the given upgrade was executed*

<h3 id="get__upgrade_applied_{name}-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|name|path|string|true|Plan name|

> Example responses

> 200 Response

```json
0
```

<h3 id="get__upgrade_applied_{name}-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|number|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid plan name|None|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|None|

<aside class="success">
This operation does not require authentication
</aside>

## DataStructure

### CheckTxResult
<!-- backwards compatibility -->
<a id="schemachecktxresult"></a>
<a id="schema_CheckTxResult"></a>
<a id="tocSchecktxresult"></a>
<a id="tocschecktxresult"></a>

```json
{
  "code": 0,
  "data": "data",
  "log": "log",
  "gas_used": 5000,
  "gas_wanted": 10000,
  "info": "info",
  "tags": [
    "",
    ""
  ]
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code|integer|false|none|none|
|data|string|false|none|none|
|gas_used|integer|false|none|none|
|gas_wanted|integer|false|none|none|
|info|string|false|none|none|
|log|string|false|none|none|
|tags|[[KVPair](#schemakvpair)]|false|none|none|

### DeliverTxResult
<!-- backwards compatibility -->
<a id="schemadelivertxresult"></a>
<a id="schema_DeliverTxResult"></a>
<a id="tocSdelivertxresult"></a>
<a id="tocsdelivertxresult"></a>

```json
{
  "code": 5,
  "data": "data",
  "log": "log",
  "gas_used": 5000,
  "gas_wanted": 10000,
  "info": "info",
  "tags": [
    "",
    ""
  ]
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code|integer|false|none|none|
|data|string|false|none|none|
|gas_used|integer|false|none|none|
|gas_wanted|integer|false|none|none|
|info|string|false|none|none|
|log|string|false|none|none|
|tags|[[KVPair](#schemakvpair)]|false|none|none|

### BroadcastTxCommitResult
<!-- backwards compatibility -->
<a id="schemabroadcasttxcommitresult"></a>
<a id="schema_BroadcastTxCommitResult"></a>
<a id="tocSbroadcasttxcommitresult"></a>
<a id="tocsbroadcasttxcommitresult"></a>

```json
{
  "check_tx": {
    "code": 0,
    "data": "data",
    "log": "log",
    "gas_used": 5000,
    "gas_wanted": 10000,
    "info": "info",
    "tags": [
      "",
      ""
    ]
  },
  "deliver_tx": {
    "code": 5,
    "data": "data",
    "log": "log",
    "gas_used": 5000,
    "gas_wanted": 10000,
    "info": "info",
    "tags": [
      "",
      ""
    ]
  },
  "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "height": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|check_tx|[CheckTxResult](#schemachecktxresult)|false|none|none|
|deliver_tx|[DeliverTxResult](#schemadelivertxresult)|false|none|none|
|hash|[Hash](#schemahash)|false|none|none|
|height|integer|false|none|none|

### KVPair
<!-- backwards compatibility -->
<a id="schemakvpair"></a>
<a id="schema_KVPair"></a>
<a id="tocSkvpair"></a>
<a id="tocskvpair"></a>

```json
{
  "key": "string",
  "value": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|key|string|false|none|none|
|value|string|false|none|none|

### Msg
<!-- backwards compatibility -->
<a id="schemamsg"></a>
<a id="schema_Msg"></a>
<a id="tocSmsg"></a>
<a id="tocsmsg"></a>

```json
"string"

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

### Address
<!-- backwards compatibility -->
<a id="schemaaddress"></a>
<a id="schema_Address"></a>
<a id="tocSaddress"></a>
<a id="tocsaddress"></a>

```json
"HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa"

```

base58 encoded address

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|base58 encoded address|

### ValidatorAddress
<!-- backwards compatibility -->
<a id="schemavalidatoraddress"></a>
<a id="schema_ValidatorAddress"></a>
<a id="tocSvalidatoraddress"></a>
<a id="tocsvalidatoraddress"></a>

```json
"hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx"

```

bech32 encoded address

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|bech32 encoded address|

### Asset
<!-- backwards compatibility -->
<a id="schemaasset"></a>
<a id="schema_Asset"></a>
<a id="tocSasset"></a>
<a id="tocsasset"></a>

```json
{
  "address": 5.8306492960253865e+47,
  "denom": "eth",
  "enable_sendtx": true,
  "epoch": 1,
  "gas_remained": 0,
  "nonce": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|address|string|false|none|none|
|denom|string|false|none|none|
|enable_sendtx|boolean|false|none|none|
|epoch|string|false|none|none|
|gas_remained|string|false|none|none|
|nonce|string|false|none|none|

### Hash
<!-- backwards compatibility -->
<a id="schemahash"></a>
<a id="schema_Hash"></a>
<a id="tocShash"></a>
<a id="tocshash"></a>

```json
"EE5F3404034C524501629B56E0DDC38FAD651F04"

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

### TxQuery
<!-- backwards compatibility -->
<a id="schematxquery"></a>
<a id="schema_TxQuery"></a>
<a id="tocStxquery"></a>
<a id="tocstxquery"></a>

```json
{
  "hash": "D085138D913993919295FF4B0A9107F1F2CDE0D37A87CE0644E217CBF3B49656",
  "height": 368,
  "tx": {
    "msg": [
      "string"
    ],
    "fee": {
      "gas": "string",
      "amount": []
    },
    "memo": "string",
    "signature": {
      "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
      "pub_key": {
        "type": "tendermint/PubKeySecp256k1",
        "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
      },
      "account_number": "0",
      "sequence": "0"
    }
  },
  "result": {
    "log": "string",
    "gas_wanted": "200000",
    "gas_used": "26354",
    "tags": [
      {
        "key": "string",
        "value": "string"
      }
    ]
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|hash|string|false|none|none|
|height|number|false|none|none|
|tx|[StdTx](#schemastdtx)|false|none|none|
|result|object|false|none|none|
|» log|string|false|none|none|
|» gas_wanted|string|false|none|none|
|» gas_used|string|false|none|none|
|» tags|[[KVPair](#schemakvpair)]|false|none|none|

### StdTx
<!-- backwards compatibility -->
<a id="schemastdtx"></a>
<a id="schema_StdTx"></a>
<a id="tocSstdtx"></a>
<a id="tocsstdtx"></a>

```json
{
  "msg": [
    "string"
  ],
  "fee": {
    "gas": "string",
    "amount": []
  },
  "memo": "string",
  "signature": {
    "signature": "MEUCIQD02fsDPra8MtbRsyB1w7bqTM55Wu138zQbFcWx4+CFyAIge5WNPfKIuvzBZ69MyqHsqD8S1IwiEp+iUb6VSdtlpgY=",
    "pub_key": {
      "type": "tendermint/PubKeySecp256k1",
      "value": "Avz04VhtKJh8ACCVzlI8aTosGy0ikFXKIVHQ3jKMrosH"
    },
    "account_number": "0",
    "sequence": "0"
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|msg|[[Msg](#schemamsg)]|false|none|none|
|fee|object|false|none|none|
|» gas|string|false|none|none|
|» amount|[[Coin](#schemacoin)]|false|none|none|
|memo|string|false|none|none|
|signature|object|false|none|none|
|» signature|string|false|none|none|
|» pub_key|object|false|none|none|
|»» type|string|false|none|none|
|»» value|string|false|none|none|
|» account_number|string|false|none|none|
|» sequence|string|false|none|none|

### BlockID
<!-- backwards compatibility -->
<a id="schemablockid"></a>
<a id="schema_BlockID"></a>
<a id="tocSblockid"></a>
<a id="tocsblockid"></a>

```json
{
  "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "parts": {
    "total": 0,
    "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|hash|[Hash](#schemahash)|false|none|none|
|parts|object|false|none|none|
|» total|number|false|none|none|
|» hash|[Hash](#schemahash)|false|none|none|

### BlockHeader
<!-- backwards compatibility -->
<a id="schemablockheader"></a>
<a id="schema_BlockHeader"></a>
<a id="tocSblockheader"></a>
<a id="tocsblockheader"></a>

```json
{
  "chain_id": "hbtc-testnet",
  "height": 1,
  "time": "2017-12-30T05:53:09.287+01:00",
  "num_txs": 0,
  "last_block_id": {
    "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "parts": {
      "total": 0,
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
    }
  },
  "total_txs": 35,
  "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
  "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
  "version": {
    "block": 10,
    "app": 0
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|chain_id|string|false|none|none|
|height|number|false|none|none|
|time|string|false|none|none|
|num_txs|number|false|none|none|
|last_block_id|[BlockID](#schemablockid)|false|none|none|
|total_txs|number|false|none|none|
|last_commit_hash|[Hash](#schemahash)|false|none|none|
|data_hash|[Hash](#schemahash)|false|none|none|
|validators_hash|[Hash](#schemahash)|false|none|none|
|next_validators_hash|[Hash](#schemahash)|false|none|none|
|consensus_hash|[Hash](#schemahash)|false|none|none|
|app_hash|[Hash](#schemahash)|false|none|none|
|last_results_hash|[Hash](#schemahash)|false|none|none|
|evidence_hash|[Hash](#schemahash)|false|none|none|
|proposer_address|[Address](#schemaaddress)|false|none|base58 encoded address|
|version|object|false|none|none|
|» block|string|false|none|none|
|» app|string|false|none|none|

### Block
<!-- backwards compatibility -->
<a id="schemablock"></a>
<a id="schema_Block"></a>
<a id="tocSblock"></a>
<a id="tocsblock"></a>

```json
{
  "header": {
    "chain_id": "hbtc-testnet",
    "height": 1,
    "time": "2017-12-30T05:53:09.287+01:00",
    "num_txs": 0,
    "last_block_id": {
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "parts": {
        "total": 0,
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
      }
    },
    "total_txs": 35,
    "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
    "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
    "version": {
      "block": 10,
      "app": 0
    }
  },
  "txs": [
    "string"
  ],
  "evidence": [
    "string"
  ],
  "last_commit": {
    "block_id": {
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "parts": {
        "total": 0,
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
      }
    },
    "precommits": [
      {
        "validator_address": "string",
        "validator_index": "0",
        "height": "0",
        "round": "0",
        "timestamp": "2017-12-30T05:53:09.287+01:00",
        "type": 2,
        "block_id": {
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
          "parts": {
            "total": 0,
            "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
          }
        },
        "signature": "7uTC74QlknqYWEwg7Vn6M8Om7FuZ0EO4bjvuj6rwH1mTUJrRuMMZvAAqT9VjNgP0RA/TDp6u/92AqrZfXJSpBQ=="
      }
    ]
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|header|[BlockHeader](#schemablockheader)|false|none|none|
|txs|[string]|false|none|none|
|evidence|[string]|false|none|none|
|last_commit|object|false|none|none|
|» block_id|[BlockID](#schemablockid)|false|none|none|
|» precommits|[object]|false|none|none|
|»» validator_address|string|false|none|none|
|»» validator_index|string|false|none|none|
|»» height|string|false|none|none|
|»» round|string|false|none|none|
|»» timestamp|string|false|none|none|
|»» type|number|false|none|none|
|»» block_id|[BlockID](#schemablockid)|false|none|none|
|»» signature|string|false|none|none|

### BlockQuery
<!-- backwards compatibility -->
<a id="schemablockquery"></a>
<a id="schema_BlockQuery"></a>
<a id="tocSblockquery"></a>
<a id="tocsblockquery"></a>

```json
{
  "block_meta": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "block_id": {
      "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "parts": {
        "total": 0,
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
      }
    }
  },
  "block": {
    "header": {
      "chain_id": "hbtc-testnet",
      "height": 1,
      "time": "2017-12-30T05:53:09.287+01:00",
      "num_txs": 0,
      "last_block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "total_txs": 35,
      "last_commit_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "data_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "next_validators_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "consensus_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "app_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "last_results_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "evidence_hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
      "proposer_address": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
      "version": {
        "block": 10,
        "app": 0
      }
    },
    "txs": [
      "string"
    ],
    "evidence": [
      "string"
    ],
    "last_commit": {
      "block_id": {
        "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
        "parts": {
          "total": 0,
          "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
        }
      },
      "precommits": [
        {
          "validator_address": "string",
          "validator_index": "0",
          "height": "0",
          "round": "0",
          "timestamp": "2017-12-30T05:53:09.287+01:00",
          "type": 2,
          "block_id": {
            "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04",
            "parts": {
              "total": 0,
              "hash": "EE5F3404034C524501629B56E0DDC38FAD651F04"
            }
          },
          "signature": "7uTC74QlknqYWEwg7Vn6M8Om7FuZ0EO4bjvuj6rwH1mTUJrRuMMZvAAqT9VjNgP0RA/TDp6u/92AqrZfXJSpBQ=="
        }
      ]
    }
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|block_meta|object|false|none|none|
|» header|[BlockHeader](#schemablockheader)|false|none|none|
|» block_id|[BlockID](#schemablockid)|false|none|none|
|block|[Block](#schemablock)|false|none|none|

### DelegationDelegatorReward
<!-- backwards compatibility -->
<a id="schemadelegationdelegatorreward"></a>
<a id="schema_DelegationDelegatorReward"></a>
<a id="tocSdelegationdelegatorreward"></a>
<a id="tocsdelegationdelegatorreward"></a>

```json
{
  "validator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "reward": []
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|validator_address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|reward|[[Coin](#schemacoin)]|false|none|none|

### DelegatorTotalRewards
<!-- backwards compatibility -->
<a id="schemadelegatortotalrewards"></a>
<a id="schema_DelegatorTotalRewards"></a>
<a id="tocSdelegatortotalrewards"></a>
<a id="tocsdelegatortotalrewards"></a>

```json
{
  "rewards": [
    {
      "validator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
      "reward": []
    }
  ],
  "total": []
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|rewards|[[DelegationDelegatorReward](#schemadelegationdelegatorreward)]|false|none|none|
|total|[[Coin](#schemacoin)]|false|none|none|

### BaseReq
<!-- backwards compatibility -->
<a id="schemabasereq"></a>
<a id="schema_BaseReq"></a>
<a id="tocSbasereq"></a>
<a id="tocsbasereq"></a>

```json
{
  "from": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa",
  "memo": "Sent via hbtcchain 🚀",
  "chain_id": "hbtc-testnet",
  "account_number": "0",
  "sequence": "1",
  "gas": "200000",
  "gas_adjustment": "1.2",
  "fees": [],
  "simulate": false
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|from|string|false|none|Sender address or Keybase name to generate a transaction|
|memo|string|false|none|none|
|chain_id|string|false|none|none|
|account_number|string|false|none|none|
|sequence|string|false|none|none|
|gas|string|false|none|none|
|gas_adjustment|string|false|none|none|
|fees|[[Coin](#schemacoin)]|false|none|none|
|simulate|boolean|false|none|Estimate gas for a transaction (cannot be used in conjunction with generate_only)|

### TendermintValidator
<!-- backwards compatibility -->
<a id="schematendermintvalidator"></a>
<a id="schema_TendermintValidator"></a>
<a id="tocStendermintvalidator"></a>
<a id="tocstendermintvalidator"></a>

```json
{
  "address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "pub_key": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
  "voting_power": "1000",
  "proposer_priority": "1000"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|pub_key|string|false|none|none|
|voting_power|string|false|none|none|
|proposer_priority|string|false|none|none|

### TextProposal
<!-- backwards compatibility -->
<a id="schematextproposal"></a>
<a id="schema_TextProposal"></a>
<a id="tocStextproposal"></a>
<a id="tocstextproposal"></a>

```json
{
  "proposal_id": 0,
  "title": "string",
  "description": "string",
  "proposal_type": "string",
  "proposal_status": "string",
  "final_tally_result": {
    "yes": "0.0000000000",
    "abstain": "0.0000000000",
    "no": "0.0000000000",
    "no_with_veto": "0.0000000000"
  },
  "submit_time": "string",
  "total_deposit": [],
  "voting_start_time": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|proposal_id|integer|false|none|none|
|title|string|false|none|none|
|description|string|false|none|none|
|proposal_type|string|false|none|none|
|proposal_status|string|false|none|none|
|final_tally_result|[TallyResult](#schematallyresult)|false|none|none|
|submit_time|string|false|none|none|
|total_deposit|[[Coin](#schemacoin)]|false|none|none|
|voting_start_time|string|false|none|none|

### Proposer
<!-- backwards compatibility -->
<a id="schemaproposer"></a>
<a id="schema_Proposer"></a>
<a id="tocSproposer"></a>
<a id="tocsproposer"></a>

```json
{
  "proposal_id": "string",
  "proposer": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|proposal_id|string|false|none|none|
|proposer|string|false|none|none|

### Deposit
<!-- backwards compatibility -->
<a id="schemadeposit"></a>
<a id="schema_Deposit"></a>
<a id="tocSdeposit"></a>
<a id="tocsdeposit"></a>

```json
{
  "amount": [],
  "proposal_id": "string",
  "depositor": "HBCTxmVA5pjFxUgU2UEzWipuDw1K2XaEzuKa"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|[[Coin](#schemacoin)]|false|none|none|
|proposal_id|string|false|none|none|
|depositor|[Address](#schemaaddress)|false|none|base58 encoded address|

### TallyResult
<!-- backwards compatibility -->
<a id="schematallyresult"></a>
<a id="schema_TallyResult"></a>
<a id="tocStallyresult"></a>
<a id="tocstallyresult"></a>

```json
{
  "yes": "0.0000000000",
  "abstain": "0.0000000000",
  "no": "0.0000000000",
  "no_with_veto": "0.0000000000"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|yes|string|false|none|none|
|abstain|string|false|none|none|
|no|string|false|none|none|
|no_with_veto|string|false|none|none|

### CUKeyGen
<!-- backwards compatibility -->
<a id="schemacukeygen"></a>
<a id="schema_CUKeyGen"></a>
<a id="tocScukeygen"></a>
<a id="tocscukeygen"></a>

```json
{
  "FromCU": "string",
  "ToCU": "string",
  "OrderID": "string",
  "Symobl": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|FromCU|string|false|none|none|
|ToCU|string|false|none|none|
|OrderID|string|false|none|none|
|Symobl|string|false|none|none|

### CUDeposit
<!-- backwards compatibility -->
<a id="schemacudeposit"></a>
<a id="schema_CUDeposit"></a>
<a id="tocScudeposit"></a>
<a id="tocscudeposit"></a>

```json
{
  "FromCU": "string",
  "ToCU": "string",
  "ToAddr": "string",
  "Symobl": "string",
  "Amount": 0,
  "TxHash": "string",
  "Index": 0,
  "Height": 0,
  "OrderID": "string",
  "Memo": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|FromCU|string|false|none|none|
|ToCU|string|false|none|none|
|ToAddr|string|false|none|none|
|Symobl|string|false|none|none|
|Amount|number|false|none|none|
|TxHash|string|false|none|none|
|Index|number|false|none|none|
|Height|number|false|none|none|
|OrderID|string|false|none|none|
|Memo|string|false|none|none|

### CUWithdrawal
<!-- backwards compatibility -->
<a id="schemacuwithdrawal"></a>
<a id="schema_CUWithdrawal"></a>
<a id="tocScuwithdrawal"></a>
<a id="tocscuwithdrawal"></a>

```json
{
  "FromCU": "string",
  "ToAddr": "string",
  "Symobl": "string",
  "Amount": 0,
  "GasFee": 0,
  "OrderID": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|FromCU|string|false|none|none|
|ToAddr|string|false|none|none|
|Symobl|string|false|none|none|
|Amount|number|false|none|none|
|GasFee|number|false|none|none|
|OrderID|string|false|none|none|

### Vote
<!-- backwards compatibility -->
<a id="schemavote"></a>
<a id="schema_Vote"></a>
<a id="tocSvote"></a>
<a id="tocsvote"></a>

```json
{
  "voter": "string",
  "proposal_id": "string",
  "option": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|voter|string|false|none|none|
|proposal_id|string|false|none|none|
|option|string|false|none|none|

### Validator
<!-- backwards compatibility -->
<a id="schemavalidator"></a>
<a id="schema_Validator"></a>
<a id="tocSvalidator"></a>
<a id="tocsvalidator"></a>

```json
{
  "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "consensus_pubkey": "hbcvalconspub1zcjduepq6f9zhhlwne7gkx0yrpg3ff3xe4yl6eu977mjjexlf5jjspjq26zqmyekwd",
  "jailed": true,
  "is_key_node": true,
  "min_self_delegation": "string",
  "last_key_node_heartbeat_height": "string",
  "status": 0,
  "tokens": "string",
  "delegator_shares": "string",
  "description": {
    "moniker": "string",
    "identity": "string",
    "website": "string",
    "details": "string"
  },
  "bond_height": "0",
  "bond_intra_tx_counter": 0,
  "unbonding_height": "0",
  "unbonding_time": "1970-01-01T00:00:00Z",
  "commission": {
    "rate": "0",
    "max_rate": "0",
    "max_change_rate": "0",
    "update_time": "1970-01-01T00:00:00Z"
  }
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|operator_address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|consensus_pubkey|string|false|none|none|
|jailed|boolean|false|none|none|
|is_key_node|boolean|false|none|none|
|min_self_delegation|string|false|none|none|
|last_key_node_heartbeat_height|string|false|none|none|
|status|integer|false|none|none|
|tokens|string|false|none|none|
|delegator_shares|string|false|none|none|
|description|object|false|none|none|
|» moniker|string|false|none|none|
|» identity|string|false|none|none|
|» website|string|false|none|none|
|» details|string|false|none|none|
|bond_height|string|false|none|none|
|bond_intra_tx_counter|integer|false|none|none|
|unbonding_height|string|false|none|none|
|unbonding_time|string|false|none|none|
|commission|object|false|none|none|
|» rate|string|false|none|none|
|» max_rate|string|false|none|none|
|» max_change_rate|string|false|none|none|
|» update_time|string|false|none|none|

### Delegation
<!-- backwards compatibility -->
<a id="schemadelegation"></a>
<a id="schema_Delegation"></a>
<a id="tocSdelegation"></a>
<a id="tocsdelegation"></a>

```json
{
  "delegator_address": "string",
  "validator_address": "string",
  "shares": "string",
  "height": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|delegator_address|string|false|none|none|
|validator_address|string|false|none|none|
|shares|string|false|none|none|
|height|integer|false|none|none|

### UnbondingDelegationPair
<!-- backwards compatibility -->
<a id="schemaunbondingdelegationpair"></a>
<a id="schema_UnbondingDelegationPair"></a>
<a id="tocSunbondingdelegationpair"></a>
<a id="tocsunbondingdelegationpair"></a>

```json
{
  "delegator_address": "string",
  "validator_address": "string",
  "entries": [
    {
      "initial_balance": "string",
      "balance": "string",
      "creation_height": "string",
      "min_time": "string"
    }
  ]
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|delegator_address|string|false|none|none|
|validator_address|string|false|none|none|
|entries|[[UnbondingEntries](#schemaunbondingentries)]|false|none|none|

### UnbondingEntries
<!-- backwards compatibility -->
<a id="schemaunbondingentries"></a>
<a id="schema_UnbondingEntries"></a>
<a id="tocSunbondingentries"></a>
<a id="tocsunbondingentries"></a>

```json
{
  "initial_balance": "string",
  "balance": "string",
  "creation_height": "string",
  "min_time": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|initial_balance|string|false|none|none|
|balance|string|false|none|none|
|creation_height|string|false|none|none|
|min_time|string|false|none|none|

### UnbondingDelegation
<!-- backwards compatibility -->
<a id="schemaunbondingdelegation"></a>
<a id="schema_UnbondingDelegation"></a>
<a id="tocSunbondingdelegation"></a>
<a id="tocsunbondingdelegation"></a>

```json
{
  "delegator_address": "string",
  "validator_address": "string",
  "initial_balance": "string",
  "balance": "string",
  "creation_height": 0,
  "min_time": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|delegator_address|string|false|none|none|
|validator_address|string|false|none|none|
|initial_balance|string|false|none|none|
|balance|string|false|none|none|
|creation_height|integer|false|none|none|
|min_time|integer|false|none|none|

### Redelegation
<!-- backwards compatibility -->
<a id="schemaredelegation"></a>
<a id="schema_Redelegation"></a>
<a id="tocSredelegation"></a>
<a id="tocsredelegation"></a>

```json
{
  "delegator_address": "string",
  "validator_src_address": "string",
  "validator_dst_address": "string",
  "entries": [
    {
      "delegator_address": "string",
      "validator_src_address": "string",
      "validator_dst_address": "string",
      "entries": []
    }
  ]
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|delegator_address|string|false|none|none|
|validator_src_address|string|false|none|none|
|validator_dst_address|string|false|none|none|
|entries|[[Redelegation](#schemaredelegation)]|false|none|none|

### RedelegationEntry
<!-- backwards compatibility -->
<a id="schemaredelegationentry"></a>
<a id="schema_RedelegationEntry"></a>
<a id="tocSredelegationentry"></a>
<a id="tocsredelegationentry"></a>

```json
{
  "creation_height": 0,
  "completion_time": 0,
  "initial_balance": "string",
  "balance": "string",
  "shares_dst": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|creation_height|integer|false|none|none|
|completion_time|integer|false|none|none|
|initial_balance|string|false|none|none|
|balance|string|false|none|none|
|shares_dst|string|false|none|none|

### ValidatorDistInfo
<!-- backwards compatibility -->
<a id="schemavalidatordistinfo"></a>
<a id="schema_ValidatorDistInfo"></a>
<a id="tocSvalidatordistinfo"></a>
<a id="tocsvalidatordistinfo"></a>

```json
{
  "operator_address": "hbcvaloper1we2ufxj2wpanrhzd2h7upw07hffudxfw472txx",
  "self_bond_rewards": [],
  "val_commission": []
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|operator_address|[ValidatorAddress](#schemavalidatoraddress)|false|none|bech32 encoded address|
|self_bond_rewards|[[Coin](#schemacoin)]|false|none|none|
|val_commission|[[Coin](#schemacoin)]|false|none|none|

### PublicKey
<!-- backwards compatibility -->
<a id="schemapublickey"></a>
<a id="schema_PublicKey"></a>
<a id="tocSpublickey"></a>
<a id="tocspublickey"></a>

```json
{
  "type": "string",
  "value": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|type|string|false|none|none|
|value|string|false|none|none|

### SigningInfo
<!-- backwards compatibility -->
<a id="schemasigninginfo"></a>
<a id="schema_SigningInfo"></a>
<a id="tocSsigninginfo"></a>
<a id="tocssigninginfo"></a>

```json
{
  "start_height": "string",
  "index_offset": "string",
  "jailed_until": "string",
  "missed_blocks_counter": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|start_height|string|false|none|none|
|index_offset|string|false|none|none|
|jailed_until|string|false|none|none|
|missed_blocks_counter|string|false|none|none|

### ParamChange
<!-- backwards compatibility -->
<a id="schemaparamchange"></a>
<a id="schema_ParamChange"></a>
<a id="tocSparamchange"></a>
<a id="tocsparamchange"></a>

```json
{
  "subspace": "staking",
  "key": "MaxValidators",
  "subkey": "",
  "value": {}
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|subspace|string|false|none|none|
|key|string|false|none|none|
|subkey|string|false|none|none|
|value|object|false|none|none|

### Supply
<!-- backwards compatibility -->
<a id="schemasupply"></a>
<a id="schema_Supply"></a>
<a id="tocSsupply"></a>
<a id="tocssupply"></a>

```json
{
  "total": []
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|total|[[Coin](#schemacoin)]|false|none|none|

### Token
<!-- backwards compatibility -->
<a id="schematoken"></a>
<a id="schema_Token"></a>
<a id="tocStoken"></a>
<a id="tocstoken"></a>

```json
{
  "symbol": "hbc",
  "issuer": "",
  "chain": "hbc",
  "type": "2",
  "is_send_enabled": true,
  "is_deposit_enabled": false,
  "is_withdrawal_enabled": false,
  "decimals": "18",
  "total_supply": "0",
  "collect_threshold": "0",
  "deposit_threshold": "0",
  "open_fee": "1000000000000000000",
  "sys_open_fee": "1000000000000000000",
  "withdrawal_fee_rate": "2.0",
  "max_op_cu_number": "3",
  "sys_transfer_num": "0",
  "op_cu_sys_transfer_num": "0",
  "gas_limit": "1000000",
  "gas_price": "1",
  "confirmations": "1",
  "is_nonce_based": false
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|symbol|string|false|none|none|
|issuer|string|false|none|none|
|chain|string|false|none|none|
|type|string|false|none|none|
|is_send_enabled|boolean|false|none|none|
|is_deposit_enabled|boolean|false|none|none|
|is_withdrawal_enabled|boolean|false|none|none|
|decimals|string|false|none|none|
|total_supply|string|false|none|none|
|collect_threshold|string|false|none|none|
|deposit_threshold|string|false|none|none|
|open_fee|string|false|none|none|
|sys_open_fee|string|false|none|none|
|withdrawal_fee_rate|string|false|none|none|
|max_op_cu_number|string|false|none|none|
|sys_transfer_num|string|false|none|none|
|op_cu_sys_transfer_num|string|false|none|none|
|gas_limit|string|false|none|none|
|gas_price|string|false|none|none|
|confirmations|string|false|none|none|
|is_nonce_based|boolean|false|none|none|

### Order
<!-- backwards compatibility -->
<a id="schemaorder"></a>
<a id="schema_Order"></a>
<a id="tocSorder"></a>
<a id="tocsorder"></a>

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "key_nodes": [
    "string"
  ],
  "sign_threshold": 0,
  "to": "string",
  "open_fee": [],
  "multi_sign_address": "string",
  "pubkey": "string",
  "epoch": "string"
}

```

#### Properties

oneOf

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[OrderKeyGen](#schemaorderkeygen)|false|none|none|

xor

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[OrderCollect](#schemaordercollect)|false|none|none|

xor

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[OrderWithdrawal](#schemaorderwithdrawal)|false|none|none|

xor

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[OrderSysTransfer](#schemaordersystransfer)|false|none|none|

### OrderKeyGen
<!-- backwards compatibility -->
<a id="schemaorderkeygen"></a>
<a id="schema_OrderKeyGen"></a>
<a id="tocSorderkeygen"></a>
<a id="tocsorderkeygen"></a>

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "key_nodes": [
    "string"
  ],
  "sign_threshold": 0,
  "to": "string",
  "open_fee": [],
  "multi_sign_address": "string",
  "pubkey": "string",
  "epoch": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cu_address|string|false|none|none|
|id|string|false|none|none|
|order_type|number|false|none|none|
|symbol|string|false|none|none|
|status|number|false|none|none|
|height|number|false|none|none|
|key_nodes|[string]|false|none|none|
|sign_threshold|number|false|none|none|
|to|string|false|none|none|
|open_fee|[[Coin](#schemacoin)]|false|none|none|
|multi_sign_address|string|false|none|none|
|pubkey|string|false|none|none|
|epoch|string|false|none|none|

### OrderCollect
<!-- backwards compatibility -->
<a id="schemaordercollect"></a>
<a id="schema_OrderCollect"></a>
<a id="tocSordercollect"></a>
<a id="tocsordercollect"></a>

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "collect_from_cu": "string",
  "collect_from_address": "string",
  "collect_to_cu": "string",
  "amount": "string",
  "gas_price": "string",
  "gas_limit": "string",
  "cost_fee": "string",
  "tx_hash": "string",
  "index": 0,
  "memo": "string",
  "raw_data": "string",
  "signed_Tx": "string",
  "ext_txhash": "string",
  "depositstatus": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cu_address|string|false|none|none|
|id|string|false|none|none|
|order_type|number|false|none|none|
|symbol|string|false|none|none|
|status|number|false|none|none|
|height|number|false|none|none|
|collect_from_cu|string|false|none|none|
|collect_from_address|string|false|none|none|
|collect_to_cu|string|false|none|none|
|amount|string|false|none|none|
|gas_price|string|false|none|none|
|gas_limit|string|false|none|none|
|cost_fee|string|false|none|none|
|tx_hash|string|false|none|none|
|index|number|false|none|none|
|memo|string|false|none|none|
|raw_data|string|false|none|none|
|signed_Tx|string|false|none|none|
|ext_txhash|string|false|none|none|
|depositstatus|number|false|none|none|

### OrderWithdrawal
<!-- backwards compatibility -->
<a id="schemaorderwithdrawal"></a>
<a id="schema_OrderWithdrawal"></a>
<a id="tocSorderwithdrawal"></a>
<a id="tocsorderwithdrawal"></a>

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "amount": "string",
  "gas_fee": "string",
  "cost_fee": "string",
  "withdraw_to_address": "string",
  "from_address": "string",
  "opcu_address": "string",
  "utxoin_num": 0,
  "tx_hash": "string",
  "raw_data": "string",
  "signed_tx": "string",
  "withdraw_status": 0
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cu_address|string|false|none|none|
|id|string|false|none|none|
|order_type|number|false|none|none|
|symbol|string|false|none|none|
|status|number|false|none|none|
|height|number|false|none|none|
|amount|string|false|none|none|
|gas_fee|string|false|none|none|
|cost_fee|string|false|none|none|
|withdraw_to_address|string|false|none|none|
|from_address|string|false|none|none|
|opcu_address|string|false|none|none|
|utxoin_num|number|false|none|none|
|tx_hash|string|false|none|none|
|raw_data|string|false|none|none|
|signed_tx|string|false|none|none|
|withdraw_status|number|false|none|none|

### OrderSysTransfer
<!-- backwards compatibility -->
<a id="schemaordersystransfer"></a>
<a id="schema_OrderSysTransfer"></a>
<a id="tocSordersystransfer"></a>
<a id="tocsordersystransfer"></a>

```json
{
  "cu_address": "string",
  "id": "string",
  "order_type": 0,
  "symbol": "string",
  "status": 0,
  "height": 0,
  "amount": "string",
  "cost_fee": "string",
  "to_cu": "string",
  "to_address": "string",
  "from_address": "string",
  "opcu_address": "string",
  "tx_hash": "string",
  "raw_data": "string",
  "signed_tx": "string"
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|cu_address|string|false|none|none|
|id|string|false|none|none|
|order_type|number|false|none|none|
|symbol|string|false|none|none|
|status|number|false|none|none|
|height|number|false|none|none|
|amount|string|false|none|none|
|cost_fee|string|false|none|none|
|to_cu|string|false|none|none|
|to_address|string|false|none|none|
|from_address|string|false|none|none|
|opcu_address|string|false|none|none|
|tx_hash|string|false|none|none|
|raw_data|string|false|none|none|
|signed_tx|string|false|none|none|

### MappingInfo
<!-- backwards compatibility -->
<a id="schemamappinginfo"></a>
<a id="schema_MappingInfo"></a>
<a id="tocSmappinginfo"></a>
<a id="tocsmappinginfo"></a>

```json
{
  "issue_symbol": "cbtc",
  "target_symbol": "btc",
  "total_supply": "2100000000000000",
  "issue_pool": "2099999900000000",
  "enabled": true
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|issue_symbol|string|false|none|issue symbol as mapping source|
|target_symbol|string|false|none|target symbol as mapping target|
|total_supply|string|false|none|total supply for both issue and target symbols|
|issue_pool|string|false|none|current amount locked in the issue pool|
|enabled|boolean|false|none|whether the mapping is enabled|

### OpenswapOrder
<!-- backwards compatibility -->
<a id="schemaopenswaporder"></a>
<a id="schema_OpenswapOrder"></a>
<a id="tocSopenswaporder"></a>
<a id="tocsopenswaporder"></a>

```json
{
  "order_id": "eba67e0b-e4d7-4584-af5a-4e9f58a484d9",
  "from": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "referer": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "receiver": "HBCPWdYBMJRLt929pSfoJPTW7y5hao9CFN12",
  "created_time": 1602661457,
  "expired_time": -1,
  "finished_time": 1602661857,
  "status": "string",
  "side": "string",
  "base_symbol": "btc",
  "quote_symbol": "usdt",
  "price": 172.323,
  "amount_int": 1000,
  "locked_fund": 1000
}

```

#### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|order_id|string|false|none|none|
|from|string|false|none|none|
|referer|string|false|none|none|
|receiver|string|false|none|none|
|created_time|string|false|none|none|
|expired_time|string|false|none|none|
|finished_time|string|false|none|none|
|status|string|false|none|none|
|side|string|false|none|none|
|base_symbol|string|false|none|none|
|quote_symbol|string|false|none|none|
|price|string|false|none|none|
|amount_int|string|false|none|none|
|locked_fund|string|false|none|none|

