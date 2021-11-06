# frozen_string_literal: true

require 'dry-struct'
require 'digest'

module Types
  include Dry.Types()
end

class Person < Dry::Struct
  attribute :first_name, Types::String
  attribute :last_name, Types::String
  attribute :drivers_license_number, Types::String

  def hash
    Digest::SHA256.hexdigest [first_name, last_name, drivers_license_number].join
  end
end
