# frozen_string_literal: true

class ProfileSummaryGenerator < Roast::Workflow::BaseStep
  def call
    puts "DEBUG: Showing output"

    analysis = workflow.output["profile_filter_prompt"]

    if analysis
      puts "\n" + "="*60
      puts "🔍 PROFILE SUMMARY REPORT"
      puts "="*60
      puts analysis
      puts "="*60
    else
      puts "❌ No analysis result found"
    end
  end
end