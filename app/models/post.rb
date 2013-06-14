class Post < ActiveRecord::Base
  attr_accessible :amount, :body, :order, :summary, :title
end
