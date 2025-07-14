# frozen_string_literal: true

class BiosFetcher < Roast::Workflow::BaseStep
  def call
    filtered_profiles = workflow.output["profile_filter_parser"]
    bios_details = ::BiosFetcherService.new(filtered_profiles).fetch_bios
    { bios_details: bios_details }
  end
end
