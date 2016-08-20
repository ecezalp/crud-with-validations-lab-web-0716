class Song < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: { in: [true, false] } 
  validate :released_with_year



  def released_with_year
    if released
      if !release_year
        errors.add(:released_without_year, "release information contradictory")
      end
    end

    if release_year
      if release_year > 2016
        errors.add(:time_error, "released in future")
      end
    end
  end


end
