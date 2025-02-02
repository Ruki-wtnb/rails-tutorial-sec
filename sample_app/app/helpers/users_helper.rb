# frozen_string_literal: true

module UsersHelper
  # 引数で与えられたユーザのGravatar画像を返す
  def gravatar_for(user, size: 80)
    gravatar_id  = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=retro"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
