class Idea < ActiveRecord::Base
  belongs_to :user, required:true
  has_many :ideas, dependent: :destroy
  validates :content, presence: true
end
