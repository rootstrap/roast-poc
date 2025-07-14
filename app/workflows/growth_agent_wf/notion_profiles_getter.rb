
# frozen_string_literal: true
require_relative '../../services/notion_client'

class NotionProfilesGetter < Roast::Workflow::BaseStep
  def call
    notion_profiles = fetch_notion_profiles
    parsed_profiles = notion_profiles.map { |profile|
      { name: profile[:name], role: profile[:role], stacks: (profile[:tags] || []).join(', ') }.to_json
    }.join('***')
    {
      notion_profiles: parsed_profiles,
      response: { notionProfiles: notion_profiles }
    }
  end

  private

  def fetch_notion_profiles
    client = NotionClient.new
    profiles = client.fetch_profiles
    profiles.nil? ? profiles_mocked : profiles
  end

  def profiles_mocked
    [
      {
        location: "Argentina",
        name: "Ana Gómez",
        englishLevel: "Advanced",
        linkBios: "https://www.notion.so/ana-profile",
        role: "Frontend Developer",
        department: ["Engineering", "Web"],
        previousProjects: ["Project X", "Project Y"],
        tags: ["React", "Team Player"],
        industries: ["Healthcare", "Finance"],
        seniority: ["Mid"],
        mainSkills: ["React Native", "TypeScript"],
      },
      {
        location: "Colombia",
        name: "Luis Pérez",
        englishLevel: "Intermediate",
        linkBios: "https://www.notion.so/luis-profile",
        role: "Backend Developer",
        department: ["Engineering"],
        previousProjects: ["Project A"],
        tags: ["Node.js", "Leadership"],
        industries: ["E-commerce"],
        seniority: ["Senior"],
        mainSkills: ["Node.js", "PostgreSQL"],
      },
      {
        location: "Mexico",
        name: "Roberto Martínez",
        englishLevel: "Fluent",
        linkBios: "https://www.notion.so/roberto-profile",
        role: "DevOps Engineer",
        department: ["Engineering", "DevOps"],
        previousProjects: ["Project A"],
        tags: ["AWS", "Docker", "Kubernetes"],
        industries: ["E-commerce"],
        seniority: ["Senior"],
        mainSkills: ["AWS", "Docker", "Kubernetes"],
      },
    ]
  end
end
