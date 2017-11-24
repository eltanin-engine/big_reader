require "./header"
require "./indexed_file"

module BigReader
  # A `File` is the general access point to a .big file
  # This will read all the headers and has the ability to extract an file from it
  class File
      getter file_handle
      getter header : Header
      getter file_index = [] of IndexedFile

      # Create a new reader based on the given *file*
      # This will preload all the headers (global & file)
      # Files can be extracted with the `#extract` method
      #
      # ```
      # big_file = BigReader::File.new(File.open("example.big"))
      # ```
      def initialize(file : ::File)
          @file_handle = file

          @header = Header.new(file_handle)

          1.upto(header.item_count) do |i|
              @file_index << IndexedFile.new(file_handle)
          end
      end

      # Extraxts a single file from the big file
      # For reference it needs the *index* of what to read
      # This will keep the same directory structure as present in the name
      # An optional *base_dir* this will be used as the start location of extraction
      #
      # ```
      # big_file = BigReader::File.new(File.open("example.big"))
      # big_file.extract(big_file.file_index.first)
      # ```
      def extract(index : IndexedFile, base_dir = "")
          file_handle.seek(index.offset)
          bytes = Bytes.new(index.size)
          file_handle.read_fully(bytes)

          Dir.mkdir_p(base_dir + ::File.dirname(index.path)) unless ::Dir.exists?(base_dir + ::File.dirname(index.path))

          ::File.write(base_dir + index.path, bytes)
          p "Extracted: #{base_dir + index.path}"

          true
      end
  end
end
