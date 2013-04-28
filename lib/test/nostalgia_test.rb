require 'test/helper'

class TestNostalgia < Test::Unit::TestCase
  
  should "add method nostalgia" do
    class Post < ActiveRecord::Base
      include Nostalgia
    end
    assert Post.new.respond_to?(:nostalgia)
  end

  should 'return changes until set' do
    class Post < ActiveRecord::Base
      include Nostalgia
    end
    post = Post.new
    post.column = 'test'
    assert post.changes == post.nostalgia
  end

  should 'remember changes after_save' do
    class Post < ActiveRecord::Base
      include Nostalgia
    end
    post = Post.create!(:column =>'test')
    assert post.changes.empty?
    assert post.nostalgia['column'][1] == 'test'
  end

  should "should remember changes that occure during callbacks" do
    class Post < ActiveRecord::Base
      before_save :force_to_rest
      include Nostalgia

      def force_to_rest
        write_attribute :column, 'rest'
      end
    end
    post = Post.create!(:column =>'test')
    assert post.changes.empty?
    assert post.nostalgia['column'][1] == 'rest'
  end

end