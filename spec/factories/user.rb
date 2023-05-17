FactoryBot.define do
  factory :user do
    name { 'Felipe' }
    photo { 'https://mixmag.net/assets/uploads/images/_columns2/Felipe-Valenzuela-press-photo.png' }
    bio do
      'Self-taught web developer with over 1 years of experience working on complex software development.
      I am eager to work on new projects in the near future.'
    end
    post_counter { 0 }
  end
end
