class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end


  def create
    posted = Author.create!(author_params)
    render json: posted, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
 end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
