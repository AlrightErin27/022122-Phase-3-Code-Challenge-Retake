class Band < ActiveRecord::Base
  has_many :concerts
  has_many :venues, through: :concerts

  # Band#play_in_venue(venue, date)
  # takes a venue (Venue instance) and date (as a string) as arguments
  # creates a new concert for the band in that venue on that date
  def play_in_venue(venue, date)
    #   temp == 0
    #   Venue.all.map do |v|
    #     v.title == venue ? temp == v.id : temp == 'venue does not exist'
    #     return temp
    #   end
    Concert.create(band_id: self.id, venue_id: venue.id, date: date)
  end

  # Band#all_introductions
  # returns an array of strings representing all the introductions for this band
  # each introduction is in the form:
  # "Hello {insert venue city}!!!!! We are {insert band name} and we're from
  # {insert band hometown}"
  def all_introductions
    self.concerts.map { |b| b.introductions }
  end

  # Band.most_performances
  # returns the Band instance for the band that has played the most concerts
  # Note: solving this using only Active Record methods is possible, but difficult.
  # Feel free to use regular Ruby enumerable methods here.
  def self.most_performances
    Band.all.max_by { |band| band.concerts.count }
  end
end
# on class method
