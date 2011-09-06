Feature: Manage posts
  In order to post to my blog
  as a website editor
  I want to mange posts on my website

  Scenario: Register new post
    Given I am on the new post page
    When I fill in "Title" with "My first post"
    And I fill in "Body" with "I like to post. Don't you?"
    And I uncheck "Published"
    And I press "Create"
    Then I should see "Post 'My first post' successfully created"
    When I go to the home page
    Then I should not see "My first post"

  Scenario: Register and publish new post
    Given I am on the new post page
    When I fill in "Title" with "My first post"
    And I fill in "Body" with "I like to post. Don't you?"
    And I check "Published"
    And I press "Create"
    Then I should see "Post 'My first post' successfully created and published"
    When I go to the home page
    And I follow "My first post"
    Then I should see "I like to post. Don't you?"

  Scenario: Latest posts
    Given 15 published posts exist
    When I am on the home page
    Then I should see 10 posts
    When I follow "Next"
    Then I should see 5 posts

  Scenario: Delete post
    Given the following posts exist:
      |title|body|published|
      |title 1|body 1|false|
      |title 2|body 2|true|
      |title 3|body 3|false|
      |title 4|body 4|true|
    When I am on the posts page
    And I delete the 3rd post
    Then I should see the following posts:
      |Title|Body|Published|
      |title 1|body 1|false|
      |title 2|body 2|true|
      |title 4|body 4|true|
