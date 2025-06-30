# frozen_string_literal: true
require 'json'

class PodGenerator < Roast::Workflow::BaseStep
  def call
    response = workflow.output["pod_generator_prompt"]

    profiles = response["profiles"]
    pod_profiles = build_profiles(profiles)

    {
      title: response["title"],
      roles: extract_roles(profiles),
      profiles: pod_profiles
    }
  end

  private

  def build_profiles(ai_profiles)
    filtered_profiles = workflow.output["profile_filter_parser"]
    ai_profiles.filter_map do |ai_profile|
      profile = filtered_profiles.find { |p| p[:name] == ai_profile["name"] }
      next unless profile
      
      {
        name: ai_profile["name"],
        role: ai_profile["role"],
        avatar: avatar_url(ai_profile["name"]),
        link: profile[:linkBios],
        description: ai_profile["description"]
      }
    end
  end

  def extract_roles(ai_profiles)
    ai_profiles.map { |p| { name: p["role"], seniority: p["seniority"] } }
  end

  def avatar_url(name)
    initials = name.split(' ').map(&:first).join.upcase
    "https://via.placeholder.com/150?text=#{initials}"
  end
end
