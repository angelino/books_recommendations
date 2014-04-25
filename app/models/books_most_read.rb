class BooksMostRead

  def the_most_read
    books_most_read.sort_by { |b| b.number_of_readers }.reverse
  end

  private

  def books_most_read
    @the_best_books ||= Book.where(id: books_most_read_ids)
  end

  def books_most_read_ids
    @ids ||= BookRating.group(:book_id).order('qtd DESC').limit(20).pluck('book_id', 'count(book_id) AS qtd').collect { |item| item.first }
  end

end
