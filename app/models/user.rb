class User < ActiveRecord::Base
  has_secure_password

  before_save :downcase

  has_many :ideas, dependent: :destroy

  validates :name, :email, :alias, presence: true

  private
    def downcase
      self.name.downcase!
      self.alias.downcase!
      self.email.downcase!
    end
end
