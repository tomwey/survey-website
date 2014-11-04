class AddIsRequiredToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_required, :boolean, default: false
  end
end
