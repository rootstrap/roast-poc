require "roast"
require "roast/workflow/configuration_loader"
require "roast/workflow/workflow_runner"
require "roast/workflow/configuration"

class GrowthAgentWorkflow
  def initialize
    @workflow_path = "#{Rails.root}/app/workflows/growth_agent_wf/workflow.yml"
  end

  def execute
    # Create configuration object from the workflow file
    configuration = Roast::Workflow::Configuration.new(@workflow_path)

    # Initialize workflow runner with configuration object
    @workflow_runner = Roast::Workflow::WorkflowRunner.new(configuration)

    # Run the workflow
    @workflow_runner.run_targetless
  end
end
