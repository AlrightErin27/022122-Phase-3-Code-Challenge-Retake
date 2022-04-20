class Venue < ActiveRecord::Base
  has_many :concerts
  has_many :venues, through: :concerts

  #   Venue#concert_on(date)
  # takes a date (string) as argument
  # finds and returns the first concert on that date at that venue
  def concert_on(date)
    # self.concerts.map do |concert|
    #   if concert.date == date
    #      "#{concert}"
    #   else
    #     'false'
    #   end
    # end

    self.concerts.find_by(date: date)
  end

  # Venue#most_frequent_band
  # returns the band with the most concerts at the venue
  # Note: solving this using only Active Record methods is possible, but difficult.
  # Feel free to use regular Ruby enumerable methods here.
  def most_frequent_band
    self.most_performances
  end
end
