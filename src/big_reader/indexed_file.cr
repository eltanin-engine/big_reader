module BigReader
  # `IndexedFile` is the header of a single file within an big archive.
  # The header will be loaded in the followin sequence:
  #
  # `#offset` 4 bytes (big endian)
  # `#size` 4 bytes (big endian)
  # `#name` utill a NUL byte is found
  struct IndexedFile
      getter offset : UInt32
      getter size : UInt32
      getter name : String

      # Read the current file header from the given *file*
      # This expects that the *file* has already been seeked to the start of the header
      def initialize(file : ::File)
          @offset = file.read_bytes(UInt32, IO::ByteFormat::BigEndian)
          @size = file.read_bytes(UInt32, IO::ByteFormat::BigEndian)
          @name = file.gets('\u0000', true).to_s
      end

      # Convert windows path to the path used on the current system
      def path
          name.gsub('\\','/').gsub('/',::File::SEPARATOR)
      end
  end
end
