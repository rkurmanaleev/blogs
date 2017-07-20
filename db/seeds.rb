user_1 = FactoryGirl.create(:user, email: "test@test.test", password: 'Testtest')
user_2 = FactoryGirl.create(:user, email: "testtest@test.test", password: 'Testtest')

FactoryGirl.create_list(:post, 13, user: user_1)
FactoryGirl.create_list(:post, 3, user: user_2)

post = Post.last

FactoryGirl.create(:comment, user: user_1, post: post)
FactoryGirl.create_list(:comment, 5, user: user_2, post: post)
