# frozen_string_literal: true

module Events
  class Publisher
    def self.call(*args); new.call(*args); end

    def initialize(event_store: Rails.configuration.event_store)
      @event_store = event_store
    end

    def call(event:, stream: Rails.configuration.default_stream)
      @event_store.publish_event(event, stream_name: stream)
    end
  end
end
