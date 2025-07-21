# frozen_string_literal: true

class SlackConversationService
  CONVERSATION_TIMEOUT = 10.minutes

  def self.get_state(user_id)
    Rails.cache.read(cache_key(user_id)) || { step: :start }
  end

  def self.set_state(user_id, state)
    Rails.cache.write(cache_key(user_id), state, expires_in: CONVERSATION_TIMEOUT)
  end

  def self.clear_state(user_id)
    Rails.cache.delete(cache_key(user_id))
  end

  def self.next_step(current_step)
    steps = [:start, :brief, :roles, :stack, :complete]
    current_index = steps.index(current_step)
    return :complete if current_index.nil? || current_index >= steps.length - 1
    steps[current_index + 1]
  end

  def self.step_prompt(step)
    case step
    when :brief
      "What's your project brief? (e.g., 'Mobile health app for tracking symptoms')"
    when :roles
      "What roles do you need? (e.g., 'Backend Developer, Frontend Developer')"
    when :stack
      "What tech stack? (e.g., 'Ruby on Rails, React, PostgreSQL')"
    else
      "Hi! I help create team pods. Let's start by describing your project."
    end
  end

  private

  def self.cache_key(user_id)
    "slack_conversation:#{user_id}"
  end
end 