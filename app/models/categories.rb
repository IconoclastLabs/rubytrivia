class Categories
  attr_reader :category_list
  #DOMAIN = "start2talk2me.herokuapp.com"

  def initialize
    @category_list = []
    # begin
    #   App::Persistence['categories'] ||= self.seed_categories
    #   @categories = App::Persistence['categories'].dup
    # rescue
    #   App::Persistence['categories'] = self.seed_categories
    #   @categories = App::Persistence['categories'].dup
    # end

    self.load_categories
    self
  end

  def load_categories
    #ap "Loading categories"
    @categories.each_with_index do |category, index|
      @category_list.push(Category.new(index + 1, category))
    end
  end


  #create an array of what categories are live
  def live_list
    my_list = @category_list.select {|category| category.in_use}
    # pluck the ids
    my_list.map(&:name)
  end

  def category_name(id)
    @categories[id - 1]
  end

  def seed_categories
    @categories = ["Normal", "Fun", "Philosophy", "Out There", "Love", "Naughty", "Personal"]
  end
end