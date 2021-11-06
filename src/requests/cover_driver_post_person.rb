require 'json'
require 'faraday'

class CoverDriverPostPerson
  URL = 'https://cover-driver-information-mock.herokuapp.com/reports'.freeze
  AUTH = 'a9f05b05ce6d'

  attr_reader :person


  def initialize(person, authorization: AUTH)
    @person = person
  end

  def call
    response = Faraday.post(URL) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = auth_header
      req.body = {
        data: {
          attributes: {
            first_name: person.first_name,
            last_name: person.last_name,
            drivers_license_number: person.drivers_license_number
          }
        }
      }.to_json
    end

    JSON.parse(response.body)
  end

  private

  def auth_header
    "Bearer #{AUTH}"
  end
end
