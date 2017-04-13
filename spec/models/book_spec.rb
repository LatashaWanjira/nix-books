require 'rails_helper'

describe Book do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :content }
  it { should have_many :comments }
end
