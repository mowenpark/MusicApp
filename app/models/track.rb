# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :album,
    class_name: 'Album',
    foreign_key: :album_id,
    primary_key: :id

end
