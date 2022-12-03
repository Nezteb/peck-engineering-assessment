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
  {Finch, name: FinchHttpClient}
]

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :peck_engineering_assessment, PeckEngineeringAssessment.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "peck_engineering_assessment_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :peck_engineering_assessment, PeckEngineeringAssessmentWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "S/cjxlVYDy4OO0/muEDuiMiHNPD3tq2jWGRc861uJnNxQKCdleaf/nvelND2X1bU",
  server: false

# In test we don't send emails.
config :peck_engineering_assessment, PeckEngineeringAssessment.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# config :tesla, adapter: Tesla.Mock
