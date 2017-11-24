require "./spec_helper"

describe BigReader do
  # TODO: Write tests

  it "loads a file" do
    big_file = BigReader::File.new(File.open("./spec/files/gensec.big"))

    big_file.file_index.size.should eq 1
  end

  it "parses the global header correctly" do
    big_file = BigReader::File.new(File.open("./spec/files/gensec.big"))
    header = big_file.header

    header.signature.should eq "BIGF"
    header.item_count.should eq 1
  end

  it "parses the file header correctly" do
    big_file = BigReader::File.new(File.open("./spec/files/gensec.big"))
    indexed_file = big_file.file_index.first

    big_file.file_index.size.should eq big_file.header.item_count
    indexed_file.name.should eq "generalsb.sec"
    indexed_file.offset.should eq 48
    indexed_file.size.should eq 787416
  end
end
