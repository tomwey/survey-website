class AddPublishedAtToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :published_at, :datetime
  end
end
