class CreateTeachingIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :teaching_ideas do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  add_index :teaching_ideas, [:user_id, :created_at]
  end
end
