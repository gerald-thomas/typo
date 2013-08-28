Feature: Merge Articles
When there are multiple bloggers on one site, the authors may write more than one article on the same topic and say similar things. The user will be able to visit the article view, and, if they are an admin, there should be a form on that article's edit page that allows an administrator to enter in the ID of another article to merge the current article with. When this happens, we want to preserve both articles' content, but merge them together into one article. You should verify that both specified articles exist, and that they are not the same article.

The form for merging articles should be on the edit page for an article and it should let the user input the id of the article to be merged with. The merge interface should not be presented for new articles nor to non-administrators, but it is fine for the merge articles functionality to be present for drafts (we will not conduct any tests using draft articles)

Background:
	Given the blog is set up

Scenario: Form for merging articles should be on the edit page for an article for an Admin User
    When I am logged into the admin panel
    And I am on the edit page for an article with ID "1"
    Then I should see a "merge" form field

Scenario: All other users should not see form for merging articles
    When I am on the edit content page for an article
    And I am a non-admin User
    Then I should not see a "merge_with" form field

Scenario: It should let the admin user input the id of a valid article to be merged with
	When I am logged into the admin panel
    And I am on the edit page for an article with ID "1"
    Then I should see a "merge" form field
    Then I should be able to enter a valid Article ID

Scenario: Verify that both specified articles exist, and that they are not the same article
    Given the "current article" and the "merge article" exist
    Then the "current article" and the "merge article" should not be the same

Scenario: When articles are merged, the merged article should contain the text of both articles
	Given the "current article" and the "merge article" exist
	Then the "merged article" should contain "current article" and "merge article"

Scenario: When articles are merged, the merged article should have one author (either one of the two autors of the two original articles)
	Given the "current article" and the "merge article" exist
	Then the "merged article" should contain "current article" and "merge article"
	Then the author of the "merged article" should be the author of "current article" or "merge article"

Scenario: The title of the new article should be the title of one of the merged articles
	Given the "current article" and the "merge article" exist
	Then the "merged article" should contain "current article" and "merge article"
	Then the title of the "merged article" should be the title of "current article" or "merge article"

