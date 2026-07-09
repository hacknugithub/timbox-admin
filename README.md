# Timbox

Timbox is a Rails 7 application for managing employees, client users, and related business data with Devise authentication, Bootstrap styling, and Hotwire/Turbo. It is configured for local development and deployment to Fly.io.

## Tech stack

- Ruby 2.7.x
- Rails 7.0
- PostgreSQL
- Node.js 20.x
- Yarn
- Bootstrap 5
- Devise
- Hotwire (Turbo + Stimulus)

## Prerequisites

Make sure these are installed locally:

- Ruby 2.7.x
- Bundler
- PostgreSQL
- Node.js 20.x
- Yarn

## Local development

1. Clone the repository and change into the project directory.
2. Install Ruby gems:
   ```bash
   bundle install
   ```
3. Install JavaScript dependencies:
   ```bash
   yarn install
   ```
4. Create and configure the development database:
   ```bash
   bin/rails db:prepare
   ```
5. Start the app locally:
   ```bash
   bin/dev
   ```
   This runs the Rails server and the asset watcher together.

6. Open the app at:
   ```text
   http://localhost:3000
   ```

### Optional local environment variables

If you need to override the default host for mailer links or other settings, add them to your shell or a local env file:

```bash
export APP_HOST=localhost:3000
```

## Database setup

If you need to recreate the databases manually:

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

## Running tests

Run the test suite with:

```bash
bundle exec rspec
bundle exec rails test
```

## Deployment to Fly.io

This project already includes a Fly configuration file.

### 1. Install Fly CLI

Follow the official Fly.io install instructions, then log in:

```bash
fly auth login
```

### 2. Deploy the app

If the app is already configured:

```bash
fly deploy
```

If you are creating it for the first time:

```bash
fly launch --name timbox --region lax
```

### 3. Set important secrets

Set the app host and any required production secrets:

```bash
fly secrets set APP_HOST=timbox.fly.dev
```

If the app uses encrypted credentials, also set:

```bash
fly secrets set RAILS_MASTER_KEY=your_master_key_here
```

### 4. Database on Fly.io

If your Fly app needs a PostgreSQL database, create and attach one:

```bash
fly postgres create
fly postgres attach <postgres-app-name>
```

Fly deploys will run the release command from the project configuration, which includes database preparation.

## Notes

- The application uses Devise for authentication.
- Mailer links in production use the host configured by `APP_HOST` and default to `timbox.fly.dev`.
- Asset builds are handled with esbuild via the `yarn build` script.
