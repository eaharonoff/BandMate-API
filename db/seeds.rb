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
request_1 = FriendRequest.create(sender: beans, recipient: eman)
request_2 = FriendRequest.create(sender: beans, recipient: raoul)
request_3 = FriendRequest.create(sender: beans, recipient: daniel)
classy_ladykillers = Conversation.create(name: 'Classy Ladykillers')
UserConversation.create(user: beans, conversation: classy_ladykillers)
UserConversation.create(user: eman, conversation: classy_ladykillers)
UserConversation.create(user: daniel, conversation: classy_ladykillers)
Message.create(conversation: classy_ladykillers, user: beans, body: 'hi')
Message.create(conversation: classy_ladykillers, user: eman, body: 'sup girl')
Message.create(conversation: classy_ladykillers, user: beans, body: 'how are you')
Message.create(conversation: classy_ladykillers, user: eman, body: 'wanna date?')
network_1 = Network.create(user: beans)
network_2 = Network.create(user: eman)
MemberNetwork.create(member: eman, network: network_1)
MemberNetwork.create(member: daniel, network: network_1)
MemberNetwork.create(member: beans, network: network_2)
MemberNetwork.create(member: daniel, network: network_2)

# User.joins("INNER JOIN friendships ON user_1_id = 1").where.not(id: 1).distinct
