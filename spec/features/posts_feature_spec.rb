require "rails_helper"

describe "posts" do
  it "allows for post creation with valid params" do
    post = build(:post)

    visit root_path
    click_link "New Post"

    fill_in "Title", with: post.title
    fill_in "Content", with: post.content
    click_button "Save"

    expect(page.current_url).to include(Post.first.id.to_s)
    expect(page).to have_content(post.title)
    expect(Post.all.count).to eq(1)
  end

  it "does not allow post without title" do
    post = build(:post, title: "")

    visit root_path
    click_link "New Post"

    fill_in "Title", with: post.title
    fill_in "Content", with: post.content
    click_button "Save"

    expect(page).to have_content "Title can't be blank"
  end

  it "allows editing a post" do
    post = create(:post)

    visit root_path
    click_link post.title

    click_link "Edit"

    fill_in "Title", with: "New title"
    click_button "Save"

    expect(page).to have_content "New title"
  end

  it "should delete a post" do

    post = create(:post)

    visit root_path
    expect(page).to have_content post.title

    click_link post.title

    click_button "Delete"
    expect(page.current_url).to match(/posts$/)
    expect(page).to_not have_content post.title
  end


  it "should delete a post with js", js: true do

    post = create(:post)

    visit root_path
    expect(page).to have_content post.title

    click_link post.title

    page.accept_confirm do
      click_button "Delete"
    end

    sleep 0.1

    expect(page).to_not have_content post.title
    expect(page.current_url).to_not match /#{post.id}$/

  end
end
