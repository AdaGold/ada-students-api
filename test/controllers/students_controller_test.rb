require "test_helper"

describe StudentsController do
  it "must get index" do
    get students_path
    must_respond_with :success
  end

  it "must get show" do
    get student_path(Students(:ada).id)
    must_respond_with :success
  end

  it "be able to update a student" do
    student_hash = {
      fullName: 'Peter Parker',
      email: 'NotSpiderman.gmail.com',
      present: false,
    }

    id = Student.first.id

    patch student_path(id), params: student_hash

    must_respond_with :success
  end

  it "won't be able to update a student with no name" do
    student_hash = {
      fullName: nil,
      email: 'NotSpiderman.gmail.com',
      present: false,
    }

    id = Student.first.id

    patch student_path(id), params: student_hash

    must_respond_with :bad_request
    response_body = JSON.parse(response.body)
    expect(response_body["errors"].keys).must_include "fullName"
    expect(response_body["errors"]["fullName"]).must_include "can't be blank"
  end

  it "can delete a student" do
    id = Students(:ada).id

    delete student_path(id)

    expect(Student.find_by id: id).must_be_nil
  end


  it "cannot delete a nonexistant student" do
    student = Students(:ada)
    student.destroy
    expect(Student.find_by id: student.id).must_be_nil

    delete student_path(student.id)

    must_respond_with :not_found
  end

  it "Can create a student" do
    student_hash = {
      fullName: "Black Widow",
      email: "top-secret@shield.gov",
      is_present: false,
    }

    expect {
      post students_path, params: student_hash
  }.must_change 'Student.count', 1

    must_respond_with :created
  end

  it "cannot create a student with a duplicate email" do
    student_hash = {
      fullName: "Ada Lovelace",
      email: "ada@lovelace.dev",
      is_present: false,
    }

    expect {
      post students_path, params: student_hash
  }.wont_change 'Student.count'

    must_respond_with :bad_request
  end

end
