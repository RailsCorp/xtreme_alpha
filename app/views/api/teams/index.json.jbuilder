json.array! @teams do |team|
  json.name team.name
  json.introduce team.introduce
  json.image team.image
  json.group_id team.group_id
  json.created_at team.created_at
end
