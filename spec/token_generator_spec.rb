require 'spec_helper'

describe TokenGenerator do
  let(:fake_random) { double(Object, random_number: 0) }

  subject { TokenGenerator.new(pattern, fake_random) }

  describe 'for a character pattern' do
    let(:pattern) { 'cccc' }

    it 'generators a token' do
      expect(subject.token).to eq 'AAAA'
    end
  end

  describe 'for uppercase character pattern' do
    let(:pattern) { 'WHATEVER' }

    it 'preserves the pattern' do
      expect(subject.token).to eq pattern
    end
  end

  describe 'for non character patterns' do
    let(:pattern) { '!\"\#$%&\'()*+,-./0123456789:;<=>?@[\\]^_`{|}~' }

    it 'preserves the pattern' do
      expect(subject.token).to eq pattern
    end
  end

  describe 'for an invalid pattern' do
    let(:pattern) { 'whatever' }
    let(:message) { 'invalid pattern. lower case characters are reserved' }
    it 'raises an exception' do
      expect { subject }.to raise_error(ArgumentError, message)
    end
  end

  describe 'for a generated pattern' do
    let(:pattern) do
      TokenGenerator::Pattern.new(segments: 3, segment_size: 3, seperator: '#')
    end

    it 'uses the string representation' do
      expect(subject.pattern).to eq 'ccc#ccc#ccc'
      expect(subject.token).to eq 'AAA#AAA#AAA'
    end
  end
end
