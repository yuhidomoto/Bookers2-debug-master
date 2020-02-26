class Book < ApplicationRecord
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	belongs_to :user
	has_many :book_comments, dependent: :destroy
	 has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end

    scope :search, ->(search,category,select) do
    if category == "book"
    if select == "perfect"
     where('(title = ?) or (body = ?)', "#{search}","#{search}")

	    elsif select == "foward"
     where('title LIKE ? or body LIKE ?', "#{search}%","#{search}%")
	    elsif select == "down"
     where('title LIKE ? or body LIKE ?', "%#{search}","%#{search}")
	  	elsif select == "part"
     where('title LIKE ? or body LIKE ?', "%#{search}%","%#{search}%")
	  end
   end
end

end