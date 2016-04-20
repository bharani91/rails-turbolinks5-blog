require "rails_helper"

describe "comments" do
  let(:post) { create(:post) }

  it "should allow adding new comment to post" do
    add_comment(content: "New comment")

    expect(page).to have_content("New comment")
    expect(post.comments.size).to eq(1)
  end

  it "should allow editing existing comment" do
    add_comment(content: "New comment")

    within(".comment-list") do
      click_link "Edit"
    end

    fill_in "comment[content]", with: "Edited comment"
    click_button "Save"
    expect(page).to have_content "Edited comment"
  end


  it "should allow editing existing comment with javascript", js: true do
    add_comment(content: "New comment")

    within(".comment-list") do
      click_link "Edit"
      fill_in "comment[content]", with: "Edited comment"
      click_button "Save"
      expect(page).to have_content "Edited comment"
    end
  end

end


def add_comment(obj)
  visit post_path(post)
  fill_in "comment[content]", with: obj[:content]
  click_button "Save"
end
