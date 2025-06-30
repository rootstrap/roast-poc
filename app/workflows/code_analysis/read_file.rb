
# frozen_string_literal: true

class ReadFile < Roast::Workflow::BaseStep
  def call
    file_path = @resource.target
    puts "DEBUG: Reading file from #{file_path}"
    code = File.read(file_path)
    puts "DEBUG: File content length: #{code.length}"
    puts "DEBUG: First 100 chars: #{code[0..100]}"
    
    code
  end
end