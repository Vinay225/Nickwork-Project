# frozen_string_literal: true

# location: spec/unit/unit_comment.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @news_post = NewsPost.create(title: 'New Dog!', description: 'I just got a new dog!!',
                                 userID: '12345', name: 'Nic')
  end

  subject do
    described_class.new(name: 'Nic', description: 'I love your dog!!', news_post_id: @news_post.id, userID: '6789')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an user name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a corresponding news post (news_post_id)' do
    subject.news_post_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a userID' do
    subject.userID = nil
    expect(subject).not_to be_valid
  end
end
