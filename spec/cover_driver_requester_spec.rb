require 'spec_helper'
require_relative '../src/cover_driver_requester'
require_relative '../src/models/person'


describe CoverDriverRequester do
  describe "#call" do
    subject(:requester) do
      described_class.new(person_params)
    end


    context 'with valid person params' do
      let(:person_params) do
        {
          first_name: 'Rufus',
          last_name: 'Frus',
          drivers_license_number: '123456'
        }
      end
      let(:person) do
        Person.new(person_params)
      end

      it 'returns success' do
        VCR.use_cassette("cover_driver_post_person_#{person.hash}") do
          result = requester.call
          expect(result).to be_success
        end
      end

      it 'returns personal data' do
        VCR.use_cassette("cover_driver_post_person_#{person.hash}") do
          result = requester.call
          expect(result.value!['data']['id']).not_to be_nil
        end
      end
    end

    context 'with invalid person params' do
      let(:person_params) do
        {
          first_name: 'Rufus',
          last_name: 'Frus',
          drivers_license_number: '123456343df'
        }
      end

      it 'returns failure' do
        result = requester.call
        expect(result).to be_failure
      end
    end
  end
end
