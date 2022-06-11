FROM kong:2.8.1

LABEL maintainer="info@tripetchgroup.com"
LABEL maintainer="chaiwat_t@tripetch-it.co.th"
LABEL maintainer="nickt.tnick@gmail.com"

# For Kong DB-less mode, please remove these comments below
# COPY ./.conf/kong.yml /home/kong/kong.yml