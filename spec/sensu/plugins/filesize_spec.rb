require "spec_helper"
require "fileutils"

def create_temp_file(size, name = "a_file.dat")
  FileUtils.mkdir_p "tmp"
  File.open("tmp/#{name}", "wb") do |f|
    data = "x" * size
    f.write(data)
  end
end

describe Sensu::Plugins::Filesize do
  it "has a version number" do
    expect(Sensu::Plugins::Filesize::VERSION).not_to be nil
  end

  it "does not find any file" do
    create_temp_file(1)

    # tun check
    response = `bin/check-filesize.rb -f tmp -s +20M`

    expect(response.strip).to eq("CheckFilesize OK")
  end

  it "finds a file bigger than 20m" do
    # create the file
    create_temp_file(1024 * 1024 * 21)

    # run check
    response = `bin/check-filesize.rb -f tmp -s +20M`
    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 21.000 mb/)
  end

  it "finds a file smaller than 20m" do
    # create the file
    create_temp_file(1024 * 1024 * 19)

    # run check
    response = `bin/check-filesize.rb -f tmp -s -20M`
    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 19.000 mb/)
  end

  it "finds a file with exact file size" do
    # create the file
    create_temp_file(1024 * 1024 * 10)

    # run check
    response = `bin/check-filesize.rb -f tmp -s 10M`

    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 10.000 mb/)
  end
end
