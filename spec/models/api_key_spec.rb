require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { should respond_to(:access_token) }
end
