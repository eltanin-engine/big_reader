module BigReader
  # `Header` containa the global header from a given big file.
  # The header will be loaded in the following format:
  #
  # `#signature` 4 bytes
  # `#file_size` 4 bytes (little endian)
  # `#item_count` 4 bytes (big endian)
  # `#index_size` 4 bytes (big endian)
  struct Header
      getter signature : String
      getter file_size : UInt32
      getter item_count : UInt32
      getter index_size : UInt32

      # Load the global header from given *file*
      # The cursor should be at the start of the file
      #
      # NOTE: No validations are done. Please ensure that the file is valid yourself
      def initialize(file : ::File)
          @signature = file.gets(4).to_s
          @file_size = file.read_bytes(UInt32, IO::ByteFormat::LittleEndian)
          @item_count = file.read_bytes(UInt32, IO::ByteFormat::BigEndian)
          @index_size = file.read_bytes(UInt32, IO::ByteFormat::BigEndian)
      end
  end
end
