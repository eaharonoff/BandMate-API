# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

genre1 = Genre.create(name: 'rock')
genre2 = Genre.create(name: 'pop')
instr1 = Instrument.create(name: 'guitar')
instr2 = Instrument.create(name: 'drums')

beans = User.create(name: 'beans', email: 'beans@beans.com', password: 'password')
eman = User.create(name: 'eman', email: 'eman@eman.com', password: 'password')
raoul = User.create(name: 'raoul', email: 'raoul@raoul.com', password: 'password')
daniel = User.create(name: 'daniel', email: 'daniel@daniel.com', password: 'password')

UserGenre.create(user: beans, genre_id: genre1.id)
UserGenre.create(user: eman, genre_id: genre1.id)
UserInstrument.create(user: beans, instrument_id: instr1.id)
UserInstrument.create(user: eman, instrument_id: instr2.id)

friendship1 = Friendship.create(user_id: beans.id, friend_id: eman.id)
friendship2 = Friendship.create(user_id: raoul.id, friend_id: beans.id)
friendship3 = Friendship.create(user_id: beans.id, friend_id: daniel.id)


# request_1 = FriendRequest.create(sender: beans, recipient: eman)
# request_2 = FriendRequest.create(sender: beans, recipient: raoul)
# request_3 = FriendRequest.create(sender: beans, recipient: daniel)
# classy_ladykillers = Conversation.create(name: 'Classy Ladykillers')
# UserConversation.create(user: beans, conversation: classy_ladykillers)
# UserConversation.create(user: eman, conversation: classy_ladykillers)
# UserConversation.create(user: daniel, conversation: classy_ladykillers)
# Message.create(conversation: classy_ladykillers, user: beans, body: 'hi')
# Message.create(conversation: classy_ladykillers, user: eman, body: 'sup girl')
# Message.create(conversation: classy_ladykillers, user: beans, body: 'how are you')
# Message.create(conversation: classy_ladykillers, user: eman, body: 'wanna date?')




# request_1 = FriendRequest.create(sender: beans, recipient: eman)
# request_2 = FriendRequest.create(sender: beans, recipient: raoul)
# request_3 = FriendRequest.create(sender: beans, recipient: daniel)

# User.joins("INNER JOIN friendships ON user_1_id = 1").where.not(id: 1).distinct
