# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

hey = City.create(name: 'test')

genre1 = Genre.create(name: 'rock')
genre2 = Genre.create(name: 'pop')
genre3 = Genre.create(name: 'punk')
genre4 = Genre.create(name: 'polka')


guitar = Instrument.create(name: 'guitar')
drums = Instrument.create(name: 'drums')

beans = User.create(name: 'beans', email: 'beans@beans.com', password: 'password', city: hey)
eman = User.create(name: 'eman', email: 'eman@eman.com', password: 'password', city: hey)
raoul = User.create(name: 'raoul', email: 'raoul@raoul.com', password: 'password', city: hey)
daniel = User.create(name: 'daniel', email: 'daniel@daniel.com', password: 'password', city: hey)


UserGenre.create(user: beans, genre: genre1)
UserGenre.create(user: eman, genre: genre2)
UserGenre.create(user: raoul, genre: genre3)
UserGenre.create(user: daniel, genre: genre4)
UserInstrument.create(user: beans, instrument: guitar)
UserInstrument.create(user: eman, instrument: drums)
UserInstrument.create(user: raoul, instrument: guitar)
UserInstrument.create(user: daniel, instrument: drums)


friendship1 = Friendship.create(user: beans, friend: eman)
friendship2 = Friendship.create(user: raoul, friend: beans)
friendship3 = Friendship.create(user: beans, friend: daniel)

request_1 = FriendRequest.create(sender: beans, recipient: eman)
request_2 = FriendRequest.create(sender: beans, recipient: raoul)
request_3 = FriendRequest.create(sender: beans, recipient: daniel)
classy_ladykillers = Conversation.create(name: 'Classy Ladykillers')
school_work = Conversation.create(name: 'School Work')

UserConversation.create(user: beans, conversation: school_work)
UserConversation.create(user: raoul, conversation: school_work)
Message.create(conversation: school_work, user: beans, body: 'yo')
Message.create(conversation: school_work, user: raoul, body: 'hola')

UserConversation.create(user: beans, conversation: classy_ladykillers)
UserConversation.create(user: eman, conversation: classy_ladykillers)
UserConversation.create(user: daniel, conversation: classy_ladykillers)
Message.create(conversation: classy_ladykillers, user: beans, body: 'hi')
Message.create(conversation: classy_ladykillers, user: eman, body: 'sup girl')
Message.create(conversation: classy_ladykillers, user: beans, body: 'how are you')
Message.create(conversation: classy_ladykillers, user: eman, body: 'wanna date?')





# request_1 = FriendRequest.create(sender: beans, recipient: eman)
# request_2 = FriendRequest.create(sender: beans, recipient: raoul)
# request_3 = FriendRequest.create(sender: beans, recipient: daniel)

# User.joins("INNER JOIN friendships ON user_1_id = 1").where.not(id: 1).distinct
