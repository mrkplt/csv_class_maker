Gem::Specification.new do |s|
  s.name = %q{csv_reader}
  s.version = "0.0.1"
  s.date = %q{2014-03-06}
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = %q{'csv_reader will create a class out of your csv's headers, and provide some methods for finding data in the CSV'} 
  s.summary = %q{'Object oriented CSV reading'}
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.test_files = 'spec/csv_reader_spec.rb'
  s.files = [
    "lib/csv_reader/csv_class_maker.rb",
    "lib/csv_reader/csv_find.rb",
    "lib/csv_reader.rb",
  ]
  s.homepage    = 'http://mrkplt.com'
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"

end
