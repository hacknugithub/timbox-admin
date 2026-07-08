class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  validates :rfc, presence: true, uniqueness: true, format: { with: /\A[A-Z0-9]{13}\z/, message: "must be a valid RFC" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :password, presence: true, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}\z/, message: "must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character" }

  has_many :client_users, dependent: :destroy
  has_many :employees

  def self.build_recoverable_with_errors(attributes)
    new_user = new(attributes)
    if attributes[:email].blank?
      new_user.errors.add(:email, :blank, message: "can't be blank")
    elsif attributes[:rfc].blank?
      new_user.errors.add(:rfc, :blank, message: "can't be blank")
    else
      new_user.errors.add(:base, "Invalid email or RFC")
    end
    new_user
  end
end
