class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :help_text
      t.integer :question_type_id
      t.integer :survey_id

      t.timestamps
    end
    
    add_index :questions, :survey_id
  end
end
