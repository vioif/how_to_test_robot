require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot              = Robot.new
    robot.foreign_model=(true)
    robot.needs_repairs=(true)

    # act
    actual_value   = robot.station
    expected_value = 1

    # assert
    asserted_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    robot              = Robot.new
    robot.vintage_model=(true)
    robot.needs_repairs=(true)

    # act
    actual_value   = robot.station
    expected_value = 2

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    robot              = Robot.new
    robot.needs_repairs=(true)

    # act
    actual_value   = robot.station
    expected_value = 3

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    robot              = Robot.new

    # act
    actual_value   = robot.station
    expected_value = 4

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot              = Robot.new

    # act
    actual_value = robot.prioritize_tasks
    expected_value = -1

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    robot = Robot.new

    # act
    robot.todos    =([3,23,50])
    actual_value   = robot.prioritize_tasks
    expected_value = 50

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    robot = Robot.new

    # act
    robot.day_off  = 4
    actual_value   = robot.workday?(4)
    expected_value = false

    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_not_day_off_returns_true
    
    # arrange
    robot = Robot.new

    # act
    robot.day_off  = 4
    actual_value   = robot.workday?(3)
    expected_value = true

    # assert
    assert_equal(expected_value, actual_value)
  end

end
