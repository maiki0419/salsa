json.array!(@schedules) do |event|
  json.id event.id
  json.title event.title
  json.start event.starts_at
  json.end event.ends_at
end