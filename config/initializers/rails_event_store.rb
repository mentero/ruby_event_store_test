Rails.configuration.to_prepare do
  Rails.configuration.default_stream = RubyEventStore::GLOBAL_STREAM
  Rails.configuration.event_store = RubyEventStore::Client.new(
    repository: ::RubyEventStore::InMemoryRepository.new
  )
end
