class Group < ApplicationRecord
  CATEGORIES = ['All'] + %w[Restaurants Bars Museums Shoppings Pubs Parks].sort + ['Random']

  belongs_to :user
  belongs_to :activity, optional: true
  has_many :members, dependent: :destroy
  has_many :messages

  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :user }

  after_create :become_member

  private

  def become_member
    Member.create(user: self.user, group: self)
  end
end
