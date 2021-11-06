require 'dry/monads'
require_relative 'utils/cache'
require_relative 'models/person'
require_relative 'validators/person_validator'
require_relative 'requests/cover_driver_post_person'
require 'pry'

class CoverDriverRequester
  include Dry::Monads[:result]

  attr_reader :person_params

  def initialize(person_params)
    @person_params = person_params
  end

  def call
    person_validator_result = PersonValidator.new.call(person_params)
    return person_validator_result if person_validator_result.failure?

    person = Person.new(person_params)

    person_data = Cache.fetch(person.hash) do
      CoverDriverPostPerson.new(person).call
    end

    Success(person_data)
  end
end
