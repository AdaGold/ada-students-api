class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :fullName
      t.string :email
      t.boolean :present

      t.timestamps
    end
  end
end
