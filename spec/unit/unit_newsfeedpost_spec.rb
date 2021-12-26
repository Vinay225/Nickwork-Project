# frozen_string_literal: true

# location: spec/unit/unit_newsfeedpost_spec.rb
require 'rails_helper'

RSpec.describe NewsPost, type: :model do
  subject do
    described_class.new(title: 'All Nicks', description: 'Meeting with the Nicks. Ice cream will be served',
                        userID: '12345', name: 'Bob the Builder')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an meeting title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a userID' do
    subject.userID = nil
    expect(subject).not_to be_valid
  end
end
