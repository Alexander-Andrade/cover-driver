require 'dry-validation'

class PersonValidator < Dry::Validation::Contract
  DRIVER_LICENSE_MAX_SIZE = 8

  params do
    required(:first_name).filled(:string)
    required(:last_name).filled(:string)
    required(:drivers_license_number).filled(:string).value(max_size?: DRIVER_LICENSE_MAX_SIZE)
  end

  rule(:drivers_license_number) do
    unless /[0-9]/.match?(value)
      key.failure('has invalid format')
    end
  end
end
