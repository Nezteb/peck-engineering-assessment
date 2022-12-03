# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :peck_engineering_assessment, :children, [
  # Start the Ecto repository
  PeckEngineeringAssessment.Repo,
  # Start the Telemetry supervisor
  PeckEngineeringAssessmentWeb.Telemetry,
  # Start the PubSub system
  {Phoenix.PubSub, name: PeckEngineeringAssessment.PubSub},
  # Start the Endpoint (http/https)
  PeckEngineeringAssessmentWeb.Endpoint,
  # Start a worker by calling: PeckEngineeringAssessment.Worker.start_link(arg)
  # {PeckEngineeringAssessment.Worker, arg}
  {Finch, name: FinchHttpClient},
  {Task, fn -> PeckEngineeringAssessment.CsvImporter.import_food_trucks() end}
]

config :peck_engineering_assessment,
  ecto_repos: [PeckEngineeringAssessment.Repo]

# config :peck_engineering_assessment, PeckEngineeringAssessment.Repo,
#   migration_primary_key: [name: :location_id, type: :id]

# Configures the endpoint
config :peck_engineering_assessment, PeckEngineeringAssessmentWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: PeckEngineeringAssessmentWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: PeckEngineeringAssessment.PubSub,
  live_view: [signing_salt: "sVl5GUx/"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :peck_engineering_assessment, PeckEngineeringAssessment.Mailer,
  adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, :adapter, {Tesla.Adapter.Finch, name: FinchHttpClient}

config :peck_engineering_assessment, food_trucks_url: "https://data.sfgov.org"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
