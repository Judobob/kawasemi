json.array!(@event_times) do |event_time|
  json.extract! event_time, :id, :start_time, :end_time, :max_participants
  json.url event_time_url(event_time, format: :json)
end
