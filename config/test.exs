import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_view_chat, LiveViewChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "IeV/s3DIuAanNi1E2kvJTidsRrDZCAVC1Us4tgsTk6R342PERtBjOsQ1zN3btVX9",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
