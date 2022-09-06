class Project < ApplicationRecord
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  validates_presence_of :name, :material
  belongs_to :challenge

  def num_contestants
    contestant_ids.count
  end
end