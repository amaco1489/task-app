class Schedule < ApplicationRecord
  validates :title, presence:true
  validates :start_day,presence:true
  validates :end_day,presence:true
  validate :today_before_start
  validate :start_before_end
  
  def today_before_start
    return if start_day.blank?
    if start_day < Date.today
      errors.add :start_day, "は今日以降を選択して下さい"
    end
  end
  
  def start_before_end
    return if start_day.blank? || end_day.blank?
    if end_day < start_day
      errors.add :end_day, "は開始日以降を選択して下さい"
    end
  end
end