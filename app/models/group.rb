class Group < ApplicationRecord
  CATEGORIES = %w[Restaurant Bar Museum Mall Park Cafe].sort

  belongs_to :user
  belongs_to :activity, optional: true
  has_many :members, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo

  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }

  after_create :become_member

  private

  def become_member
    Member.create(user: self.user, group: self)
  end
end
