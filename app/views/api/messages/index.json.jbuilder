json.array! @messages do |message|
  json.id message.id
  json.type message.message_type
  json.created_at message.created_at
  json.ignore_nil!
  json.set! :value do
    json.text message.text
    json.image message.image
    json.file message.file
  end
end
