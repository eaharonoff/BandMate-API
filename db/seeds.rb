# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

somerset = City.create(name: 'somerset')
beans = User.create(city: somerset, name: 'beans')
great_neck = City.create(name: 'great neck')
eman = User.create(city: great_neck, name: 'eman')
bellmore = City.create(name: 'bellmore')
raoul = User.create(city: bellmore, name: 'raoul')
los_angeles = City.create(name: 'los angeles')
daniel = User.create(city: los_angeles, name: 'daniel')
# request_1 = FriendRequest.create(sender: beans, recipient: eman)
# request_2 = FriendRequest.create(sender: beans, recipient: raoul)
# request_3 = FriendRequest.create(sender: beans, recipient: daniel)
friendship_1 = Friendship.create(user_1: beans, user_2: eman)
friendship_2 = Friendship.create(user_1: beans, user_2: raoul)
friendship_3 = Friendship.create(user_1: beans, user_2: daniel)
conversation_1 = Conversation.create(user_1: beans, user_2: eman)
conversation_2 = Conversation.create(user_1: eman, user_2: beans)
message_1 = Message.create(conversation: conversation_1, user: beans, body: 'hi')
message_2 = Message.create(conversation: conversation_1, user: eman, body: 'sup girl')
message_3 = Message.create(conversation: conversation_1, user: beans, body: 'how are you')
message_4 = Message.create(conversation: conversation_1, user: eman, body: 'wanna date?')

# User.joins("INNER JOIN friendships ON user_1_id = 1").where.not(id: 1).distinct
