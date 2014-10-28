class AddIntroToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :intro, :text
  end
end
