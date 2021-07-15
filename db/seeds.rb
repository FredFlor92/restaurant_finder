user2 = User.create(username: "Donna", email: "donna@donna.com", password: "password" ) 
category2 = Category.create(name: "Mexican") 
restaurant2 = Restaurant.create(name: "San Joe's Mexican Grill", price_range: "$$", address: "460 S Main St, Dawson, GA 39842", user_id: user2.id, category_id: category2.id)
review2 = Review.create(stars: "4", title: "Great Food!", content: "Would 100% recommend!", restaurant_id: restaurant2.id, user_id: user2.id) 