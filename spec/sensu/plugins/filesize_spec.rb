require "spec_helper"

describe Sensu::Plugins::Filesize do
  it "has a version number" do
    expect(Sensu::Plugins::Filesize::VERSION).not_to be nil
  end

  it 'does not find any file' do
    `mkdir -p tmp`

    # tun check
    response = `bin/check-filesize.rb -f tmp -s +20M`

    expect(response.strip).to eq('CheckFilesize OK')
  end


  it 'finds a file bigger than 20m' do
    # create the file
    `mkdir -p tmp && dd if=/dev/zero of=tmp/a_file.dat  bs=21m  count=1`

    # run the check
    response = `bin/check-filesize.rb -f tmp -s +20M`

    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 21.000 mb/)
  end


  it 'finds a file smaller than 20m' do
     # create the file
    `mkdir -p tmp && dd if=/dev/zero of=tmp/a_file.dat  bs=19m  count=1`

    # run the check
    response = `bin/check-filesize.rb -f tmp -s -20M`

    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 19.000 mb/)
  end

  it 'finds a file with exact file size' do
     # create the file
    `mkdir -p tmp && dd if=/dev/zero of=tmp/a_file.dat  bs=10m  count=1`

    # run the check
    response = `bin/check-filesize.rb -f tmp -s 10M`

    lines = response.split("\n")

    expect(lines[0]).to match(/CheckFilesize WARNING: Files found: 1/)
    expect(lines[2]).to match(/tmp\/a_file.dat > 10.000 mb/)
  end

end
