require 'csv'

class BookRatingImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_book_ratings
  end

  private

  def build_book_ratings
    data.collect do |row|
      BookRating.new(
        user_id: row[:userid],
        book_id: books[row[:isbn]],
        rating:  row[:bookrating]
      )
    end
  end

  def data
    CSV.open(filename, 'r', encoding: 'cp1252', col_sep: ';', headers: true, header_converters: :symbol)
  end

  def books
    @books ||= Hash[Book.pluck(:isbn, :id)]
  end

end
