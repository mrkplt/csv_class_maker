module CsvClassMaker::CsvFind

  def all
    rewind
    object_array = []
    file.each {|row| object_array << build_instance(row, file.lineno) }
    object_array
  end

  def find_by(key_val_pair)
    row = search(key_val_pair).last
    build_instance(row, row[:line_number])
  end

  def find_all_by(key_val_pair)
    rows = search(key_val_pair)
    output_objects = []
    rows.each { |row|
      output_objects << build_instance(row, row[:line_number])
    }
    output_objects
  end

  def find(line_number)
    if (first_line..last_line).include? line_number
      row = front_find(line_number, file.path)
    elsif (middle_line..last_line).include? line_number
      row = back_find(line_number, file.path)
    else
      row = nil
    end
    row.nil? ? nil : build_instance(row, line_number)
  end

  def first
    rewind
    build_instance file.first, first_line
  end

  def last
    last_row = CSV.new(`head -n 1 #{file.path} && tail -n 1 #{file.path}`, headers: true, header_converters: :symbol, return_headers: false).first
    build_instance last_row, last_line
  end

  def each
    rewind
    (first_line..last_line).each do |line_number|
      yield find line_number
    end
  end

  private

  def build_instance(row, line)
    new_instance = self.new
    row.each { |key, value| new_instance.send "#{key}=".to_sym, value }
    new_instance.line_number = line
    return new_instance
  end

  def rewind
    file.rewind
  end

  def search(key_val_pair)
    rewind
    @results = file
    @pairs = key_val_pair

    @pairs.each { |pair|
      @results = dig(pair, @results)
    }

    @results
  end

  def dig(hash_pair, rows)
    @key = hash_pair.first
    @value = hash_pair.last
    @accumulator = []

    rows.each { |row|
      if row[@key] == @value
        if $. != last_line
          @accumulator << row.push(line_number: $.) if $. != last_line
        else
          @accumulator << row
        end
      end
    }

    @accumulator
  end

  def front_find(line_number, file_path)
    CSV.new(`head -n 1 #{file_path} && head -n #{line_number} #{file_path} | tail -n 1`, headers: true, header_converters: :symbol, return_headers: false).first
  end
  def back_find(line_number, file_path)
    CSV.new(`head -n 1 #{file_path} && tail -n #{last_line - line_number} #{file_path} | head -n 1`, headers: true, header_converters: :symbol, return_headers: false).first
  end

end
