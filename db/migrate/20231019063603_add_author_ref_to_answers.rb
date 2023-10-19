class AddAuthorRefToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :author, foreign_key: { to_table: :users }
    change_column_null :answers, :author_id, false  end
end
