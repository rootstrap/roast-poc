# frozen_string_literal: true

class OutputGenerator < Roast::Workflow::BaseStep
  def call
    pod_structure = workflow.output["pod_generator"]
    
    return { output: "❌ No profiles found." } if pod_structure[:profiles].empty?
    
    output_text = format_output(pod_structure)
    puts output_text
    
    { output: output_text }
  end

  private

  def format_output(pod_structure)
    output = []
    
    output << "\n🚀 #{pod_structure[:title]}"
    output << "="*60
    output << ""
    
    pod_structure[:profiles].each_with_index do |profile, index|
      output << "#{index + 1}. #{profile[:name]} - #{profile[:role]}"
      output << "   #{profile[:description]}"
      output << ""
    end
    
    output << "✅ Pod created with #{pod_structure[:profiles].length} members"
    output << ""
    
    output.join("\n")
  end
end
