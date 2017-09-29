class RemoveQuestionIdAndAnswerTextFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :question_id, :integer
    remove_column :answers, :answer_text, :string
  end
end
