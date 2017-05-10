class User < ApplicationRecord
  enum role: [:artist, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :paintings, dependent: :destroy
  def set_default_role
    self.role ||= :artist
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
