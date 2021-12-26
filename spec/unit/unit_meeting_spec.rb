# frozen_string_literal: true

# location: spec/unit/unit_meeting_spec.rb
require 'rails_helper'

RSpec.describe Meeting, type: :model do
  subject do
    described_class.new(title: 'All Nicks', description: 'Meeting with the Nicks. Ice cream will be served',
                        meeting_date: '2021-10-24T00:00:00', location: 'College Station')
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

  it 'is not valid without a meeting date' do
    subject.meeting_date = nil
    expect(subject).not_to be_valid
  end
end
