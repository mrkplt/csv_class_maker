# frozen_string_literal: true

require './lib/csv_class_maker/csv_class_maker'

Gem::Specification.new do |s|
  s.name = 'csv_class_maker'
  s.version = CsvClassMaker::VERSION
  s.date = '2020-04-17'
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = "'csv_class_maker will create a class out of your csv's headers, and provide some methods for finding data in the CSV'"
  s.summary = "'Object oriented CSV reading'"
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.5.0'
  s.test_files = 'spec/csv_class_maker_spec.rb'
  s.files = [
    'lib/csv_class_maker/csv_class_maker.rb',
    'lib/csv_class_maker.rb'
  ]
  s.homepage = 'http://mrkplt.com'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'csv_find', '~> 1.0.0'
  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency 'rubocop', '~> 0.82'
end
