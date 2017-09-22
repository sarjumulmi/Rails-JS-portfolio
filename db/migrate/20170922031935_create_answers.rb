class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.integer :question_id
      t.integer :submission_id

      t.timestamps null: false
    end
  end
end
