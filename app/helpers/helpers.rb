def find_arrays_of_tags
  return nil if Post.all == nil || Tag.all == nil
  @posts_array = Post.all.reverse
  @array_of_associated_tags = []
  @posts_array.each do |post|
    @tag_ids = PostTag.where('post_id = ?', post[:id]).map {|x| x[:tag_id]}
    @array_of_associated_tags << Tag.find(@tag_ids).map{|x| x[:word]}
  end
  @array_of_associated_tags
end
def clean_up_tags
  Tag.all.each do |tag|
    tag.delete if tag.posts == []
  end
end
