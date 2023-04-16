class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :first_phrase, length: { maximum: 30 }
  validates :second_phrase, length: { maximum: 30 }
  validates :third_phrase, length: { maximum: 30 }
  validates :pen_name, length: { maximum: 50 }
  validate :category_valid, on: :category_valid

  CATEGORIES = %w[
    女性パワーで未来を変えるの部
    ジェンダー・多様性の部
    はたらく女子の部
    ママ・子どもの部
    名もなき家事の部
    本当にありがとう❣️感謝の部
    あるある❣️の部
    涙がポロ❣️の部
    輝け❣️私のライフスタイルの部
    心がきゅん❣️私の癒しの部
    SDGsアクションの部
  ].freeze

  QUESTIONARIES = %w[
    公式Facebookページ
    公式Instagram
    公式LINE
    川柳募集サイト
    WIPメンバーのブログや投稿など
    WEBやSNS記事
    新聞や雑誌などのメディア
    検索サーチ
    知人からの紹介
    その他
  ].freeze

  def category_valid
    errors.add(:category, "を入力してください") if first_phrase.present? && category.blank?
  end
end
