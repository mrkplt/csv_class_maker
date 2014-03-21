# Usage:
#
# require './csv_class_maker'
# CsvClassMaker::generate_class 'Batting', '/Users/mplatt/Desktop/Batting.csv'

module CsvClassMaker
  require 'csv'
  def self.generate_class(class_name, file_name)
    Object.const_set class_name, Struct.new(*extract_headers(file_name)){

      # Class definition for dynamically generated classes.
      require 'csv_class_maker/csv_find'
      extend CsvFind

      def initialize(hash=nil)
        if hash
          hash.each { |k,v| send "#{k}=".to_sym, v }
        end
      end

      @@file = CSV.new(File.open(file_name,'r'), headers: true, header_converters: :symbol, return_headers: false)
      @@first_line = 2
      @@last_line = `wc -l #{file_name}`.split(' ').first.to_i
      @line_number = nil

      attr_accessor :line_number

      def self.file; return @@file; end
      def self.first_line; return @@first_line; end
      def self.last_line; return @@last_line; end

      # End of class definition.

    }
  end
  
  private

  def self.extract_headers(file_name)
    @csv_headers = []
    CSV.new(File.open(file_name,'r'), headers: true, header_converters: :symbol, return_headers: true).first.each do |headers, values| 
      @csv_headers << headers
    end
    @csv_headers
  end
end
