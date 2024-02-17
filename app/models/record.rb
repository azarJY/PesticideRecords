class Record < ApplicationRecord
    belongs_to :famer
    belongs_to :farmland
    belongs_to :pesticide
    
    def self.records_within_season(season)
      if season.present? && season.start_date.present? && season.end_date.present?
        where("usage_date >= ? AND usage_date <= ?", season.start_date, season.end_date)
      else
        all
      end
    end
    
end
