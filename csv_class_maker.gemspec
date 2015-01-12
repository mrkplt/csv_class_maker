Gem::Specification.new do |s|
  s.name = %q{csv_class_maker}
  s.version = '1.0.0'
  s.date = %q{2015-01-12}
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = %q{'csv_class_maker will create a class out of your csv's headers, and provide some methods for finding data in the CSV'}
  s.summary = %q{'Object oriented CSV reading'}
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.0.0'
  s.test_files = 'spec/csv_class_maker_spec.rb'
  s.files = [
    'lib/csv_class_maker/csv_class_maker.rb',
    'lib/csv_class_maker/csv_find.rb',
    'lib/csv_class_maker.rb',
  ]
  s.homepage    = 'http://mrkplt.com'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'byebug', '~> 3.5.1'

end
