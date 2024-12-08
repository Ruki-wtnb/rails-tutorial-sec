# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # セキュアにハッシュ化したパスワードを、データベース内のpassword_digest属性に保存できるようになる。
  # 2つの仮想的な属性（passwordとpassword_confirmation）が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される26 。
  # authenticateメソッドが使えるようになる（引数の文字列がパスワードと一致するとUserオブジェクトを返し、一致しない場合はfalseを返すメソッド）。
  has_secure_password # password_digest属性を持っている必要がある
  validates :password, presence: true, length: { minimum: 8 }
end
