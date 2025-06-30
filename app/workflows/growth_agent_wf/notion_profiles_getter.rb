
# frozen_string_literal: true

class NotionProfilesGetter < Roast::Workflow::BaseStep
  def call
    profiles[:notionProfiles].map { |profile| 
      { name: profile[:name], role: profile[:role], stacks: profile[:tags].join(', ') }.to_json 
    }.join('***')
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
      ]
    }
  end
end
