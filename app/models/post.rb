class Post < ActiveRecord::Base
  attr_accessible :amount, :body, :order, :summary, :title
  
  def self.new_random
    title = (0...rand(100)).map{ ('a'..'z').to_a[rand(26)] }.join
    body = (1...rand(3)).map{Forgery(:lorem_ipsum).words(rand(900))}.join
    length = body.length
  
    self.new(
      :title => title, 
      :body => body,
      :order => rand(1000000),
      :amount => rand(1000).to_f + rand(1000).to_f / 1000.0,
      :summary => body[0..255]
      )
  end
  
  def self.get_random
    self.first
  end
  
end
