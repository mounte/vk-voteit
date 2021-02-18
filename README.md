# Vallhovskyrkan VoteIT

Based on https://github.com/voteit/sverok_buildout

## Environment configuration
`.env` contains configuration for the voteit service.
This is our example where we use the smtprelay-service defined in the docker-compose file.
```
# Basic container configuration
SMTP_RELAY_HOST=smtprelay
SMTP_RELAY_GIVEN_HOST=smtp.vallhovskyrkan.se
SMTP_RELAY_PORT=1025
VOTEIT_HOST_NAME=myvoteit.domain.tld

# VoteIT specifics
SMTP_SENDER="email_address_of_sender@test.com"
```
You can use some other smtp-server/relay by setting the relevant values to something else.

`aws_ses_secret.env` contains the configuration for the smtp-relay to use amazon ses to send emails.
Required variables are:
```
AWS_REGION=eu-west-1
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
```

## Volumes

The docker-compose file creates these volumes:
`voteitlog` for all the voteit logs.
`zeodb` for the db-store.


## Traefik
The rule/label `"traefik.http.routers.voteit.rule...` declares how traefik should route ingress. It expands the `VOTEIT_HOST_NAME` from the `.env` so make sure to set that properly.
