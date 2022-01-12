# Final-Project

## Description

 The modern shopping application is an application that simulates the electronic shopping experience, which enables the user to shop in many stores on one platform, making it easier for the user to reach his needs in less time and high quality . And here in our application, we decided to collect many pharmacies in one platform so that the user can get the product easily and quickly.

## User Stories

- **Signup:** As an anon I can sign up in the platform so that I can start shopping
- **Login:** As a user I can login to the platform so that I can log the shopping app
- **Logout:** As a user I can logout from the platform so no one else can use it
- **Show all Pharmacies ** As a user I can see all Pharmacies and choose one of them
- **Add to cart** As a user I can add my purchases to the cart
- **Make Checkout** As a user I can add my purchases and checkout
- **User Profile** As a user I can edit my profile
- **Location** As a user I want to see where the Pharmacies is
- **Favorite** As a user I can add favorite

## Backlog

User profile:

- see my profile
- see pharmacy
- see pharmacy's discription
- add to cart
- make checkout
- add to favorite



# Client / Frontend

## React Router Routes (React App)
| Lawyer Path        | Component             | Lawyer Behavior                                                                        |
| ------------------ | --------------------- | ---------------------------------------------------------------------------------------|
| /                  | Splash Page           | The main page to specify the path of the user as a user or as a new user               |
| /user login        | Login Page            | Login, navigate to homepage after login                                                |
| /user signup       | Signup Page           | Signup, navigate to homepage after signup                                              |
| /home page         | TapBar                | All Classes you have made will appear                                                  |
| /pharmacies page   | All Pharmacies page   | Browse all pharmacies and it's products and it's discriptions                          |
| /locations page    | All locations         | Browse all the locations added in the application for every pharmacy                   |
| /cart page         | Cart product page     | for the all purchases you will buy                                                     |
| /profile page      | Show user profile     | change the user profile (name,status)











## Components

- LoginPage
- SigninPage
- ProfilePage
- SignupPage
- EditProfilePage
- PharmaciesPage
- ProductPage
- ProductDiscriptionPage
- FavoritePage
- MapPage
- CheckOutPage
- CartPage

## Services

- Auth Service
  - auth.login(user)
  - auth.signup(user)
  - auth.logout()
  - auth.me()
  - auth.getUser() // synchronous
- Cart Service
  - Product.name()
  - Product.image(id)
  - Product.price(id)
- User Service
  - user.detail(id)
    - user.name(id)
      - user.email(id)
- Register Service
- Favorite Service
  



# Server / Backend

## Models

User model

 FavArabic 
	var image: String
	var name: String
	var id: String

 Location 
	let id: String
	let userId: String
	let location: String


 Carts 
	let id: String
	let name: String
	let image : String
	
struct User 
	let id: String
	let name: String
	let status : String
	let image : String
	let location : String
	
 PharmacyStruct
 
	let image: UIImage?
	let name: String
	let discProduct: Array <DiscProduct>


 DiscProduct
	let id: String
	let imageA: String?
	let nameA: String
	let staly: String
	let summaryA: String
	let price : Double


## Links

[Github Home Page Link](https://github.com/HassanYahya1)

[Github Final Project Link](https://github.com/HassanYahya1/FinalProject-ModernShopping)

