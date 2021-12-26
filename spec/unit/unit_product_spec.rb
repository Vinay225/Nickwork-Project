# frozen_string_literal: true

# location: spec/unit/unit_product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  subject do
    described_class.new(name: 'All Nicks', description: 'Meeting with the Nicks. Ice cream will be served', price: 100)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end
end
