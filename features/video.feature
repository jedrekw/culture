Feature: Video

  Background:

  @javascript
  Scenario: Add video
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/wideo"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I fill in "edit-field-video-und-0-fid" with "https://www.youtube.com/watch?v=7bEDG9P74Mo"
    And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Design"
    And I fill in "edit-field-tag-und" with " Magdalena Samozwaniec"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I click XPATH element "//div[5]/div/label"
    And I scroll ID "edit-field-rodzaj-tresci-und" into view
    And I click XPATH element "//fieldset[2]/div/div/div/div/div[2]/label"
    And I click XPATH element "//div[2]/div/div/div[2]/label"
    And I fill in "edit-body-und-0-summary" with random value of length "15"
    And I scroll ID "edit-body-und-0-summary" into view
    And I click XPATH element "//div[2]/div/div/div/span/span[2]/span/span[2]/a[2]"
    And I fill in XPATH field "//div/div/div[2]/div/div/div/div/textarea" with random value of length "30"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see text matching "Wpis"
    And I should see "(Wideo) został dodany."
    And I should see that page contains random generated text
