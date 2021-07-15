
#user
user1 = User.create(username: "Freddy", email: "freddy@freddy.com", password: "password" )
user2 = User.create(username: "Andrew", email: "andrew@andrew.com", password: "password" ) 
user3 = User.create(username: "Anika", email: "anika@anika.com", password: "password" ) 
user4 = User.create(username: "Shawn", email: "shawn@shawn.com", password: "password" )
user5 = User.create(username: "Roland", email: "Roland@roland.com", password: "password" )

#Category
category1 = Category.create(name: "Mexican")
category2 = Category.create(name: "Italian") 
category3 = Category.create(name: "Fast Food") 
category4 = Category.create(name: "Chinese") 
category5 = Category.create(name: "French") 

#Restaurant
restaurant1 = Restaurant.create(name: "Jose Mexican Grill", price_range: "$$", address: "1121 nw 3rd ave, Pompano Beach, FL 33060", user_id: user1.id, category_id: category1.id)
restaurant2 = Restaurant.create(name: "Carabas Italian", price_range: "$$$", address: "7894 nw 3rd ave, Oakland Park, GA 33334", user_id: user2.id, category_id: category2.id)
restaurant3 = Restaurant.create(name: "Mickey D's", price_range: "$", address: "2830 somerset dr, Lauderdale Lakes, AL 33336", user_id: user3.id, category_id: category3.id)
restaurant4 = Restaurant.create(name: "Golden Tiger", price_range: "$$", address: "5242 ne 3rd ave, Fort Lauderdale, FL 33434", user_id: user4.id, category_id: category4.id)
restaurant5 = Restaurant.create(name: "Crepe's Cafe", price_range: "$$$", address: "5489 E palmetto road, Boca Raton, FL 39842", user_id: user5.id, category_id: category5.id)

#Review
review1 = Review.create(stars: "3", title: "Best Mexican Food I've Ever had!", content: "COME TRY IT!", restaurant_id: restaurant1.id, user_id: user1.id) 
review2 = Review.create(stars: "5", title: "Taste of Italy!", content: "If you can't make it to Italy this is the next best option!", restaurant_id: restaurant2.id, user_id: user2.id) 
review3 = Review.create(stars: "1", title: "Never Again!", content: "I'm still recovering from that gross food! AVOID!", restaurant_id: restaurant3.id, user_id: user3.id) 
review4 = Review.create(stars: "4", title: "Great Food!", content: "The owners are the best, and the food reflects it!", restaurant_id: restaurant4.id, user_id: user4.id) 
review5 = Review.create(stars: "4", title: "Paris in the States!", content: "Great vibe and ever better food!", restaurant_id: restaurant5.id, user_id: user5.id) 
