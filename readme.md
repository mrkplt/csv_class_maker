CSV Class Maker v1.1.0
========

[![Code Climate](https://codeclimate.com/github/mrkplt/csv_class_maker.png)](https://codeclimate.com/github/mrkplt/csv_class_maker)

CSV Class Maker creates classes out of your CSV headers with some pretty simple search functionality you're probably already comfortable with.

Version 1 has a Ruby 2 requirement. Go pre v1 for 1.9.3. Bug fixes accepted for both.

Usage
--------------

Install
```
gem install csv_class_maker
```
Generate a class to represent the data in your CSV.
```
CsvClassMaker::generate_class('Yourclass', '/path/to/your.csv')
```

You can pass in other delimiters, like a tab.
```
CsvClassMaker::generate_class('Yourclass', '/path/to/your.csv', col_sep: "\t")
```

Now you have a class with setters and getters based on the headers of the csv file.

All methods return an instance of Yourclass or an array of Yourclass.

Methods
```
Yourclass.new
Yourclass.find(line_number)
Yourclass.where(header1: 'value', header2: 'value')
Yourclass.first
Yourclass.last
Yourclass.each { |a| a.method  }
```

Plus, as of v1.0.4, the Enumerable module is implemented in all CSV classes!

License
-------
CSV Class Maker is Copyright © 2015 Mark Platt, Inc. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
