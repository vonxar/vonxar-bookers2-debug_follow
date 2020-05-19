class Book < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :book_comments,dependent: :destroy
	has_many :favorites,dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user
	
		def favorite?(book, user)
		book.favorites.find_by(user_id: user.id)
    end
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
