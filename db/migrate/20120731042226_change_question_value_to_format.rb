class ChangeQuestionValueToFormat < ActiveRecord::Migration
  def change
    rename_column :questions, :type, :format
  end
end
