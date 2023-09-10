class DobToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :dob, :date
    add_column :students, :rating, :integer
  end
end
