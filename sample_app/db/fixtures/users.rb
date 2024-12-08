# frozen_string_literal: true

User.seed(:id) do |s|
  s.id = 1
  s.name = 's-watanabe'
  s.email =  'shinpla@outlook.jp'
  s.password = 'Ea2y_l1f3'
  s.password_confirmation = 'Ea2y_l1f3'
end
