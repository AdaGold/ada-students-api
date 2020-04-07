require "test_helper"

describe Student do
  it "can be created" do
    student = Student.new fullName: "Ada Lovelace", email: "Ada@lovelace.dev", is_present: true

    expect(student.save).must_equal true
  end

  it "can't be created with out a name or email" do
    [:fullName, :email].each do |field|
      student = Student.new fullName: "Ada Lovelace", email: "Ada@lovelace.dev", is_present: true
      student[field] = nil
      expect(student.valid?).must_equal false
    end
  end

  it "requires email to be unique" do
    student = Student.new fullName: "Ada Lovelace", email: "Ada@lovelace.dev", is_present: true
    student.save

    other_student = Student.new fullName: "Grace Hopper", email: "Ada@lovelace.dev"

    expect(other_student.valid?).must_equal false
    expect(other_student.errors.messages[:email]).must_include "has already been taken"
  end
end
