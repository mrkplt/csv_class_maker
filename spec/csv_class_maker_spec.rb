require './lib/csv_class_maker'
require 'byebug'

describe CsvClassMaker do
  context 'class methods' do
    describe 'generate_class' do
      it 'makes a new class object from a file' do
        CsvClassMaker::generate_class 'People', 'spec/support/demo.csv'
        Object.constants.include? :People
      end

      it 'takes a file options' do
        people = CsvClassMaker::generate_class 'Other', 'spec/support/delimeter.csv', col_sep: "\t"
        people.first.should respond_to(:nickname)
      end
    end
  end
end

describe Object do
  before(:all){
    debugger
    @person1 = People.new(first: 'Mark', last: 'Platt', nickname: 'JCool')
    @person2 = People.new(first: 'Longinus', last: 'Smith', nickname: 'Pebbles')
    @person3 = People.new(first: 'Johnny', last: 'Radiation', nickname: 'Pebbles')
    @person4 = People.new(first: 'Charlie', last: 'Mansfield', nickname: 'Sammykins')
  }

  context 'class methods' do
    it "responds to .first" do
      (People).should respond_to(:first)
    end

    it ".first returns correctly" do
      expect(People.first).to eq @person1
    end

    it "responds to .last" do
      (People).should respond_to(:last)
    end

    it ".last returns correctly" do
      expect(People.last).to eq @person4
    end

    it "responds to .find" do
      (People).should respond_to(:find)
    end

    it ".find returns correctly" do
      expect(People.find(3)).to eq @person2
    end

    it "responds to .find_by" do
      (People).should respond_to(:find_by)
    end

    it ".find_by returns correctly" do
      expect(People.find_by(nickname: 'Pebbles')).to eq @person3
      expect(People.find_by(nickname: 'Pebbles', last: 'Smith')).to eq @person2
    end

    it "responds to .find_all_by" do
      (People).should respond_to(:find_all_by)
    end

    it ".find_all_by returns correctly" do
      expect(People.find_all_by(nickname: 'Pebbles')).to eq [@person2, @person3]
      expect(People.find_all_by(nickname: 'Pebbles', last: 'Radiation')).to eq [@person3]
    end

    it "responds to .each" do
      (People).should respond_to(:each)
    end

    it ".each line yields" do
      @output = []
      People.each{ |person| @output << person.first }
      expect(@output).to eq ['Mark', 'Longinus', 'Johnny', 'Charlie']
    end
  end
  context 'instance methods' do
    it "responds to .first as defined in the csv" do
      (People.new).should respond_to(:first)
    end

    it "responds to .last as defined in the csv" do
      (People.new).should respond_to(:last)
    end

    it "responds to .nickname as defined in the csv" do
      (People.new).should respond_to(:nickname)
    end
  end
end
