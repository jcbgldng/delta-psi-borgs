class User < ApplicationRecord
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  has_many :articles, foreign_key: :author_id
  has_many :revisions, foreign_key: :editor_id

  def author
    self.revisions.first.username
  end
end
