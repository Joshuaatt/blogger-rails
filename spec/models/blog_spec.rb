require 'rails_helper'

describe Blog do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :date }
end
