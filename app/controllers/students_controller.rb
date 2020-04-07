class StudentsController < ApplicationController
  def index
    render json: Student.all.as_json( only: [:id, :fullName, :is_present, :email])
  end

  def show
    student = Student.find_by id: params[:id]

    if student
      render json: student.as_json(only: [:id, :fullName, :is_present, :email]), status: :ok
    else
      render json: { errors: 'Not Found'}, status: :bad_request
    end    
  end

  def update
    student = Student.find_by id: params[:id]

    if student.update(student_params)
      render json: {
        ok: true
      }, status: :ok
    else
      render json: {
        errors: student.errors.messages
      }, status: :bad_request
    end
  end

  def destroy
    student = Student.find_by id: params[:id]

    if student
      student.destroy
      render json: {
        ok: true,
        id: student.id,
      }, status: :ok
    else
      render json: {
        ok: false,
        error: "Student not found"
      }, status: :not_found
    end
  end

  def create
    student = Student.new(student_params)

    if student.save
      render json: {
        id: student.id,
      }, status: :created
    else
      render json: {
        errors: student.errors.messages
        }, status: :bad_request
    end
  end


  private

  def student_params
    return params.permit(:fullName, :id, :email, :is_present)
  end
end
