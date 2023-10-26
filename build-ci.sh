pnpm build-ui && npx antora antora-playbook.yml --url=${ANTORA_SITE_URL} --html-url-extension-style=drop --key google_analytics=${ANTORA_GOOGLE_ANALYTICS_KEY} --key hubspot=${ANTORA_HUBSPOT_KEY}
