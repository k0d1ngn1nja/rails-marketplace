class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 15}
  has_many :products, dependent: :destroy
end
