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
    bios_details = workflow.output["bios_fetcher"]["bios_details"]
    filtered_profiles = workflow.output["profile_filter_parser"]
    
    ai_profiles.filter_map do |ai_profile|
      bios_profile = bios_details.find { |b| b[:employee][:full_name] == ai_profile["name"] }
      filtered_profile = filtered_profiles.find { |p| p[:name] == ai_profile["name"] }
      next unless bios_profile && filtered_profile
      
      {
        name: bios_profile[:employee][:full_name],
        role: bios_profile[:additional_context][:role][:name],
        avatar: bios_profile[:additional_context][:avatar_url],
        link: filtered_profile[:linkBios],
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
