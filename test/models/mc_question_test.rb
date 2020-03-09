# == Schema Information
#
# Table name: mc_questions
#
#  id           :bigint           not null, primary key
#  answer       :string
#  distractor_1 :string
#  distractor_2 :string
#  question     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

# check test/fixtures/mc_questions.yml
class McQuestionTest < ActiveSupport::TestCase

  test "fixtures are valid" do
    q = mc_questions(:one)
    assert q.valid?, q.errors.full_messages.inspect 
  end

  test "fixtures list is valid" do
    mc_questions.each do |mc_question|
      assert mc_question.valid?, mc_question.errors.full_messages.inspect
    end
  end

  test "validation_presence_fixtures" do
    mc_question = mc_questions(:one)
    mc_question.question = nil
    assert_not mc_question.valid?

    mc_question.question = ""
    assert_not mc_question.valid?
  end

  test "validation_unique_fixtures" do
    one = mc_questions(:one)
    two = mc_questions(:two)
    one.question = two.question
    assert_not one.valid?
  end
  
  test "answer_different_from_distractor" do
    one = mc_questions(:one)
    one.distractor_1 = one.answer
    assert_not one.valid?

    one = mc_questions(:one)
    one.distractor_2 = one.answer
    assert_not one.valid?

    one = mc_questions(:one)
    one.distractor_1 = one.distractor_2
    assert_not one.valid?
  end

end

#============== Test cases ==============# 
# any empty field would render invalid
#
# score Negative :integer
# score champion_score <= runner_up_score
#
# year Negative :integer 
# year before 1st worldcup and in future
# year unique
#
# champion == runner_up