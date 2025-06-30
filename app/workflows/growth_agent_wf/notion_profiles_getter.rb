
# frozen_string_literal: true

class NotionProfilesGetter < Roast::Workflow::BaseStep
  def call
    parsed_profiles = profiles[:notionProfiles].map { |profile| 
      { name: profile[:name], role: profile[:role], stacks: profile[:tags].join(', ') }.to_json 
    }.join('***')
    {
      notion_profiles: parsed_profiles,
      response: profiles
    }
  end

  private

  def profiles
    {
      notionProfiles: [
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
    }
  end
end
