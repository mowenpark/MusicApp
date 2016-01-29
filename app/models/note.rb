class Note < ActiveRecord::Base
  validates :description, presence: true
  validates :user_id, :track_id, presence: true, uniqueness: true

  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :track,
    class_name: "Track",
    foreign_key: :track_id,
    primary_key: :id

    
end
