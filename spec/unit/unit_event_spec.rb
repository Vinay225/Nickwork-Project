# frozen_string_literal: true

# location: spec/unit/unit_event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(title: 'All Nicks', description: 'Meeting with the Nicks. Ice cream will be served',
                        date_time: '2021-10-24T00:00:00', location: 'College Station')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an event title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a event date' do
    subject.date_time = nil
    expect(subject).not_to be_valid
  end
end
