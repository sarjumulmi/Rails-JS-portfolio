class AddStatusToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :status, :boolean, :default => false, :null=> false
  end
end
