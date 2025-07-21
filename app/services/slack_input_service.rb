# frozen_string_literal: true

class SlackInputService
  def self.parse_simple_list(text)
    text.split(/[,\n]/)
        .map(&:strip)
        .reject(&:empty?)
        .map { |item| item.gsub(/^[-•*]\s*/, '') }
  end

  def self.build_workflow_input(brief, roles_text, stack_text, user_id, channel_id)
    {
      brief: brief.strip,
      roles: parse_simple_list(roles_text),
      stack: parse_simple_list(stack_text),
      user_id: user_id,
      channel_id: channel_id
    }
  end
end 