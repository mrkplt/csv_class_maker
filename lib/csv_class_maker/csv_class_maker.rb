# Usage:
#
# require './csv_class_maker'
# CsvClassMaker::generate_class 'Batting', '/Users/mplatt/Desktop/Batting.csv'

module CsvClassMaker
  require 'csv'

  def self.generate_class(class_name, file_name, options = {})
    options.merge!(
      headers: true,
      header_converters: :symbol,
      return_headers: false
    )

    Object.const_set class_name, Struct.new(*extract_headers(file_name, options)) {
      require 'csv_class_maker/csv_find'
      include CsvFind

      csv_file file_name, options
    }
  end

  private

  def self.extract_headers(file_name, options={})
    csv_file = File.open(file_name,'r')

    @csv_headers = CSV.new(csv_file, options).first.map do |headers, values|
      headers
    end
  end
end
