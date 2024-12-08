# frozen_string_literal: true

# Schemafile
create_table 'users', force: :cascade do |t|
  t.string 'name', null: false
  t.string 'email', null: false, unique: true
  t.string 'password_digest'

  t.timestamps
end
