class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged
  excluded_words = ["edit", "new"]

  default_scope -> { order('id DESC') }

  belongs_to :category

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }, allow_blank: true

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
