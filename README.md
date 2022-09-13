# Actions Test Repo

## Topics

- triggers
  - [events that trigger workflows](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)
  - multiple triggers
  - workflow_dispatch
  - payloads: [webhook events and payloads](https://docs.github.com/en/developers/webhooks-and-events/webhooks/webhook-events-and-payloads)
  - contexts: [contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)

- jobs
  - steps
  - runner per job
  - dependencies / needs
  - share information between jobs: outputs, artifacts

- runners: self-hosted, labels, official ones
  - pre-installed software
  - actions/setup-xxx

- docker
  - services

- secrets

- actions
  - building up from workflows
  - cool action: [actions/github-script](https://github.com/actions/github-script)
  - post job: [actions/cache](https://github.com/actions/cache)

- reusing workflows 
  - [docs on reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
  - secrets, inputs
  - nested up to four levels

- actually secret things
