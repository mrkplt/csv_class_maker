# frozen_string_literal: true

# Usage:
#
# require './csv_class_maker'
# CsvClassMaker::generate_class 'Batting', '/Users/mplatt/Desktop/Batting.csv'

module CsvClassMaker #:nodoc:
  require 'csv'

  VERSION = {
    major: '2',
    minor: '0',
    patch: '0'
  }.values.join('.')

  def self.generate_class(class_name, file_name, options = {})
    Object.const_set(class_name, Class.new do
      include CsvFind
      csv_file(file_name, options)
    end)
  end
end
