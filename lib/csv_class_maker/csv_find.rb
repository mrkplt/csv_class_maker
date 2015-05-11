module CsvClassMaker::CsvFind
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :prepend, InstanceMethods
  end

  module InstanceMethods
    attr_accessor :line_number

    def initialize(hash = nil)
      if hash
        hash.each { |k,v| send("#{k}=".to_sym, v) }
      end
    end

    def ==(other_instance)
      instance_variables.map do |instance_variable|
        self.instance_variable_get(instance_variable) ==
          other_instance.instance_variable_get(instance_variable)
      end
    end

    private

    attr_reader :hash
  end

  module ClassMethods
    def csv_file(file_name, options = {})
      @file_options = options
      @file = CSV.new(File.open(file_name, 'r'), @file_options)
      @first_line = 2
      @last_line = `wc -l #{file_name}`.split(' ').first.to_i
      @middle_line = (@last_line/2)+1
      @line_number = nil
      extract_headers(file_name, options)
      define_accessors
    end

    def headers; return @headers; end
    def file; return @file; end
    def first_line; return @first_line; end
    def middle_line; return @middle_line; end
    def last_line; return @last_line; end
    def file_options; return @file_options; end

    def define_accessors
      headers.each do |header|
        self.send(:attr_accessor, header)
      end
    end

    def all
      rewind
      file.map { |row| build_instance(row, file.lineno) }
    end

    def find_by(key_val_pair)
      row = search(key_val_pair).last
      build_instance(row, row[:line_number])
    end

    def find_all_by(key_val_pair)
      search(key_val_pair).map { |row| build_instance(row, row[:line_number]) }
    end

    def find(line_number)
      row = if (first_line..middle_line).include? line_number
        front_find(line_number, file.path)
      elsif (middle_line..last_line).include? line_number
        back_find(line_number, file.path)
      end

      row.nil? ? row : build_instance(row, line_number)
    end

    def first
      rewind
      build_instance(file.first, first_line)
    end

    def last
      command = `head -n 1 #{file.path} && tail -n 1 #{file.path}`
      last_row = CSV.new(command, file_options).first
      build_instance(last_row, last_line)
    end

    def each
      rewind
      (first_line..last_line).each do |line_number|
        yield find(line_number)
      end
    end

    private

    def extract_headers(file_name, options)
      csv_file = File.open(file_name,'r')

      @headers ||= CSV.new(csv_file, options).first.map do |headers, values|
        headers
      end
    end

    def build_instance(row, line)
      new_instance = self.new
      row.each { |key, value| new_instance.send("#{key}=".to_sym, value) }
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

      @pairs.each { |pair| @results = dig(pair, @results) }

      @results
    end

    def dig(hash_pair, rows)
      rows.map do |row|
        if row[hash_pair.first] == hash_pair.last
          $. != last_line ? row.push(line_number: $.) : row
        end
      end.reject(&:nil?)
    end

    def front_find(line_number, file_path)
      command = `head -n 1 #{file_path} && head -n #{line_number} #{file_path} | tail -n 1`
      CSV.new(command, file_options).first
    end

    def back_find(line_number, file_path)
      command = `head -n 1 #{file_path} && tail -n #{(last_line + 1) - line_number} #{file_path} | head -n 1`
      CSV.new(command, file_options).first
    end
  end
end
