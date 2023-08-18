FROM node:20.0.0 AS builder
WORKDIR /node
COPY . .
RUN --mount=type=cache,target=/usr/local/share/.cache/yarn/v6 \ 
yarn install --frozen-lockfile && yarn build

FROM node:20.0.0 AS runner
WORKDIR /node
RUN mkdir -p images/user-icon
COPY --from=builder /node/dist ./dist
COPY --from=builder /node/package* ./
ENV DD_AGENT_HOST="datadog"
ENV DD_TRACE_AGENT_HOSTNAME="datadog"
ENV DD_TRACE_AGENT_PORT="8126"
ENV DD_LOGS_INJECTION=true
ENV DD_ENV="prdvm"
LABEL "com.datadoghq.ad.check_names"='["mysql"]'
LABEL "com.datadoghq.ad.init_configs"='[{}]'
LABEL "com.datadoghq.ad.instances"='[{"server": "%%host%%", "username": "datadog","password": "datadog"}]'
RUN --mount=type=cache,target=/usr/local/share/.cache/yarn/v6 \ 
yarn install --production --frozen-lockfile
EXPOSE 8000
CMD ["yarn", "start"]
