require 'rails_helper'

RSpec.describe Business, type: :model do
  let (:biz) { FactoryGirl.create :business }
  subject { biz }

  it { should respond_to(:uuid) }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:country) }
  it { should respond_to(:phone) }
  it { should respond_to(:website) }
end
