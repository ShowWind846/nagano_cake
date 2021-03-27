module Searchform
  extend ActiveSupport::Concern 

  def search_genre
    @genre_id = params[:genre]
    @genre_items = Item.where(genre_id: @genre_id)
    @genre_name = Genre.all.map {|genre_name| [genre_name.name,genre_name.id]}
  end

end