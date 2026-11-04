pnpm build-ui && \
npx antora antora-playbook.yml --url=${ANTORA_SITE_URL} --html-url-extension-style=indexify --key google_analytics=${ANTORA_GOOGLE_ANALYTICS_KEY} --key posthog=${ANTORA_POSTHOG_KEY} --key cio=${ANTORA_CIO_KEY} --key support_agent=${ANTORA_SUPPORT_AGENT_DOMAIN_KEY} && \
pnpm build-llms && \
pnpm add-llms-full && \
pnpm prune-sitemap
