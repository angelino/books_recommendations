require 'csv'

class BookImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_books
  end

  private

  def build_books
    data.collect do |row|
      Book.new(
        isbn: row[:isbn],
        title: clean(row[:booktitle]),
        author: clean(row[:bookauthor]),
        year_of_publication: clean(row[:year_of_publication]),
        publisher: clean(row[:publisher])
      )
    end
  end

  def data
    CSV.open(filename, 'r', encoding: 'cp1252', col_sep: ';', headers: true, header_converters: :symbol)
  end

  def clean(value)
    if value == 'NULL' || value == ''
      nil
    else
      value
    end
  end
end
