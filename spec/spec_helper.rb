# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec::Matchers.define_negated_matcher :not_raise_error, :raise_error

RSpec.configure do |config|
  config.log_level = :fatal
end
