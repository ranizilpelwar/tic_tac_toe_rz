# tic_tc_toe_rz
Ruby gem for Tic Tac Toe core logic:

This gem contains the business logic and game rules for playing Tic Tac Toe. As it does not contain console or UI logic, implementation of the gem can be observed by playing the game on the web, via:
http://ec2-18-188-188-202.us-east-2.compute.amazonaws.com/current/public/index.html

This gem is published on rubygems.org, it is located here: https://rubygems.org/gems/tic_tac_toe_rz


This gem includes various types of tests to test the individual components and to exercise the game logic. Three different testing frameworks were used. You will see there is overlap of tests between the three different frameworks.
With Test::Unit, unit tests were written.
Then with RSpec, unit tests were rewritten using this framework to exercise its use and additional tests were also added.
Then with Cucumber, some tests were rewritten again here to exercise its use and to write behavior-driven tests to exercise use of BDD.



To run the tests, use the following commands on the terminal:

Install the tools: bundle install

For Test::Unit tests: rake run_tests

For RSpec tests: rspec

For Cucumber tests: cucumber

