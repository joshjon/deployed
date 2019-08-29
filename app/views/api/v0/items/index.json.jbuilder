json.status 200
json.items @items do |item|
  json.by item.by
  json.id item.id
  if item.type == 'News'
    json.title item.title
    json.url item.url
  elsif item.type == 'Comment'
    json.text item.text
  end
  json.time item.created_at.to_time.to_i
  json.type item.type
end
