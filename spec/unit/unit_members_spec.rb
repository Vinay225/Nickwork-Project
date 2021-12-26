# frozen_string_literal: true

# location: spec/unit/unit_members_pec.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(name: 'Nick', description: 'Hello my name is Nick!',
                        birthday: '2021-10-24', classification: 'Senior',
                        major: 'Computer science', email: 'email@email.com',
                        phone: '666-666-666')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a birthday' do
    subject.birthday = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a classification' do
    subject.classification = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a major' do
    subject.major = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).to be_valid
  end
end
