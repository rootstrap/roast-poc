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
    when :start
      "Hi! I'm your Growth Agent 🤖 I help create optimal engineering teams based on your project requirements.\n\n" +
      "Let's start by describing your project. I'll guide you through the process step by step."
    when :roles
      "What roles do you need?\n" +
      "\n*Example:* 'Backend Developer, Full Stack Developer, Product Manager'"
    when :stack
      "What tech stack do you need?\n" +
      "\n*Example:* 'Ruby on Rails, React, PostgreSQL, AWS'"
    else
      "I'm sorry, I didn't understand your request. Please try again."
    end
  end

  def self.processing_message(brief, roles, stack)
    "Thanks for your input! I'm now processing your request, which may take a few moments. Here's a quick summary of what I'll be working on:\n\n" +
    "*Product Brief:* #{brief}\n" +
    "*Tech Stack:* #{stack.length > 0 ? stack.join(', ') : 'Not specified'}\n" +
    "*Roles Needed:* #{roles.length > 0 ? roles.join(', ') : 'Not specified'}\n\n" +
    "I'll get back to you as soon as I have the results. Stay tuned! 🚀"
  end

  private

  def self.cache_key(user_id)
    "slack_conversation:#{user_id}"
  end
end 