require 'rails_helper'

describe Comment do
  it { should validate_presence_of :comment_body}
  it { should belong_to :book }
end
