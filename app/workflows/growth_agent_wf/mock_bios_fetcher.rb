# frozen_string_literal: true
require_relative 'mock_data'

class MockBiosFetcher < Roast::Workflow::BaseStep
  def call
    filtered_profiles = workflow.output["profile_filter_parser"]
    bios_details = MockData.bios_details(filtered_profiles)
    { bios_details: bios_details }
  end
end
