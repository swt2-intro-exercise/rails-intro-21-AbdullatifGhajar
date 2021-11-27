FactoryBot.define do
  factory :author do
    first_name { "Alan" }
    last_name { "Turing" }
    homepage { "http://wikipedia.de/Alan_Turing" }
    
    factory :author2 do
      first_name { "Peter" }
      last_name { "Plagiarist" }
      homepage { "" }
    end
  end
end