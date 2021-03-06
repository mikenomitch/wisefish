# Wisefish

Wisefish is meant to provide a base boilerplate for quickly building out webapps.

### Backend:

- Elixir (1.7)
- Erlang/OTP (21)
- Phoenix (1.4)
- Postgres

### Frontend:

- Typescript (3)
- Webpack (4)
- Preact
- Redux

### Ops:

- Kubernetes
- GCP

## Goals

The goal of the app/repo is to lay a foundation for quick iteration on future project & toy apps.

Backend features:

- An example resource with schema/model/controller/view/routing
- A barebones user model with sign up/in/out
  - Including tokens for password reset
- Basic auth via JWTs
- Swagger API docs
- Auth credential confirmation/password resets/magic login
- Event broadcasting via Channels
- TSL/HTTPS support (TODO)
- A few simple example tests (TODO)

Frontend features:

- JS bundles with common chunks, code-splitting, & cache-busting
- Minimal css/style "framework"
  - Postcss Modules
  - SASS compilation
  - Basic variables, helper functions, and mixins
  - Normalized CSS
- Frontend routing
- Fetching with auth and call status tracking
- Gzipped and minified production build
- Redux-based data layer with DRY base reducer
- Socket connection to the backend's phoenix channels
- A few simple example tests (TODO)

Development features:

- Single command to launch app locally
- Hot loading & reloading of JS and CSS
- Backend auto-reloading
- Prettier/ESLint auto-formatting
- Elixir auto-formatting
- CSS Linting
- Shared VSCode Rules

Devops featues:

- Infrastructure in Code
- Single command deploys (TODO)
- Error Alerting (TODO)
- Logging (TODO)

## Setting Up

Local Dev Dependencies:

- psql
- elixir
- erlang
- node/npm
- webpack

`mix deps.get`
`mix ecto.create`
`mix ecto.migrate`
`cd apps/wisefish_web/lib/wisefish_web/app && npm install`

## Running Locally

Start the backend:
`iex -S mix phx.server`

Start the frontend:
`cd priv/app && npm run start`

## Deploying

Deployment Dependencies:

- docker
- kubectl
- gcloud cli
- google cloud account

## Testing

Information Coming Soon
