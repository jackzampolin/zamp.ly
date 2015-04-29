class Url < ActiveRecord::Base

  validates :path, presence: true
  validates :short, uniqueness: true

  before_validation :generate_short!, on: :create

  private

  def generate_short!
    self.short = rand(0xffffff).to_s(16)
  end

end
