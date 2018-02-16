class TestWorker
  include Sidekiq::Worker

  WorkerEvent = Class.new(RubyEventStore::Event)

  def perform(*args)
    publish_event(WorkerEvent, 'Some message')
  end

  def publish_event(event_klass, custom_message, args = [])
    event_data = {
      worker_id: try(:jid),
      worker_class: self.class.name,
      args: args,
      message: custom_message
    }

    Events::Publisher.call(
      event: event_klass.new(data: event_data),
      stream: :workers_log
    )
  end
end
