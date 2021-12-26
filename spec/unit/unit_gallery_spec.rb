# frozen_string_literal: true

# location: spec/unit/unit_gallery.rb
require 'rails_helper'

RSpec.describe Gallery, type: :model do
  subject do
    described_class.new(title: 'Nic', description: 'I love your dog!!')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an user name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end
end
