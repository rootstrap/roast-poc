# frozen_string_literal: true

class ShowOutput < Roast::Workflow::BaseStep
  def call
    puts "DEBUG: Showing output"
    
    analysis = workflow.output['analyze_code']
    
    if analysis
      puts "\n" + "="*60
      puts "🔍 CODE ANALYSIS REPORT"
      puts "="*60
      puts analysis
      puts "="*60
    else
      puts "❌ No analysis result found"
    end
  end
end