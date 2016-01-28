# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id

  has_many :tracks,
    class_name: 'Track',
    foreign_key: album_id,
    primary_key: :id

end
