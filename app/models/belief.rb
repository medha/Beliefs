class Belief < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  has_many :relationships, foreign_key: "belief_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'beliefs.created_at DESC'

    def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
