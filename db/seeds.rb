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

beans = User.create(name: 'beans', email: 'beans@beans.com', password: 'password', city: hey, picture: 'http://cp91279.biography.com/BIO_Bio-Shorts_0_Miles-Davis_150550_SF_HD_768x432-16x9.jpg')
eman = User.create(name: 'eman', email: 'eman@eman.com', password: 'password', city: hey, picture: 'https://lh5.googleusercontent.com/-rotwX2rMVUM/AAAAAAAAAAI/AAAAAAABb28/WRGFcZkDV6Q/s0-c-k-no-ns/photo.jpg')
raoul = User.create(name: 'raoul', email: 'raoul@raoul.com', password: 'password', city: hey, picture: 'https://upload.wikimedia.org/wikipedia/commons/1/16/Official_Portrait_of_President_Reagan_1981.jpg')
daniel = User.create(name: 'daniel', email: 'daniel@daniel.com', password: 'password', city: hey, picture: 'http://cdn.thedailybeast.com/content/dailybeast/articles/2014/09/14/what-if-jazz-giant-john-coltrane-had-lived/jcr:content/image.crop.800.500.jpg/47023364.cached.jpg')



UserGenre.create(user: beans, genre: genre1)
UserGenre.create(user: eman, genre: genre2)
UserGenre.create(user: raoul, genre: genre3)
UserGenre.create(user: daniel, genre: genre4)
UserInstrument.create(user: beans, instrument: guitar)
UserInstrument.create(user: eman, instrument: drums)
UserInstrument.create(user: raoul, instrument: guitar)
UserInstrument.create(user: daniel, instrument: drums)


friendship1 = Friendship.create(user: beans, friend: daniel)
school_work = Conversation.create(user1:daniel, user2: beans, user1_name: daniel.name, user2_name: beans.name)
Message.create(conversation: school_work, sender: daniel, body: 'yo')
Message.create(conversation: school_work, sender: beans, body: 'hola')

friendship2 = Friendship.create(user: eman, friend: beans)





# Message.create(conversation: classy_ladykillers, sender: beans, body: 'hi')
# Message.create(conversation: classy_ladykillers, sender: eman, body: 'sup girl')
# Message.create(conversation: classy_ladykillers, sender: beans, body: 'how are you')
# Message.create(conversation: classy_ladykillers, sender: eman, body: 'wanna date?')
# Message.create(conversation: hey_girl, sender: jane, body: 'hey boy')
# Message.create(conversation: hey_girl, sender: beans, body: 'I am a man, hear me roar')
# Message.create(conversation: hey_girl, sender: jane, body: 'you are weird.')







# request_1 = FriendRequest.create(sender: beans, recipient: eman)
# request_2 = FriendRequest.create(sender: beans, recipient: raoul)
# request_3 = FriendRequest.create(sender: beans, recipient: daniel)

# User.joins("INNER JOIN friendships ON user_1_id = 1").where.not(id: 1).distinct
