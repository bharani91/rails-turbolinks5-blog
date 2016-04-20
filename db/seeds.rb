Post.destroy_all
Comment.destroy_all

20.times do |i|
  post = Post.create({
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs(10, false).join
  })

  5.times do |i|
    post.comments.create({
      content: Faker::Lorem.paragraph(2, false, 4)
    })
  end
end
