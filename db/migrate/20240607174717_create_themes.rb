class CreateThemes < ActiveRecord::Migration[7.1]
  def change
    create_table :themes do |t|
      t.string :name
      t.timestamps
    end

    create_table :questions_themes, id: false do |t|
      t.belongs_to :theme
      t.belongs_to :question
    end
  end
end
