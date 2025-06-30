# Roast POC

This is a Proof of Concept project demonstrating the integration of the [Roast gem](https://github.com/Shopify/roast/) in a Rails application. The project focuses on using Roast as a Ruby gem rather than a CLI tool.

## Overview

Roast is a powerful gem that helps structure AI workflows. This POC explores how to integrate Roast directly into a Rails application by using its Ruby classes and methods.

## Prerequisites

- Ruby 3.3.8 (managed via rbenv or docker)
- Rails 7.0 or higher
- Bundler

## Setup

1. Clone the repository:
```bash
git clone https://github.com/rootstrap/roast-poc.git
cd roast-poc
```

2. Configure your environment variables:
```bash
cp sample.env .env
```
- Edit `.env` with your configuration values.


3. Install dependencies:
- Create your docker-compose.yml
- Run docker sh
```bash
bundle install
```

## Usage

This POC demonstrates how to use Roast as a Ruby gem. Here's a basic example:

- Create your workflow file on app/workflows
- Create your .yml with specific steps
- Create your step_name.rb or /step_name/prompt.md file with the corresponding code. Be carefull with directories: .rb step should be at same level as .yml; prompt.md inside a folder with step name.
- Call the workflow from rails console to test it.

```ruby
workflow =  CodeAnalysisWorkflow.new
workflow.execute
```


## Contributing

1. Clone the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Roast gem](https://github.com/Shopify/roast/) by Shopify 