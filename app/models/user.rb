class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  after_create :subscribe_to_list

  def subscribe_to_list
    MailyHerald.subscribe(self, :all_users)
  end

  def to_s
    "#{self.name}"
  end
end
