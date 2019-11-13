Feature: Article

  Background:

    @javascript
    Scenario: Add article - check page
      Given I am on "/user/login"
      And  I fill in "edit-name" with "Behat-redaktor"
      And  I fill in "edit-pass" with "Test1234"
      And I press "edit-submit"
      When I am on "/node/add/article"
      Then I should see text matching "Dodaj Artykuł"
      And I should see text matching "Tytuł artykułu"
      And I should see text matching "Język"
      And I should see text matching "Podsumowanie"
      And I should see text matching "Treść artykułu"
      And I should see "Powiązane elementy"
      And I should see text matching "Państwa Azja"
      And I should see text matching "Informacja o nowej wersji"

    @javascript
    Scenario: Add article
      Given I am on "/user/login"
      And  I fill in "edit-name" with "Behat-redaktor"
      And  I fill in "edit-pass" with "Test1234"
      And I press "edit-submit"
      And I am on "/node/add/article"
      When I fill in "edit-title" with random value to assert of length "8"
      And I select "PL" from "edit-language"
      And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image-und-0-upload"
      And I press "field_image_und_0_upload_button"
      And I scroll Name "field_image[und][0][alt]" into view
      And I attach the file "/data/staging/culture/pict.png" to the "edit-field-image2-und-0-upload"
      And I press "field_image2_und_0_upload_button"
      And I fill in "edit-field-category-und" with "Architektura"
      And I fill in "edit-field-tag-und" with random value of length "5"
      And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
      And I fill in "edit-body-und-0-summary" with random value of length "12"
      And I press "cke_12"
      And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
      And I attach the file "/data/staging/culture/pict.png" to the "edit-field-top-photo-und-0-upload"
      And I scroll Name "field_youku_add_more" into view
      And I press "field_top_photo_und_0_upload_button"
      And I fill in "edit-field-link-und-0-title" with random value of length "7"
      And I fill in "edit-field-link-und-0-url" with "www.onet.pl"
      And I click XPATH element "//div[4]/div[3]/div/div/div/input"
      And I fill in "edit-log" with random value of length "10"
      And I scroll Name "log" into view
      And I press "edit-submit"
      Then I should see text matching "Auto-publishing this revision."
      And I should see "(Artykuł) został dodany."
      And I should see that page contains random generated text

  @javascript
  Scenario: View article in content list
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/article"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "12"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I attach the file "C:/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I scroll Name "field_youku_add_more" into view
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-link-und-0-title" with random value of length "7"
    And I fill in "edit-field-link-und-0-url" with "www.onet.pl"
    And I click XPATH element "//div[4]/div[3]/div/div/div/input"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see "(Artykuł) został dodany."
    And I should see that page contains random generated text
    And I am on "/admin/content"
    And I should see that page contains random generated text
    When I fill in "title" with previously entered value
    And I select "Artykuł" from "type"
    And I click XPATH element "//div[7]/input"
    Then I should see that page contains element with selector "xpath"  with locator "//td[2]/a"  with random generated text
    And I should see "Artykuł" in the "td.views-field.views-field-type" element
    And I should see "Behat-redaktor" in the "a.username" element
    And I should see that page contains element with selector "xpath"  with locator "//td[6]"  with today's date
    And I should see "edytuj" in the "td.views-field.views-field-edit-node > a" element
    And I should see "Polski" in the "td.views-field.views-field-language" element
    And I should see "usuń" in the "td.views-field.views-field-edit-node" element

  @javascript
  Scenario: Edit article
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/article"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "12"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I attach the file "C:/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I scroll Name "field_youku_add_more" into view
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-link-und-0-title" with random value of length "7"
    And I fill in "edit-field-link-und-0-url" with "www.onet.pl"
    And I click XPATH element "//div[4]/div[3]/div/div/div/input"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Artykuł" from "type"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a"
    When I fill in "edit-title" with random value to assert of length "9"
    And I fill in "edit-field-category-und" with "Komiks"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I scroll ID "edit-language" into view
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "32"
    And I fill in "edit-field-link-und-0-title" with random value of length "8"
    And I fill in "edit-field-link-und-0-url" with "www.wp.pl"
    And I fill in "edit-log" with random value of length "11"
    And I scroll Name "log" into view
    And I press "edit-submit"
    Then I should see text matching "Auto-publishing this revision."
    And I should see "(Artykuł) został zaktualizowany."
    And I should see that page contains random generated text

  @javascript
  Scenario: Remove article
    Given I am on "/user/login"
    And  I fill in "edit-name" with "Behat-redaktor"
    And  I fill in "edit-pass" with "Test1234"
    And I press "edit-submit"
    And I am on "/node/add/article"
    When I fill in "edit-title" with random value to assert of length "8"
    And I select "PL" from "edit-language"
    And I attach the file "C:/pict.png" to the "edit-field-image-und-0-upload"
    And I press "field_image_und_0_upload_button"
    And I scroll Name "field_image[und][0][alt]" into view
    And I attach the file "C:/pict.png" to the "edit-field-image2-und-0-upload"
    And I press "field_image2_und_0_upload_button"
    And I fill in "edit-field-category-und" with "Architektura"
    And I fill in "edit-field-tag-und" with random value of length "5"
    And I select "Materiał autorski" from "edit-field-rodzaj-tresci-und"
    And I fill in "edit-body-und-0-summary" with random value of length "12"
    And I press "cke_12"
    And I fill in XPATH field "//div[2]/div/div/div/div/textarea" with random value of length "30"
    And I attach the file "C:/pict.png" to the "edit-field-top-photo-und-0-upload"
    And I scroll Name "field_youku_add_more" into view
    And I press "field_top_photo_und_0_upload_button"
    And I fill in "edit-field-link-und-0-title" with random value of length "7"
    And I fill in "edit-field-link-und-0-url" with "www.onet.pl"
    And I click XPATH element "//div[4]/div[3]/div/div/div/input"
    And I fill in "edit-log" with random value of length "10"
    And I scroll Name "log" into view
    And I press "edit-submit"
    And I am on "/admin/content"
    When I fill in "title" with previously entered value
    And I select "Artykuł" from "type"
    And I click XPATH element "//div[7]/input"
    And I click XPATH element "//td[7]/a[2]"
    Then I should see that page contains element with selector "xpath"  with locator "//em"  with random generated text
    And I should see text matching "Czy na pewno usunąć"
    And I should see text matching "Operacja jest nieodwracalna."
    When I press "op"
    Then I should see text matching "Usunięto wpis"
    And I should see that page contains element with selector "xpath"  with locator "//div/em"  with random generated text


#    NIE WIDAC "edit-body-und-0-summary" PRZY EDYCJI, zgłoszxone
#  USUWANIE NIE USUWA, zgłoszone