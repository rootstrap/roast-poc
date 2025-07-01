
# frozen_string_literal: true

class BriefParser < Roast::Workflow::BaseStep
  def call
    {
      roles: ["Frontend Developer", "Backend Developer", "UX Designer"],
      stack: ["React Native", "Node.js", "Firebase"],
      brief: "Desarrollar una app móvil de salud mental",
      briefParsed: "Project brief: Desarrollar una app móvil de salud mental\nroles requiered: Frontend Developer,UX Designer\nstack requiered: React Native,Firebase"
    }
  end
end
