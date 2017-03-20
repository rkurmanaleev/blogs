FactoryGirl.create(:user, email: "test@test.test", password: 'Testtest')
FactoryGirl.create(:post, user: User.first)
