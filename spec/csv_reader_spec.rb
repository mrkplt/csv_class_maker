require './csv_class_maker'

describe CsvClassMaker do
  context 'class methods' do
    describe 'generate_class' do
      it 'makes a new class object from a file' do
        CsvClassMaker::generate_class 'People', 'spec/demo.csv'
        Object.constants.include? :People
      end
    end
  end
end

describe Object do
  before(:all){
    @person1 = People.new(first: 'Mark', last: 'Platt', nickname: 'JCool')
  }
  context 'class methods' do
    it "responds to .first" do
      (People).should respond_to(:first)
    end
    it "responds to .first" do  
      expect(People.first).to eq @person1
    end
    it "responds to .last" do
      (People).should respond_to(:last)
    end
    it "responds to .last" do
      (People).should respond_to(:last)
    end
    it "responds to .find" do
      (People).should respond_to(:find)
    end
    it "responds to .find" do
      (People).should respond_to(:find)
    end
    it "responds to .find_by" do
      (People).should respond_to(:find_by)
    end
    it "responds to .find_by" do
      (People).should respond_to(:find_by)
    end
    it "responds to .find_all_by" do
      (People).should respond_to(:find_all_by)
    end
    it "responds to .find_all_by" do
      (People).should respond_to(:find_all_by)
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
