# Usage:
#
# require './csv_class_maker'
# CsvClassMaker::generate_class 'Batting', '/Users/mplatt/Desktop/Batting.csv'

module CsvClassMaker
  require 'csv'

  VERSION = {
    major: '1',
    minor: '1',
    patch: '0'
  }.values.join('.')

  def self.generate_class(class_name, file_name, options = {})
    Object.const_set(class_name, Class.new do
      include CsvFind
      csv_file(file_name, options)
    end
    )
  end
end
