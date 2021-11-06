require_relative '../src/cover_driver_requester'

PERSON_PARAMS = {
  first_name: 'Alex',
  last_name: 'Frus',
  drivers_license_number: '345267'
}.freeze

result = CoverDriverRequester.new(PERSON_PARAMS).call

if result.success?
  puts result.value!
else
  puts result.errors.to_h
end
