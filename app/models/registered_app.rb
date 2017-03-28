class RegisteredApp < ActiveRecord::Base
    belongs_to :user
    has_many :events
    
    validates :name, length: { minimum: 5 }, presence: true
    validates :url, presence: true
    validates :user, presence: true
end
