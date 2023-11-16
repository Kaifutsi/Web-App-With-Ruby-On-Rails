class User < ApplicationRecord
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  validates_inclusion_of :admin, in: [true, false]

  def admin?
    admin
  end

  def liked?(image)
    likes.exists?(image: image)
  end
end
