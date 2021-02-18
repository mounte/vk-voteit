# Vallhovskyrkan VoteIT

Based on https://github.com/voteit/sverok_buildout

## Environment configuration
`voteit.env` contains configuration for the voteit service.
This is our example where we use the smtprelay-service defined in the docker-compose file.
```
SMTP_HOST=smtprelay
SMTP_PORT=1025
SMTP_SENDER="email_address_of_sender@test.com"
HOST_NAME="myvoteit.domain.tld"
```
`smtprelay.env` contains the configuration for the smtp-relay to use amazon ses to send emails.
Required variables are:
```
AWS_REGION=eu-west-1
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
SMTP_RELAY_HOST=hostname.the.relay.shows.com
```

## Volumes

The docker-compose file creates these volumes:
`voteitlog` for all the voteit logs.
`zeodb` for the db-store.


## Traefik
The rule/label `"traefik.http.routers.voteit.rule...` declares how traefik should route ingress. It expands the `HOST_NAME` from the `voteit.env` so make sure to set that properly.
