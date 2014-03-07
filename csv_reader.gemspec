Gem::Specification.new do |s|
  s.name = %q{csv_reader}
  s.version = "0.0.1"
  s.date = %q{2014-03-06}
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = %q{csv_reader will suck yo dick} 
  s.summary = %q{csv_reader will suck yo dick}
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.test_files = 'spec/csv_reader_spec.rb'
  s.files = [
    "lib/csv_class_maker.rb",
    "lib/time_jawn/csv_find.rb",
  ]
  s.homepage    = 'http://mrkplt.com
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"

end
