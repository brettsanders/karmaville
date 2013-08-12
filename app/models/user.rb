class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_total

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  scope :by_karma, lambda { order('karma_total DESC').limit(50) }
  scope :page, lambda { |current_page, per_page|
    offset(current_page.to_i*per_page)
  }

  # def self.by_karma
  #   order('karma_total DESC').limit(50)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.total_users
    User.count
  end

  # def self.by_karma
  #   joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  # end

  # def total_karma
  #   self.karma_points.sum(:value)
  # end
end



