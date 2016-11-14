require "spec_helper"

describe Sensu::Plugins::Filesize do
  it "has a version number" do
    expect(Sensu::Plugins::Filesize::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
