require 'spec_helper'

describe TokenGenerator::Pattern do
  let(:segments) { 3 }
  let(:segment_size) { 2 }
  let(:seperator) { '#' }

  subject do
    TokenGenerator::Pattern.new(segments: segments,
                                segment_size: segment_size,
                                seperator: seperator)
  end

  it 'maintains number of segments' do
    expect(subject.segments).to eq segments
  end
  it 'maintains size of segments' do
    expect(subject.segment_size).to eq segment_size
  end
  it 'maintains number of seperator' do
    expect(subject.seperator).to eq seperator
  end

  it 'creates a pattern' do
    expect(subject.to_s).to eq 'cc#cc#cc'
  end
end
