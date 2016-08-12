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
request = FriendRequest.create(sender: beans, recipient: eman)
friendship = Friendship.create(user_1: beans, user_2: eman)
conversation_1 = Conversation.create(user_1: beans, user_2: eman)
conversation_2 = Conversation.create(user_1: eman, user_2: beans)
message_1 = Message.create(conversation: conversation_1, sender: beans, recipient: eman, body: 'hi')
message_2 = Message.create(conversation: conversation_1, sender: eman, recipient: beans, body: 'sup girl')
message_3 = Message.create(conversation: conversation_2, sender: beans, recipient: eman, body: 'hi')
message_4 = Message.create(conversation: conversation_2, sender: eman, recipient: beans, body: 'sup girl')
