FROM elixir:latest

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.8 --force
RUN mix local.rebar --force

CMD ["mix", "phx.server"]
