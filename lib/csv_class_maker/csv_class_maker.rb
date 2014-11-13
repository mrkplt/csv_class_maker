# Usage:
#
# require './csv_class_maker'
# CsvClassMaker::generate_class 'Batting', '/Users/mplatt/Desktop/Batting.csv'

module CsvClassMaker
  require 'csv'
  require 'byebug'

  def self.generate_class(class_name, file_name, options = {})
    options.merge!(
      headers: true,
      header_converters: :symbol,
      return_headers: false
    )

    Object.const_set class_name, Struct.new(*extract_headers(file_name, options)) {

      # Class definition for dynamically generated classes.
      require 'csv_class_maker/csv_find'
      extend CsvFind

      def initialize(hash=nil)
        if hash
          hash.each { |k,v| send "#{k}=".to_sym, v }
        end
      end

      @@file_options = options
      @@file = CSV.new(File.open(file_name, 'r'), @@file_options)
      @@first_line = 2
      @@last_line = `wc -l #{file_name}`.split(' ').first.to_i
      @@middle_line = (@@last_line/2)+1
      @line_number = nil

      attr_accessor :line_number

      def self.file; return @@file; end
      def self.first_line; return @@first_line; end
      def self.middle_line; return @@middle_line; end
      def self.last_line; return @@last_line; end
      def self.file_options; return @@file_options; end

      # End of class definition.

    }
  end

  private

  def self.extract_headers(file_name, options)
    csv_file = File.open(file_name,'r')

    @csv_headers = CSV.new(csv_file, options).first.map do |headers, values|
      headers
    end
  end
end
