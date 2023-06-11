class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', "Non-Fiction"]}
    validate :sufficiently_clickbaity

    private 
    def sufficiently_clickbaity
        unless title.to_s.include?("Won't Believe")
            errors.add(:title, 'Not clickbait-y')
        end
    end
    
end
