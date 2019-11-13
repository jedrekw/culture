<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\RawMinkContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext implements Context, SnippetAcceptingContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * Fills in form field with specified id|name|label|value with random string
     * Example: And I fill in "bwayne" with random value of length "length"
     *
     * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with random value of length "(?P<length>(?:[^"]|\\")*)"$/
     */
    public function fillFieldWithRandomValue($field, $length)
    {
        $field = $this->fixStepArgument($field);
        $value = $this->generateRandomString($length);
        $this->getSession()->getPage()->fillField($field, $value);
    }

    /**
     * @var string
     */
    private $randomString;

    /**
     * Fills in form field with specified id|name|label|value with random string expected to be asserted in assertPageContainsRandomGeneratedText()
     * Example: And I fill in "bwayne" with random value to assert of length "length"
     *
     * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with random value to assert of length "(?P<length>(?:[^"]|\\")*)"$/
     */
    public function fillFieldWithRandomValueToAssert($field, $length)
    {
        $field = $this->fixStepArgument($field);
        $this->randomString = $this->generateRandomString($length);
        $this->getSession()->getPage()->fillField($field, $this->randomString);
    }

    /**
     *
     * @Then /^(?:|I )should see that page contains random generated text$/
     */
    public function assertPageContainsRandomGeneratedText()
    {
        $this->assertSession()->pageTextContains($this->randomString);
    }

    /**
     * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with previously entered value$/
     */
    public function fillFieldWithPreviouslyEnteredValue($field)
    {
        $field = $this->fixStepArgument($field);
        $this->getSession()->getPage()->fillField($field, $this->randomString);
    }

    /**
     *
     * @Then /^(?:|I )should see that page contains element with selector "(?P<selectorType>(?:[^"]|\\")*)"  with locator "(?P<selector>(?:[^"]|\\")*)"  with random generated text$/
     */
    public function assertElementContainsRandomGeneratedText($selectorType, $selector)
    {
        $this->assertSession()->elementTextContains($selectorType, $selector, $this->randomString);
    }

    /**
     *
     * @Then /^(?:|I )should see that page contains element with selector "(?P<selectorType>(?:[^"]|\\")*)"  with locator "(?P<selector>(?:[^"]|\\")*)"  with today's date$/
     */
    public function assertElementContainsTodaysDate($selectorType, $selector)
    {
        $value = date('d/m/Y');
        $this->assertSession()->elementTextContains($selectorType, $selector, $value );
    }

    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    /**
     * Waits on the page for x seconds
     * Example: And I wait for "duration" seconds
     *
     *
     * @When /^(?:|I )wait for "(?P<duration>(?:[^"]|\\")*)" seconds$/
     */
    public function Wait($duration)
    {
        usleep($duration*1000000);
    }

    /**
     * CLicks element with selected XPATH
     * Example: And I click XPATH element "XPATH"
     *
     *
     * @When /^(?:|I )click XPATH element "(?P<xpath>(?:[^"]|\\")*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }

    /**
     * Fills in form field with specified XPATH with random string
     * Example: And I fill in XPATH field "bwayne" with random value of length "length"
     *
     * @When /^(?:|I )fill in XPATH field "(?P<xpath>(?:[^"]|\\")*)" with random value of length "(?P<length>(?:[^"]|\\")*)"$/
     */
    public function fillXPATHFieldWithRandomValue($xpath, $length)
    {
        $value = $this->generateRandomString($length);
        $element = $this->getSession()->getPage()->find('xpath', $xpath);
        if($element === null){
            throw new Exception("Element $xpath not found");
        }else{
            $element->setValue($value);
        }
    }

    /**
     * @When I scroll Name :elementId into view
     */
     public function scrollNameIntoView($elementId) {
            $function = <<<JS
(function(){
  var elem = document.getElementsByName("$elementId")[0];
  elem.scrollIntoView(true);
})()
JS;
        $this->getSession()->executeScript($function);
    }

    /**
     * @When I scroll ID :elementId into view
     */
    public function scrollIdIntoView($elementId) {
        $function = <<<JS
(function(){
  var elem = document.getElementById("$elementId");
  elem.scrollIntoView(true);
})()
JS;
        $this->getSession()->executeScript($function);
    }

    /**
     * Attaches file to field with specified id|name|label|value
     * Example: When I attach "bwayne_profile.png" to "profileImageUpload"
     * Example: And I attach "bwayne_profile.png" to "profileImageUpload"
     *
     * @When /^(?:|I )attach the file "(?P<path>[^"]*)" to the "(?P<field>(?:[^"]|\\")*)"$/
     */
    public function attachFileToField($field, $path)
    {
        $field = $this->fixStepArgument($field);
        $this->getSession()->getPage()->attachFileToField($field, $path);
    }

    /**
     * Fills field with specified id|name|label|value with todays date
     * Example: When I fill in "x" with todays date
     *
     * @When /^(?:|I )fill in "(?P<field>[^"]*)" with todays date$/
     */
    public function FillFieldWIthTodaysDate($field)
    {
        $field = $this->fixStepArgument($field);
        $value = date('d/m/Y');
        $this->getSession()->getPage()->fillField($field, $value);
    }

    /**
     * Fills field with specified id|name|label|value with tomorrows date
     * Example: When I fill in "x" with tomorrows date
     *
     * @When /^(?:|I )fill in "(?P<field>[^"]*)" with tomorrows date$/
     */
    public function FillFieldWIthTomorrowsDate($field)
    {
        $field = $this->fixStepArgument($field);
        $value = date("d/m/Y", strtotime("+1 day"));
        $this->getSession()->getPage()->fillField($field, $value);
    }

    /**
     * CLicks random element form list with selected XPATH
     * Example: And I click random XPATH element "XPATH" with range from "x" to "y"
     *
     *
     * @When /^(?:|I )click random XPATH element "(?P<xpath>(?:[^"]|\\")*)" with range from "([^"]*)" to "([^"]*)"$/
     */
    public function iClickOnRandomElementWithXPath($xpath, $x, $y)
    {
        $session = $this->getSession(); // get the mink session
        $range = rand($x,$y);
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', sprintf($xpath, $range))
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }

    function fixStepArgument($argument)
    {
        return str_replace('\\"', '"', $argument);
    }
}

