require "./big_reader/*"

module BigReader
  extend self

  # Extract all files from within an big archive
  # An optional *base_dir* can be given to set the start directory for extraction
  #
  # ```
  # BigReader.extract(File.open("example.big"), "./export/")
  # ``
  def extract(file : ::File, base_dir = "")
    big_file = File.new(file)

    big_file.file_index.each { |i| big_file.extract(i, base_dir) }
  end
end
