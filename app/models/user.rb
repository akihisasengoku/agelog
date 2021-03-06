class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # devise :omniauthable, omniauth_providers: [:twitter]
  # devise :omniauthable, omniauth_providers: [:facebook]
  
  has_one :mypage, dependent: :destroy
  # accepts_nested_attributes_for :mypage ,allow_destroy: true
  
  has_many :microposts
  has_many :shops, through: :microposts
  
  has_many :wants, class_name: "Want", foreign_key: "user_id", dependent: :destroy
  has_many :want_shops, through: :wants, source: :shop
  has_many :ages, class_name: "Age", foreign_key: "user_id", dependent: :destroy
  has_many :age_shops, through: :ages, source: :shop

  has_many :following_relationships, class_name: "Relationship",
                                     foreign_key: "follower_id",
                                     dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :follower_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  
  has_many :microstars, class_name: "Microstar", foreign_key: "user_id", dependent: :destroy
  has_many :star_microposts, through: :microstars, source: :micropost
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
  

  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  def following?(other_user)
    following_users.include?(other_user)
  end

  def want(shop)
    wants.find_or_create_by(shop_id: shop.id)
  end

  def unwant(shop)
    want = wants.find_by(shop_id: shop.id)
    want.destroy if want
  end

  def wanted?(shop)
    want_shops.include?(shop)
  end

  def age(shop)
    ages.find_or_create_by(shop_id: shop.id)
  end

  def unage(shop)
    age = ages.find_by(shop_id: shop.id)
    age.destroy if age
  end

  def aged?(shop)
    age_shops.include?(shop)
  end
  
  def microstar(micropost)
    microstars.find_or_create_by(micropost_id: micropost.id)
    micropost.update_attribute(:microstars_count, micropost.microstars_count+1)
  end
  
  def unmicrostar(micropost)
    microstar = microstars.find_by(micropost_id: micropost.id)
    microstar.destroy if microstar
    micropost.update_attribute(:microstars_count, micropost.microstars_count-1)
  end
  
  def microstar?(micropost)
    star_microposts.include?(micropost)
  end
  
  
  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end