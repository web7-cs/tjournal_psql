class CreateLearningDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_dictionaries do |t|
      t.string :title
      t.text :definition
      t.text :content

      t.timestamps
    end
  end
end
