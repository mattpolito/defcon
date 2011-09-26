Fabricator(:issue) do
  title Faker::Lorem.sentence(rand(1..4))
  description Faker::Lorem.paragraph(rand(1..4))
end
