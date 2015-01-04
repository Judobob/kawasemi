json.array!(@event_images) do |event_image|
  json.extract! event_image, :id, :alt_text, :description, :event_image, :event_image_thumb
  json.url event_image_url(event_image format: :json)
end
