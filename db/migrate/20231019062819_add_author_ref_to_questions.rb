class AddAuthorRefToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :author, foreign_key: { to_table: :users }
    change_column_null :questions, :author_id, false
  end
end
