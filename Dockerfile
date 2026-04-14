FROM hmctsprod.azurecr.io/base/node:20-alpine as base
COPY --chown=hmcts:hmcts . .
RUN yarn install \
  && yarn cache clean

# ---- Runtime image ----
FROM base as runtime
RUN rm -rf webpack/ webpack.config.js
COPY --from=base $WORKDIR/src/main ./src/main

EXPOSE 3120
