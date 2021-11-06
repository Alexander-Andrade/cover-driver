# frozen_string_literal: true

require_relative '../../src/validators/person_validator'

describe PersonValidator do
  describe "#call" do
    subject(:person_validator) do
      described_class.new
    end
    let(:validation_result) do
      person_validator.call(person_params)
    end

    context "with valid person params" do
      let(:person_params) do
        { first_name: 'Alex', last_name: 'Frus', drivers_license_number: '098734' }
      end

      it "returns success" do
        expect(validation_result).to be_success
      end
    end

    context "with too long drivers_license_number" do
      let(:person_params) do
        { first_name: 'Alex', last_name: 'Frus', drivers_license_number: '098734345634' }
      end

      it "returns failure" do
        expect(validation_result).to be_failure
      end
    end

    context "with empty name" do
      let(:person_params) do
        { first_name: '', last_name: '', drivers_license_number: '0987343' }
      end

      it "returns failure" do
        expect(validation_result).to be_failure
      end
    end

    context "with driver license incorrect format" do
      let(:person_params) do
        { first_name: '', last_name: '', drivers_license_number: 'a0987343' }
      end

      it "returns failure" do
        expect(validation_result).to be_failure
      end
    end
  end
end
