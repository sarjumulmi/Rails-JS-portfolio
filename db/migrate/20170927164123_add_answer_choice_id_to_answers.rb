class AddAnswerChoiceIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_choice_id, :integer
  end
end
