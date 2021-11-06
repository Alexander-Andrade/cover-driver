# frozen_string_literal: true

require_relative '../../src/utils/cache'

describe Cache do
  describe "#fetch" do
    subject(:cache) do
      described_class
    end

    context "with expiration" do
      let(:cache_key) { :key1 }
      let(:cache_value) { 1 }

      before do
        cache.clear
      end

      it "creates a new cache entry" do
        cache.fetch(cache_key) do
          cache_value
        end

        aggregate_failures do
          expect(cache.store[cache_key][:value]).to eq cache_value
          expect(cache.store[cache_key][:expiration_time]).not_to be_nil
        end
      end

      it "fetches stored result, does not create a new one" do
        cache.fetch(cache_key) do
          cache_value
        end

        result = cache.fetch(cache_key)

        aggregate_failures do
          expect(result).to eq cache_value
          expect(cache.store.size).to eq 1
        end
      end

      it "returns no result, if there is no record" do
        result = cache.fetch(cache_key)

        aggregate_failures do
          expect(result).to be_nil
        end
      end
    end
  end
end
