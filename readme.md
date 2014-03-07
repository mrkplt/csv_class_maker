CV Reader
========

CSV Reader creates classes out of your CSV headers with some pretty simple search functionality you're probably already comfortable with.

Usage
--------------

Install
```
gem install csv_reader
```
Generate a class to represent the data in your CSV.
```
CsvClassMaker::generate_class 'Yourclass', '/path/to/your.csv'
```

Now you have a class with setters and getters based on the headers of the csv file.

Methods
```
Yourclass.new()
Yourclass.find(line_number)
Yourclass.find_by(header1: 'value', header2: 'value')
Yourclass.find_all_by(header1: 'value', header2: 'value')
Yourclass.first
Yourclass.last
```


License
-------
CSV Reader is Copyright © 2014 Mark Platt, Inc. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
