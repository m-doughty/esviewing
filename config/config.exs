use Mix.Config

config :commanded, Esviewing.Aggregate.Viewing,
  snapshot_every: 1,
  snapshot_version: 1

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "esviewing",
  password: "esviewing",
  database: "esviewing",
  hostname: "localhost",
  pool_size: 10
