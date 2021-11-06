# frozen_string_literal: true
require_relative '../../src/models/person'

describe Person do
  let(:person) do
    described_class.new(person_params)
  end

  describe "#new" do
    let(:person_params) do
      { first_name: 'Alex', last_name: 'Frus', drivers_license_number: '324235' }
    end

    it 'creates a person' do
      expect(person).to be_a_kind_of(described_class)
    end
  end

  describe "#hash" do
    let(:person_params) do
      { first_name: 'Alex', last_name: 'Frus', drivers_license_number: '324235' }
    end
    let(:person_params2) do
      { first_name: 'John', last_name: 'Doe', drivers_license_number: '724228' }
    end

    it 'persons with the same data produse the same hashes' do
      expect(described_class.new(person_params).hash).
        to eq(described_class.new(person_params).hash)
    end

    it 'persons with different data produse different hashes' do
      expect(described_class.new(person_params).hash).
        not_to eq(described_class.new(person_params2).hash)
    end
  end
end
