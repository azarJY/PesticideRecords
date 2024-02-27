class Record < ApplicationRecord
    belongs_to :farmer
    belongs_to :farmland
    belongs_to :pesticide
    
    # 定められたseason内でのrecordを取得するメソッド
    def self.records_within_season(season)
      if season.present? && season.start_date.present? && season.end_date.present?
        where("day >= ? AND day <= ?", season.start_date, season.end_date)
      else
        all
      end
    end
    
end