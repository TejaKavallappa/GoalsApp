class Goaling < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validates :private_public, inclusion: %w(private public)
  validates :completion, inclusion: %w(incomplete complete)

  belongs_to :user

end
