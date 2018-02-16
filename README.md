```ruby
bundle install
```

```ruby
bundle exec sidekiq
```

```ruby
bundle exec rails console
irb> 50.times { TestWorker.perform_async }
```
