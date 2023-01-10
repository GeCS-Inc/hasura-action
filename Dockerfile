FROM frolvlad/alpine-glibc:alpine-3.17_glibc-2.34

LABEL repository="https://github.com/tibotiber/hasura-action"
LABEL homepage="https://github.com/tibotiber/hasura-action"
LABEL maintainer="Thibaut Tiberghien <thibaut@smplrspace.com>"

LABEL com.github.actions.name="GitHub Action for Hasura"
LABEL com.github.actions.description="Wraps the Hasura CLI to enable common commands."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="gray-dark"

RUN apk add --no-cache curl bash libstdc++ jq

RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
  nslookup github.com

COPY "get-hasura-cli.sh" "/get-hasura-cli.sh"
RUN bash /get-hasura-cli.sh

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
