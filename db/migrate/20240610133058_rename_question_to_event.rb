class RenameQuestionToEvent < ActiveRecord::Migration[7.1]
  def change
    drop_table :questions_themes

    rename_table :questions, :events

    create_table :events_themes, id: false do |t|
      t.belongs_to :theme
      t.belongs_to :event
    end
  end
end
