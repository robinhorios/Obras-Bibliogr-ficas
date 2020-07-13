class Api::V1::AuthorsController < ApplicationController
  def show
    
  end

  def index
    
  end

  def create
    
  end

  def method_name
    
  end

  private

    def author_params
     params.require(:author).permit(:first_name, :last_name, :phone, :formatted_name)
   end
end