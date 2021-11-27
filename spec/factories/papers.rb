FactoryBot.define do
  factory :paper do
    title { "COMPUTING MACHINERY AND INTELLIGENCE" }
    venue { "Mind 49: 433-460" }
    year { 1950 }
    authors {build_list :author, 1}
    factory :paper2 do
      title { "Some Paper" }
      year { 1968}
    end
  end
end