require 'ruby-debug'

Then /^I should see a "(.*?)" form field$/ do |arg1|
  #page.all('li#merge').count.should == 1
  page.find_by_id('merge')
end

Then /^I should be able to enter a valid Article ID$/ do
  @like_article_id= page.find_labelled 'like_article_id'

end
