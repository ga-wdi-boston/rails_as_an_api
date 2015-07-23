class PeopleController < ApplicationController
  def index
    render json: Person.all
  end

  def show
    render json: Person.find(params[:id])
  end

  def create
    person = Person.new(person_params)

    if person.save
      render json: person
    else
      render json: { error: "Person could not be created." }, status: 422
    end
  end

  private

    def person_params
      params.require(:person).permit([
        :surname,
        :given_name,
        :gender,
        :dob,
        :middle_name
      ])
    end
end