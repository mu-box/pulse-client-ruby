require 'spec_helper'

describe Pulse do
  include Helpers

  it 'has a version number' do
    expect(Pulse::VERSION).not_to be nil
  end
end
