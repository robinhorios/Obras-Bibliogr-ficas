class Api::V1::AuthorsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      @authors = 
        Author.create(Authors::NameFormatter.call(author_params['names']))
    end

    render status: :created, json: @authors
  rescue ActiveRecord::RecordInvalid => error
    render status: :unprocessable_entity, json: error.record.errors
  rescue StandardError => error
    render status: :internal_server_error, json: "Couldn't create authors, try later"
  end

  private

    def author_params
      params.require(:author).permit(names: [])
    end
end