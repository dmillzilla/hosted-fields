ActiveRecord::Schema.define(version: 201_805_050_622_59) do
  create_table 'customers', force: :cascade do |t|
    t.string   'email'
    t.string   'first_name'
    t.string   'last_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
