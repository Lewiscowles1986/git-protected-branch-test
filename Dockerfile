FROM debian:buster-slim

RUN apt-get update && apt-get install -yqq git-core

RUN adduser --system --shell /bin/sh --gecos 'git version control' --group --disabled-password --home /home/git git

WORKDIR /home/git

RUN mkdir -p /home/git/repositories


RUN git init --bare repositories/test-repo.git
COPY ./server-hooks/pre-receive /home/git/repositories/test-repo.git/hooks/pre-receive
RUN chown -R git /home/git
USER git

EXPOSE 9418

CMD ["git", "daemon", "--reuseaddr", "--base-path=/home/git/repositories", "--export-all", "--enable=receive-pack", "--verbose"]
