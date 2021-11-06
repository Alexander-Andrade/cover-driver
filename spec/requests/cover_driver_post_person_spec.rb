require 'spec_helper'
require_relative '../../src/requests/cover_driver_post_person'
require_relative '../../src/models/person'
require 'pry'

describe CoverDriverPostPerson do
  describe "#call" do
    subject(:post_person) do
      described_class.new(person)
    end

    let(:person) do
      Person.new(
        first_name: 'Alex',
        last_name: 'Djus',
        drivers_license_number: '123456'
      )
    end

    it 'returns the result' do
      VCR.use_cassette("cover_driver_post_person_#{person.hash}") do
        json_body = post_person.call

        expect(json_body["data"]['id']).not_to be_nil
      end
    end
  end
end
