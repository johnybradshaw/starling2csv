#!/bin/bash
#Convert Starling JSON output to a usable CSV
#Import Secrets
source .secrets

## Request
curl "https://api.starlingbank.com/api/v1/transactions/" \
     -H 'Cookie: __cfduid=$cookie' \
     -H 'Authorization: Bearer $secret'

json2csv -i starling.json -p -f _embedded.transactions.created,_embedded.transactions.narrative,_embedded.transactions.source,_embedded.transactions.amount -u _embedded.transactions -B -o starling.csv