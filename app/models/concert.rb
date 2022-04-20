class Concert < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue

  # Concert#hometown_show?
  # returns true if the concert is in the band's hometown, false if it is not
  def hometown_show?
    band_home = self.band.hometown
    Concert.all.include?(band_home)
  end

  # Concert#introduction
  # returns a string with the band's introduction for this concert
  def introduction
    "Hello #{self.venue.title}!!!!! We are #{self.band.name} and we're from #{self.band.hometown}"
  end
end
