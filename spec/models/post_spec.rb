# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  Timecop.freeze(Time.zone.parse('12:00 13 October 2018'))

  subject = described_class.new do |p|
    p.created_at = Time.now
    p.message = 'Message test'
  end

  subject2 = described_class.new do |p|
    p.created_at = Time.now
    p.message = 'Message test'
    p.updated_at = '12:45 13 October 2018'
  end

  describe 'Date Shown' do
    it 'returns created at time' do
      expect(subject.date_shown).to eq ("Sat Oct 13 12:00:00")
    end
    it 'returns updated time, if post updated' do
      expect(subject2.date_shown).to eq ("Sat Oct 13 12:45:00")
    end
  end

end
