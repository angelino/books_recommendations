require 'csv'

class UserImporter
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_users
  end

  private

  def build_users
    data.collect do |row|
      User.new(
        id: row[:userid],
        age: clean(row[:age]),
        location: clean(row[:location])
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
