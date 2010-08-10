Factory.sequence(:email) do |email|
  "alguem.#{email}@email.com"
end

Factory.sequence(:nome) do |nome|
  "Alguém #{nome}"
end