Gem::Specification.new do |s|
  s.name = %q{csv_class_maker}
  s.version = '0.2.1'
  s.date = %q{2014-03-06}
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = %q{'csv_class_maker will create a class out of your csv's headers, and provide some methods for finding data in the CSV'}
  s.summary = %q{'Object oriented CSV reading'}
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.test_files = 'spec/csv_class_maker_spec.rb'
  s.files = [
    'lib/csv_class_maker/csv_class_maker.rb',
    'lib/csv_class_maker/csv_find.rb',
    'lib/csv_class_maker.rb',
  ]
  s.homepage    = 'http://mrkplt.com'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 0'

end
