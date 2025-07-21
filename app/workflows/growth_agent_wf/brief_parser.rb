
# frozen_string_literal: true

class BriefParser < Roast::Workflow::BaseStep
  def call
    {
      roles: ["Backend Developer"],
      stack: ["Ruby on Rails", "PostgreSQL"],
      brief: "Desarrollar una app móvil de salud mental",
      briefParsed: "Project brief: Desarrollar una app móvil de salud mental\nroles requiered: Backend Developer\nstack requiered: Ruby on Rails"
    }
  end
end
