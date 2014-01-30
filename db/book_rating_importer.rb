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
      user = User.where(id: row[:userid]).first

      book = Book.where(isbn: row[:isbn]).first

      rating = BookRating.new
      rating.user = user
      rating.book = book
      rating.rating = row[:bookrating]

      rating
    end
  end

  def data
    CSV.open(filename, 'r', encoding: 'cp1252', col_sep: ';', headers: true, header_converters: :symbol)
  end
end
