class AddSlugToQuestionTypes < ActiveRecord::Migration
  def change
    add_column :question_types, :slug, :string
  end
end
