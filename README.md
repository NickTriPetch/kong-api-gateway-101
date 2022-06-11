# Kong api gateway

This is simple repository for kong 101. This will describe you how kong api gateway works.

![Simple network diagrams](https://i.imgur.com/cBC8uaQ.jpg)

From figure above, you can see definition of this repository as
- Private network, we simulate this network as `kongnw`, which has simple nginx servers as microservices.
- All of those nginx servers will not expose to internet. Just only kong port `8000` and `8001`.
  - 8000 for entry port proxy.
  - 8001 for kong admin port.

## Required tools

- Docker Engine version `19.03.0 and higher` 
 [see more info](https://docs.docker.com/compose/compose-file/compose-versioning/#version-38)
- docker-compose

## Contents

* [How to start kong on your local machine](#how-to-start-kong-on-your-local-machine)
  * [How to start with DB](#how-to-start-kong-on-your-local-machine)
  * [How to start Kong DB-less mode](#how-to-start-kong-on-your-local-machine)
* [How to start Konga-UI](#how-to-start-konga-ui)

## How to start kong on your local machine

### How to start with DB

Start you docker services with these command
- step 1) run this command to copy .env values from `.env.template`
```console
$ cp .env.template .env
```
- step 2) run this command via terminal
```console
$ docker-compose up
```

### How to start Kong DB-less mode

- step 1) remove comment code on file `Dockerfile` line 8
```yaml
# from
 .
 .
9: # For Kong DB-less mode, please remove these comments below
8: # COPY ./.conf/kong.yml /home/kong/kong.yml -> 

# to
 .
 .
9: # For Kong DB-less mode, please remove these comments below
8: COPY ./.conf/kong.yml /home/kong/kong.yml -> 
```

- step 2) change your `docker-compose.yml` file as below
```yaml
# from
33:          .
34:          .
35:          .
36:  #######################################
37:  # MyKong: The API Gateway
38:  #######################################
39:  kong:
40:    build:
41:      context: .
42:      args:
43:        kong_env: local
44:    restart: on-failure
45:    environment:
46:      KONG_DATABASE: "${KONG_DATABASE_MODE:-postgres}"
47:      KONG_ADMIN_LISTEN: 0.0.0.0:${KONG_ADMIN_PORT:-8001}
48:      # DB-Less mode - close comment line 49 for kong db-less mode
49:      # KONG_DECLARATIVE_CONFIG: /home/kong/kong.yml
50:      # DB-Mode - comment line 51 - 54 for kong db-less mode
51:      KONG_PG_HOST: "${POSTGRES_HOST:-db}"
52:      KONG_PG_DATABASE: "${POSTGRES_DB:-kong}"
53:      KONG_PG_USER: "${POSTGRES_USER:-kong}"
54:      KONG_PG_PASSWORD: "${POSTGRES_PASSWORD:-kong}"
55:    depends_on:
56:          .
57:          .

-------

# from
33:          .
34:          .
35:          .
36:  #######################################
37:  # MyKong: The API Gateway
38:  #######################################
39:  kong:
40:    build:
41:      context: .
42:      args:
43:        kong_env: local
44:    restart: on-failure
45:    environment:
46:      KONG_DATABASE: "${KONG_DATABASE_MODE:-postgres}"
47:      KONG_ADMIN_LISTEN: 0.0.0.0:${KONG_ADMIN_PORT:-8001}
48:      # DB-Less mode - close comment line 49 for kong db-less mode
49:      KONG_DECLARATIVE_CONFIG: /home/kong/kong.yml
50:      # DB-Mode - comment line 51 - 54 for kong db-less mode
51:      # KONG_PG_HOST: "${POSTGRES_HOST:-db}"
52:      # KONG_PG_DATABASE: "${POSTGRES_DB:-kong}"
53:      # KONG_PG_USER: "${POSTGRES_USER:-kong}"
54:      # KONG_PG_PASSWORD: "${POSTGRES_PASSWORD:-kong}"
55:    depends_on:
56:          .
57:          .
```

- step 2) (If you have already had `.env` file then you can skip to step 3) run this command to copy .env values from `.env.template`
```console
$ cp .env.template .env
```

- step 3) change ENV variable in `.env` file
```yaml
# from
1: KONG_DATABASE_MODE=postgres

# to
1: KONG_DATABASE_MODE=off
```

- step 4) then run this command
```console
$ docker-compose up --build
```

## How to start Konga-UI
After docker services has been running and ready to start hence you can open this url `http://localhost:1337` on your browser



## References

### Kong image repository
Ref: [https://hub.docker.com/_/kong](https://hub.docker.com/_/kong)

### Konga image repository
Ref: [https://hub.docker.com/r/pantsel/konga](https://hub.docker.com/r/pantsel/konga)

### Get in touch with developers

#### Company contact
- Website : [https://www.tripetchgroup.com/en/contact](https://www.tripetchgroup.com/en/contact)
- 📧 : <a href="mailto:info@tripetchgroup.com">info@tripetchgroup.com</a>

#### Developer contact
##### emails
- 📧 : <a href="mailto:chaiwat_t@tripetch-it.co.th">chaiwat_t@tripetch-it.co.th</a>
##### websites
- 👨: [https://github.com/NickTriPetch](https://github.com/NickTriPetch)
- 👨: [https://github.com/NickUseGitHub](https://github.com/NickUseGitHub)
