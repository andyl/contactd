import Config

if Mix.env == :dev do
  config :mix_test_interactive, clear: true
end

config :formin, port: 5001

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
