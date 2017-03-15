FactoryGirl.create(:user, email: "test@test.test", password: 'Testtest')
FactoryGirl.create_list(:post, 13, user: User.first)
FactoryGirl.create(:comment, user: User.first, post: Post.last)
