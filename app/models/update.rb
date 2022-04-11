class Update < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :in_time, :description, :project, presence: true
  validates :out_time, comparison: { greater_than: :in_time,
  message: "must be greater than Start time." }
  has_rich_text :description

  def self.to_csv
    attributes = %w{ name description start_time end_time }
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |update|
        csv << [User.find(update.user_id).name, update.description.to_plain_text, update.in_time, update.out_time]
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Update.create! row.to_hash
    end
  end
end 
