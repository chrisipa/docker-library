One Time Secret
===============

One Time Secret docker image based on Debian Jessie.

# Source Code
Sources to build this docker image can be found [here](https://github.com/chrisipa/docker-library/tree/master/debian-pom/onetimesecret).

# Description
This One Time Secret docker image contains the following software components:

 - [One Time Secret](https://github.com/onetimesecret/onetimesecret)


## Ports
These One Time Secret ports are exposed:

  - 7143 (GUI)


# How to run the container

## Environment variables

When you start the One Time Secret container, you can adjust the configuration by passing one or more environment variables on the `docker run` command line:

### `OTS_SITE_HOST`

 - The hostname for the One Time Secret site
 - Default value: `localhost:7143`

### `OTS_SITE_PORT`

 - The port for the One Time Secret site
 - Default value: `7143`

### `OTS_SITE_DOMAIN`

 - The domain for the One Time Secret site
 - Default value: `localhost`

### `OTS_SITE_SSL`

 - Is ssl encryption used for the One Time Secret site?
 - Default value: `false`

### `OTS_SITE_SECRET`

 - The secret string for the One Time Secret site that is used for encryption
 - Default value: `CHANGEME`

### `OTS_REDIS_URI`

 - The URI for the connection to the Redis database
 - Default value: `redis://user:CHANGEME@127.0.0.1:7179/0?timeout=10&thread_safe=false&logging=false`

### `OTS_EMAIL_ADMIN`

 - The email address of the administrator. If you register with this address you will be admin automatically.
 - Default value: `CHANGEME@EXAMPLE.com`

### `OTS_SMTP_MODE`

 - The mode for the SMTP service.
 - Default value: `:smtp`

### `OTS_SMTP_FROM`

 - The FROM mail header for the SMTP service.
 - Default value: `delano@onetimesecret.com`

### `OTS_SMTP_HOST`

 - The hostname for the SMTP service.
 - Default value: `localhost`

### `OTS_SMTP_PORT`

 - The port for the SMTP service.
 - Default value: `25`

### `OTS_SMTP_TLS`

 - Whether to use TLS encryption for the SMTP service or not.
 - Default value: `false`

### `OTS_SMTP_USER`

 - The username for the SMTP service.
 - Default value: ``

### `OTS_SMTP_PASS`

 - The password for the SMTP service.
 - Default value: ``

### `OTS_SMTP_AUTH`

 - Whether to use authentication for the SMTP service or not.
 - Default value: ``

### `OTS_INCOMING_ENABLED`

 - Whether incoming secrets are enabled or not.
 - Default value: `false`

### `OTS_INCOMING_EMAIL`

 - The email address to which incoming secrets are sent to.
 - Default value: `example@onetimesecret.com`

### `OTS_INCOMING_PASSPHRASE`

 - The passphrase which is used for incoming secrets.
 - Default value: `CHANGEME`

### `OTS_INCOMING_REGEX`

 - The regex which is used for ticket links for incoming secrets.
 - Default value: `\\A[a-zA-Z0-9]{6}\\z`

### `OTS_STATHAT_ENABLED`

 - Whether stathat service is enabled or not.
 - Default value: `false`

### `OTS_STATHAT_API_KEY`

 - The API key for the stathat service.
 - Default value: `CHANGEME`

### `OTS_STATHAT_DEFAULT_CHART`

 - The default chart for the stathat service.
 - Default value: `CHANGEME`

### `OTS_TEXT_NONPAID_RECIPIENT`

 - The text message for non paid recipients.
 - Default value: `You need to create an account!`

### `OTS_TEXT_PAID_RECIPIENT`

 - The text message for paid recipients.
 - Default value: `Send the secret link via email`

### `OTS_LIMITS_CREATE_SECRET`

 - The API rate limit for creating secrets.
 - Default value: `250`

### `OTS_LIMITS_CREATE_ACCOUNT`

 - The API rate limit for creating accounts.
 - Default value: `10`

### `OTS_LIMITS_UPDATE_ACCOUNT`

 - The API rate limit for updating accounts.
 - Default value: `10`

### `OTS_LIMITS_EMAIL_RECIPIENT`

 - The API rate limit for email recipients.
 - Default value: `50`

### `OTS_LIMITS_SEND_FEEDBACK`

 - The API rate limit for sending feedback.
 - Default value: `10`

### `OTS_LIMITS_AUTHENTICATE_SESSION`

 - The API rate limit for authenticated sessions.
 - Default value: `5`

### `OTS_LIMITS_HOMEPAGE`

 - The API rate limit for accessing the homepage.
 - Default value: `500`

### `OTS_LIMITS_DASHBOARD`

 - The API rate limit for accessing the dashboard.
 - Default value: `1000`

### `OTS_LIMITS_FAILED_PASSPHRASE`

 - The API rate limit for failed passphrases.
 - Default value: `5`

### `OTS_LIMITS_SHOW_METADATA`

 - The API rate limit for showing metadata.
 - Default value: `1000`

### `OTS_LIMITS_SHOW_SECRET`

 - The API rate limit for showing secrets.
 - Default value: `1000`

### `OTS_LIMITS_BURN_SECRET`

 - The API rate limit for burning secrets.
 - Default value: `1000`

## Using docker

### Preparation: Create a underprivileged user on the host system

1. Create group and user:
  ```
  sudo groupadd -g 1001 chrisipa
  sudo useradd -u 1001 -g 1001 -m -s /usr/sbin/nologin chrisipa
  ```  

### Example: Real world usage running docker-compose

1. Create docker compose file `docker-compose.yml` with your configuration data:
  ```yml
  redis:
    image: redis:latest
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    ports:
      - 6379:6379

  onetimesecret:
    image: chrisipa/onetimesecret:latest
    links:
      - redis:redis
    environment:
      - OTS_SITE_SECRET=my-super-secret-encryption-string
      - OTS_REDIS_URI=redis://redis:6379/0?timeout=10&thread_safe=false&logging=false
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    ports:
      - 7143:7143
  ```

2. Run docker containers with docker compose:
  ```
  docker-compose up -d
  ```