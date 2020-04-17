# frozen_string_literal: true

require './lib/csv_class_maker'

describe CsvClassMaker do
  context 'class methods' do
    describe 'generate_class' do
      it 'makes a new class object from a file' do
        CsvClassMaker.generate_class 'People', 'spec/support/demo.csv'
        expect(Object.constants).to include(:People)
      end

      it 'takes a file options' do
        people = CsvClassMaker.generate_class(
          'Other',
          'spec/support/delimeter.csv',
          col_sep: "\t"
        )

        expect(people.first).to respond_to(:nickname)
      end
    end
  end
end
