require 'ruby-debug'

Then /^I should see a "(.*?)" form field$/ do |arg1|
  #page.all('li#merge').count.should == 1
  page.find_by_id('merge')
end

Then /^I should be able to enter a valid Article ID$/ do
	#File.open(‘tmp/test.html’,’w’){|file| file.write (response.body)} `firefox ‘/tmp/test.html’`
	#File.open('/tmp/test.html','w'){|file| file.write(response.body)} firefox `'/tmp/test.html'`
	fill_in 'like_article_id_excerpt', :with => '2'
	find_field('like_article_id_excerpt').value.should eq '2'
  	#@like_article_id= page.find_field 'like_article_id_excerpt'
  	# unless Article.find_by_id(@like_article_id).valid? then
  	# 	#page.should have_content(:warning "Invalid Article ID")
  	# 	assert page.has_content?("#{field.titlecase} #{error_message}")
  	# end


end
