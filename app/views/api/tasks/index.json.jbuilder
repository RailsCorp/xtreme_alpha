json.array! @tasks do |task|
  json.title task.title
  json.content task.content
  json.is_finished task.is_finished
  json.deadline task.deadline
end
