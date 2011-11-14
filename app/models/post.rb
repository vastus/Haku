class Post < ActiveRecord::Base
  default_scope order("created_at DESC")

  searchable do
    text :title, :boost => 2
    text :content, :datum
    time :created_at
    string :datum
  end

  def datum
    created_at.strftime("%h %Y")
  end
end
