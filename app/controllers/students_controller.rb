
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token # Disable CSRF protection for API

  # Show all students in JSON format
  def index
    @students = Student.all
    render json: @students
  end

  # Show a single student by ID in JSON format
  def show
    render json: @student
  end

  # Create a new student via JSON
  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # Update student details via JSON
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # Delete a student via JSON
  def destroy
    @student.destroy
    head :no_content
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :contact_number, :address, :date_of_birth, :rating)
  end
end





# EXAMPLE FOR CREATE STUDENT


# {
#   "student": {
#     "first_name": "John",
#     "last_name": "Doe",
#     "email": "john.doe@example.com",
#     "contact_number": "123-456-7890",
#     "address": "123 Main St",
#     "date_of_birth": "1990-01-01",
#     "rating": 85
#   }
# }
